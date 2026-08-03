#!/usr/bin/env python3
"""Download SmolLM2-1.7B model and SmolTalk dataset, convert to messages JSONL."""

import json
import os
import argparse


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--output_dir", default="/lus/flare/projects/ATPESC2026/LLM_post-training/data")
    parser.add_argument("--model_dir", default="/lus/flare/projects/ATPESC2026/LLM_post-training/models/SmolLM2-1.7B")
    parser.add_argument("--model_repo", default="HuggingFaceTB/SmolLM2-1.7B")
    parser.add_argument("--dataset_repo", default="HuggingFaceTB/smoltalk")
    parser.add_argument("--subset", default="all",
                        help="Dataset subset (default: 'all')")
    args = parser.parse_args()

    os.makedirs(args.output_dir, exist_ok=True)

    from huggingface_hub import snapshot_download
    if not os.path.exists(args.model_dir):
        print(f"Downloading model {args.model_repo} to {args.model_dir}...")
        snapshot_download(repo_id=args.model_repo, local_dir=args.model_dir)
    else:
        print(f"Model already exists at {args.model_dir}, skipping download.")

    train_path = os.path.join(args.output_dir, "smoltalk_train.jsonl")
    test_path = os.path.join(args.output_dir, "smoltalk_test.jsonl")

    if os.path.exists(train_path) and os.path.exists(test_path):
        print(f"Dataset already exists at {args.output_dir}, skipping download.")
    else:
        from datasets import load_dataset
        print(f"Downloading {args.dataset_repo} (subset={args.subset})...")
        ds = load_dataset(args.dataset_repo, args.subset)

        for split in ["train", "test"]:
            if split not in ds:
                continue
            out_path = os.path.join(args.output_dir, f"smoltalk_{split}.jsonl")
            count = skipped = 0
            with open(out_path, "w") as f:
                for example in ds[split]:
                    msgs = example.get("messages")
                    if not msgs or len(msgs) < 2:
                        skipped += 1
                        continue
                    f.write(json.dumps({"messages": msgs}) + "\n")
                    count += 1
            print(f"  {split}: {count} conversations written to {out_path} ({skipped} skipped)")


if __name__ == "__main__":
    main()
