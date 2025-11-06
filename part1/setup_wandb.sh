#!/bin/bash

# Script to set up W&B API key and start training
# Usage: ./setup_wandb.sh [your_api_key]

if [ -z "$1" ]; then
    echo "Usage: ./setup_wandb.sh [your_wandb_api_key]"
    echo "Or set it as environment variable: export WANDB_API_KEY=your_key"
    exit 1
fi

export WANDB_API_KEY="$1"
echo "W&B API key set. You can now run training scripts."
echo "To make it permanent, add this to your ~/.zshrc or ~/.bashrc:"
echo "export WANDB_API_KEY=\"$1\""


