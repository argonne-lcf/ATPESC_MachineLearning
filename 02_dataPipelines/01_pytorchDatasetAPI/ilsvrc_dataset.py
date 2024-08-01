#!/bin/env python

# Example of large scale dataset processing in PyTorch.
# Processes the ImageNet dataset into a one-hot classificaiton
# dataset.
#
# ImageNet is a mixture of images, with 1000 labeled classes.
# Each image can have one or more class objects.
# The annotations for each image includes class ID and bounding
# box dimensions. The functions below use these bounding boxes
# to chop up the original images to create single images
# corresponding to single class labels. This simplifies the
# network needed to label the data, but effects the final
# network accuracy.
#
# questions? Taylor Childers, jchilders@anl.gov

import logging
import os
import glob
import time
import sys
import json
from PIL import Image as PIL_Image
import torch
import torchvision
import numpy as np
import xml.etree.ElementTree as ET
from argparse import ArgumentParser
import torch.distributed as dist
from torch.nn.parallel import DistributedDataParallel as DDP
from torch.utils.data.distributed import DistributedSampler

logger = logging.getLogger(__name__)

class Dataset(torch.utils.data.Dataset):
    def __init__(self, filelist, config):
        self.config = config
        self.resize_shape = config['data']['crop_image_size']
        self.filelist = filelist
        self.len = len(self.filelist)
        self.labels_hash = self.get_label_tables(config['data']['train_filelist'])

    ## Create a hash table for labels from string to int 
    @staticmethod
    def get_label_tables(filelist):

        # get the first filename
        with open(filelist) as file:
            filepath = file.readline().strip()

        # parse the filename to extract the "n02537312" string
        # from the full path which is assumed to be similar to this
        # /.../ILSVRC/Data/CLS-LOC/train/n02437312/n02437312_8688.JPEG
        # and convert that string to a unique value from 0-999

        # this extracts the path up to: /.../ILSVRC/Data/CLS-LOC/train/
        label_path = '/'.join(filepath.split('/')[:-2])
        # this globs for all the directories like "n02537312" to get 
        # list of the string labels
        labels = glob.glob(label_path + os.path.sep + '*')
        logger.debug(f'num labels: {len(labels)}')
        # this removes the leading path from the label directories
        labels = [os.path.basename(i) for i in labels]
        
        # create map from text to number
        labels_hash = {label: i for i, label in enumerate(labels)}
        return labels_hash

    @classmethod
    def from_filelist(cls, filelist_filename, config):
        with open(filelist_filename) as file:
            filelist = [line.strip() for line in file if line.strip()]
        return cls(filelist, config)

    def __getitem__(self, index):
        filename = self.filelist[index]
        imgs, labels = self.read_jpeg(filename)
        return imgs, labels

    def __len__(self):
        return self.len

    def read_jpeg(self, filename):
        try:
            label = filename.split('/')[-2]
            annotation_filename = filename.replace('Data', 'Annotations').replace('JPEG', 'xml')
            # open the JPEG
            img = PIL_Image.open(filename).convert(mode='RGB')
            # convert to a tensor with NCHW
            #img = torchvision.transforms.functional.to_tensor(img)

            # open the annotation file and retrieve the bounding boxes and indices
            bounding_boxes = self.get_bounding_boxes(annotation_filename)
            
            # crop based on bonuding boxes and resize to same size
            if bounding_boxes is not None:
                imgs = self.crop_and_resize(img, bounding_boxes, self.resize_shape)
                # only use the first image
                img = imgs[0]
            else:
                img = torchvision.transforms.Resize(self.resize_shape)(img)
                img = torchvision.transforms.functional.to_tensor(img)
            
            imgs = torch.unsqueeze(img, 0)
            
            # convert string label to numerical label
            label = self.labels_hash[label]
            # duplicate labels to match the number of images created from bounding boxes
            labels = torch.full([imgs.shape[0]], label)
            # return images and labels
            return imgs, labels
        except Exception as e:
            logger.exception(f'Error processing file {filename}: {e}')
            raise

    @staticmethod
    def crop_and_resize(image, bounding_boxes, resize_shape):
        imgs = []
        for bb in bounding_boxes:
            cropped_img = image.crop((bb[1], bb[0], bb[3], bb[2]))
            resized_img = torchvision.transforms.Resize(resize_shape)(cropped_img)
            imgs.append(torchvision.transforms.functional.to_tensor(resized_img))
        imgs = torch.stack(imgs)
        return imgs

    @staticmethod
    def get_bounding_boxes(filename):

        logger.debug(filename)
        try:
            tree = ET.parse(filename)
            root = tree.getroot()
            objs = root.findall('object')
            bndbxs = [[int(obj.find('bndbox').find(dim).text) for dim in ['ymin', 'xmin', 'ymax', 'xmax']] for obj in objs]
            return np.asarray(bndbxs, np.int64)
        except FileNotFoundError:
            logger.debug(f'Annotation file not found: {filename}')
            return None

def get_datasets(config):
    # this function creates the tf.dataset.Dataset objects for each list
    # of input JPEGs.
    train_ds = Dataset.from_filelist(config['data']['train_filelist'], config)
    valid_ds = Dataset.from_filelist(config['data']['test_filelist'], config)
    return train_ds, valid_ds


def setup(rank, world_size):
    os.environ['MASTER_ADDR'] = os.environ['MASTER_ADDR']
    os.environ['MASTER_PORT'] = os.environ['MASTER_PORT']

    # initialize the process group
    dist.init_process_group("nccl", rank=rank, world_size=world_size)

def cleanup():
    dist.destroy_process_group()

def main():

    DEFAULT_LOCAL_RANK = int(os.environ.get('PMI_LOCAL_RANK',0))
    DEFAULT_LOCAL_SIZE = int(os.environ.get('PMI_LOCAL_SIZE',1))
    DEFAULT_RANK = int(os.environ.get('PMI_RANK',0))
    DEFAULT_SIZE = int(os.environ.get('PMI_SIZE',1))

    print(f'local_rank: {DEFAULT_LOCAL_RANK}, local_size: {DEFAULT_LOCAL_SIZE}, rank: {DEFAULT_RANK}, size: {DEFAULT_SIZE}')

    parser = ArgumentParser(description='PyTorch Dataset Example')
    parser.add_argument('-c', '--config', dest='config_filename', required=True, help='Configuration filename in JSON format')
    parser.add_argument('-l', '--logdir', dest='logdir', default='logdir', help='Log output directory')
    parser.add_argument('-n', '--nsteps', dest='nsteps', default=10, type=int, help='Number of steps to run')
    parser.add_argument('-t', '--nthreads', default=0, type=int, help='Number of threads, if set overrides config file')
    parser.add_argument('--debug', action='store_true', help='Debug mode')
    args = parser.parse_args()


    logging_format = '%(asctime)s %(levelname)s:%(process)s:%(thread)s:%(name)s:%(message)s'
    logging_datefmt = '%Y-%m-%d %H:%M:%S'
    logging.basicConfig(level=logging.INFO if not args.debug else logging.DEBUG,
                        format=logging_format,
                        datefmt=logging_datefmt,
                        stream=sys.stdout)

    # parse config file
    with open(args.config_filename) as f:
        config = json.load(f)

    if args.nthreads > 0:
        config['data']['num_parallel_readers'] = args.nthreads

    setup(DEFAULT_RANK, DEFAULT_SIZE)
    torch.cuda.set_device(DEFAULT_LOCAL_RANK)
    device = torch.device(f'cuda:{DEFAULT_LOCAL_RANK}')
    logger.info(f'Using device {device}')

    # call function to build dataset objects
    # both of the returned objects are tf.dataset.Dataset objects
    trainds, testds = get_datasets(config)

    ## create samplers for these datasets
    train_sampler = DistributedSampler(trainds, num_replicas=DEFAULT_SIZE, rank=DEFAULT_RANK, shuffle=True, drop_last=True)
    test_sampler = DistributedSampler(testds, num_replicas=DEFAULT_SIZE, rank=DEFAULT_RANK, shuffle=True, drop_last=True)

    batch_size = config['data']['batch_size']
    train_loader = torch.utils.data.DataLoader(trainds, shuffle=False, sampler=train_sampler,
                                               num_workers=config['data']['num_parallel_readers'],
                                               batch_size=batch_size, persistent_workers=True)
    test_loader = torch.utils.data.DataLoader(testds, shuffle=False, sampler=test_sampler,
                                              num_workers=config['data']['num_parallel_readers'],
                                              batch_size=batch_size, persistent_workers=True)

    # Assuming there is a model defined somewhere
    # model = YourModel()
    # model = model.to(device)
    # model = DDP(model, device_ids=[args.local_rank], output_device=args.local_rank)

    for epoch in range(1):
        if DEFAULT_RANK == 0:
            logger.info(f'Epoch: {epoch}')

        # calling this is required to get the shuffle to work and to reset the dataset 
        train_sampler.set_epoch(epoch)
        # can iterate over a dataset object
        start = time.time()
        for batch_number, (inputs, labels) in enumerate(train_loader):
            inputs, labels = inputs.to(device), labels.to(device)
            logger.info(f'Batch {batch_number}: input shape = {inputs.shape}, labels shape = {labels.shape}')
            logger.info(f'Batch {batch_number}: labels = {np.squeeze(labels[0:10].cpu().numpy()).tolist()}')
            if batch_number > args.nsteps:
                break

        duration = time.time() - start
        images_processed = batch_size * args.nsteps
        if DEFAULT_RANK == 0:
            logger.info(f'Images/sec/rank: {images_processed / duration :.2f}')

    cleanup()

if __name__ == '__main__':
    main()
