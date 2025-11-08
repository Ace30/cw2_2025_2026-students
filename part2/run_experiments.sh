#!/bin/bash

# Script to run training experiments for different hyperparameter settings
# Usage: ./run_experiments.sh

cd "$(dirname "$0")"

echo "Starting training experiments..."

# Small model (embed=16, heads=2, layers=2)
echo "Training small model (embed=16, heads=2, layers=2)..."
python3 train.py \
    --model-config model_config_small.yaml \
    --train-config train_config.yaml \
    --wandb-project nmt-project \
    --wandb-run-name transformer-small \
    --checkpoint-path ./models/small

# Medium model (embed=64, heads=4, layers=4)
echo "Training medium model (embed=64, heads=4, layers=4)..."
python3 train.py \
    --model-config model_config_medium.yaml \
    --train-config train_config.yaml \
    --wandb-project nmt-project \
    --wandb-run-name transformer-medium \
    --checkpoint-path ./models/medium

# Large model (embed=192, heads=6, layers=6)
echo "Training large model (embed=192, heads=6, layers=6)..."
python3 train.py \
    --model-config model_config_large.yaml \
    --train-config train_config.yaml \
    --wandb-project nmt-project \
    --wandb-run-name transformer-large \
    --checkpoint-path ./models/large

echo "All training experiments completed!"

