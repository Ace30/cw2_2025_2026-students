#!/bin/bash

# Script to evaluate all trained models on the test set
# Usage: ./evaluate_models.sh

cd "$(dirname "$0")"

echo "Evaluating models on test set..."

# Evaluate small model
echo "Evaluating small model..."
python3 test.py \
    --checkpoint-path ./models/small/nmt.model \
    --output-file ./outputs/small_results.json

# Evaluate medium model
echo "Evaluating medium model..."
python3 test.py \
    --checkpoint-path ./models/medium/nmt.model \
    --output-file ./outputs/medium_results.json

# Evaluate large model
echo "Evaluating large model..."
python3 test.py \
    --checkpoint-path ./models/large/nmt.model \
    --output-file ./outputs/large_results.json

echo "All evaluations completed!"

