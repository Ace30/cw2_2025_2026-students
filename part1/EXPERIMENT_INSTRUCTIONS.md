# Part I Experiment Instructions

## Completed Steps

### ✅ Step 0: Build Vocabulary
- Vocabulary has been built by running `vocab.py`
- Vocabulary file saved to `vocab/vocab.json`

### ✅ Step 1: Implement Dot-Product Attention
- Dot-product attention has been implemented in the `step()` method of `nmt_model.py`
- Implementation passes all sanity checks (`sanity_check.py`)

## Next Steps

### Step 2: Train Models with Different Hyperparameters

Three model configurations have been created:
- **Small**: `model_config_small.yaml` (embed_size=16, hidden_size=16)
- **Medium**: `model_config_medium.yaml` (embed_size=64, hidden_size=64)
- **Large**: `model_config_large.yaml` (embed_size=128, hidden_size=128)

#### Option 1: Run all experiments using the script
```bash
cd /Users/varshit/Desktop/NLP_CW_2/cw2_2025_2026-students/part1
./run_experiments.sh
```

#### Option 2: Run experiments individually

**Small Model:**
```bash
python3 train.py \
    --model-config model_config_small.yaml \
    --train-config train_config.yaml \
    --wandb-project nmt-project \
    --wandb-run-name seq2seq-small \
    --checkpoint-path ./models/small
```

**Medium Model:**
```bash
python3 train.py \
    --model-config model_config_medium.yaml \
    --train-config train_config.yaml \
    --wandb-project nmt-project \
    --wandb-run-name seq2seq-medium \
    --checkpoint-path ./models/medium
```

**Large Model:**
```bash
python3 train.py \
    --model-config model_config_large.yaml \
    --train-config train_config.yaml \
    --wandb-project nmt-project \
    --wandb-run-name seq2seq-large \
    --checkpoint-path ./models/large
```

**Note:** 
- Training can take a long time (especially for larger models)
- Make sure you have set up Weights & Biases (W&B) - the script will prompt you for your API key on first run
- You can monitor training progress in your W&B dashboard

### Step 3: Evaluate Models on Test Set

After training is complete, evaluate each model:

#### Option 1: Run all evaluations using the script
```bash
./evaluate_models.sh
```

#### Option 2: Run evaluations individually

**Small Model:**
```bash
python3 test.py \
    --checkpoint-path ./models/small/nmt.model \
    --output-file ./outputs/small_results.json
```

**Medium Model:**
```bash
python3 test.py \
    --checkpoint-path ./models/medium/nmt.model \
    --output-file ./outputs/medium_results.json
```

**Large Model:**
```bash
python3 test.py \
    --checkpoint-path ./models/large/nmt.model \
    --output-file ./outputs/large_results.json
```

## Results Summary

After running all experiments, you will have:
1. Three trained models in `./models/small/`, `./models/medium/`, and `./models/large/`
2. Three result files in `./outputs/` with BLEU scores
3. Training and dev loss curves in your W&B dashboard

## For Canvas Submission

You will need to:
1. Create a table summarizing your experiments with:
   - Hyperparameters (embed_size, hidden_size)
   - BLEU scores
   - Any other relevant metrics
2. Attach a screenshot from W&B showing training and dev loss curves
3. Write a discussion paragraph comparing model ablations and justifying performance differences

