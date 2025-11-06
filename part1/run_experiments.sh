#!/bin/bash

# Script to run training experiments for different hyperparameter settings
# Usage: ./run_experiments.sh

cd "$(dirname "$0")"

echo "Starting training experiments..."

# Small model (embed_size=16, hidden_size=16)
echo "Training small model (embed_size=16, hidden_size=16)..."
python3 train.py \
    --model-config model_config_small.yaml \
    --train-config train_config.yaml \
    --wandb-project nmt-project \
    --wandb-run-name seq2seq-small \
    --checkpoint-path ./models/small

# Medium model (embed_size=64, hidden_size=64)
echo "Training medium model (embed_size=64, hidden_size=64)..."
python3 train.py \
    --model-config model_config_medium.yaml \
    --train-config train_config.yaml \
    --wandb-project nmt-project \
    --wandb-run-name seq2seq-medium \
    --checkpoint-path ./models/medium

# Large model (embed_size=128, hidden_size=128)
echo "Training large model (embed_size=128, hidden_size=128)..."
python3 train.py \
    --model-config model_config_large.yaml \
    --train-config train_config.yaml \
    --wandb-project nmt-project \
    --wandb-run-name seq2seq-large \
    --checkpoint-path ./models/large

echo "All training experiments completed!"

