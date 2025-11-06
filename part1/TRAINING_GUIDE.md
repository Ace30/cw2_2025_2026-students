# Training Guide - Step 2

## Setting up W&B API Key

You have two options to set your W&B API key:

### Option 1: Set Environment Variable (Recommended)
```bash
export WANDB_API_KEY="your_api_key_here"
```

To make it permanent, add it to your `~/.zshrc`:
```bash
echo 'export WANDB_API_KEY="your_api_key_here"' >> ~/.zshrc
source ~/.zshrc
```

### Option 2: Use the Setup Script
```bash
./setup_wandb.sh your_api_key_here
```

## Starting Training

Once your API key is set, you can start training:

### Train All Models (Sequentially)
```bash
./run_experiments.sh
```

### Train Individual Models

**Small Model (embed_size=16, hidden_size=16):**
```bash
python3 train.py \
    --model-config model_config_small.yaml \
    --train-config train_config.yaml \
    --wandb-project nmt-project \
    --wandb-run-name seq2seq-small \
    --checkpoint-path ./models/small
```

**Medium Model (embed_size=64, hidden_size=64):**
```bash
python3 train.py \
    --model-config model_config_medium.yaml \
    --train-config train_config.yaml \
    --wandb-project nmt-project \
    --wandb-run-name seq2seq-medium \
    --checkpoint-path ./models/medium
```

**Large Model (embed_size=128, hidden_size=128):**
```bash
python3 train.py \
    --model-config model_config_large.yaml \
    --train-config train_config.yaml \
    --wandb-project nmt-project \
    --wandb-run-name seq2seq-large \
    --checkpoint-path ./models/large
```

## Training in Background

To run training in the background and save output to logs:

```bash
# Small model
nohup python3 train.py \
    --model-config model_config_small.yaml \
    --train-config train_config.yaml \
    --wandb-project nmt-project \
    --wandb-run-name seq2seq-small \
    --checkpoint-path ./models/small > logs/small.log 2>&1 &

# Medium model  
nohup python3 train.py \
    --model-config model_config_medium.yaml \
    --train-config train_config.yaml \
    --wandb-project nmt-project \
    --wandb-run-name seq2seq-medium \
    --checkpoint-path ./models/medium > logs/medium.log 2>&1 &

# Large model
nohup python3 train.py \
    --model-config model_config_large.yaml \
    --train-config train_config.yaml \
    --wandb-project nmt-project \
    --wandb-run-name seq2seq-large \
    --checkpoint-path ./models/large > logs/large.log 2>&1 &
```

## Monitoring Training

- Check W&B dashboard: https://wandb.ai
- Monitor log files: `tail -f logs/small.log`
- Check if training is running: `ps aux | grep train.py`

## Note

Training can take several hours, especially for larger models. The models will automatically save checkpoints when they achieve better dev loss.


