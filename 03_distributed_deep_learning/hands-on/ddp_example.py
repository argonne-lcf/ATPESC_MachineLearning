# train_ddp.py
import os
import argparse
import torch
import torch.distributed as dist
from torch.utils.data import Dataset, DataLoader, DistributedSampler

# Optional: Intel and oneCCL
import intel_extension_for_pytorch as ipex
import oneccl_bindings_for_pytorch

class SimpleCNN(torch.nn.Module):
    def __init__(self):
        super().__init__()
        # Two conv layers with a pooling to match 9216 features
        self.conv1 = torch.nn.Conv2d(1, 32, kernel_size=3, stride=1)
        self.conv2 = torch.nn.Conv2d(32, 64, kernel_size=3, stride=1)
        self.pool = torch.nn.MaxPool2d(kernel_size=2)
        self.relu = torch.nn.ReLU()
        self.flatten = torch.nn.Flatten()
        # After conv: 28x28->26x26->24x24->pool->12x12 => 64*12*12 = 9216
        self.fc1 = torch.nn.Linear(64 * 12 * 12, 128)
        self.fc2 = torch.nn.Linear(128, 10)

    def forward(self, x):
        x = self.relu(self.conv1(x))  # 1->32, 28->26
        x = self.relu(self.conv2(x))  # 32->64, 26->24
        x = self.pool(x)              # 24->12
        x = self.flatten(x)           # batch x 9216
        x = self.relu(self.fc1(x))    # 9216->128
        x = self.fc2(x)               # 128->10
        return x

class RandomDataset(Dataset):
    """
    A simple dataset that returns random tensors and labels.
    No external downloads or torchvision required.
    """
    def __init__(self, length, channels=1, height=28, width=28, num_classes=10):
        self.length = length
        self.shape = (channels, height, width)
        self.num_classes = num_classes

    def __len__(self):
        return self.length

    def __getitem__(self, idx):
        data = torch.randn(self.shape)
        target = torch.randint(0, self.num_classes, (1,)).item()
        return data, target


def get_mpi_env():
    rank = os.environ.get("OMPI_COMM_WORLD_RANK") or os.environ.get("PMI_RANK") or os.environ.get("PALS_RANKID")
    size = os.environ.get("OMPI_COMM_WORLD_SIZE") or os.environ.get("PMI_SIZE") or os.environ.get("PALS_WORLD_SIZE")
    local = os.environ.get("OMPI_COMM_WORLD_LOCAL_SIZE") or os.environ.get("PMI_LOCAL_SIZE") or os.environ.get("PALS_LOCAL_SIZE")

    rank = int(rank) if rank is not None else 0
    size = int(size) if size is not None else 1
    local = int(local) if local is not None else 1
    return rank, size, local


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--epochs", type=int, default=5)
    parser.add_argument("--batch-size", type=int, default=64)
    parser.add_argument("--dataset-size", type=int, default=10000,
                        help="number of samples in the synthetic dataset")
    args = parser.parse_args()
    
    # MPI/launcher env
    rank, world_size, local_size = get_mpi_env()
    torch.xpu.set_device(f"xpu:{rank % local_size}")

    dist.init_process_group(
        backend="ccl",
        init_method="env://",
        world_size=world_size,
        rank=rank,
    )

    # synthetic dataset
    dataset = RandomDataset(length=args.dataset_size)
    sampler = DistributedSampler(dataset,
                                 num_replicas=world_size,
                                 rank=rank,
                                 shuffle=True)
    loader = DataLoader(dataset,
                        batch_size=args.batch_size,
                        sampler=sampler)

    model = SimpleCNN().xpu()
    model = torch.nn.parallel.DistributedDataParallel(
        model, device_ids=[rank % local_size]
    )
    criterion = torch.nn.CrossEntropyLoss().xpu()
    optimizer = torch.optim.Adam(model.parameters(), lr=1e-3 * world_size)

    for epoch in range(1, args.epochs + 1):
        sampler.set_epoch(epoch)
        model.train()
        total_loss = 0.0
        for batch_idx, (data, target) in enumerate(loader, 1):
            data = data.xpu(non_blocking=True)
            target = target.xpu(non_blocking=True)
            optimizer.zero_grad()
            output = model(data)
            loss = criterion(output, target)
            loss.backward()
            optimizer.step()
            total_loss += loss.item()

        if rank == 0:
            avg = total_loss / batch_idx
            print(f"Epoch {epoch} | Avg Loss: {avg:.4f}")

    dist.destroy_process_group()

if __name__ == "__main__":
    main()

