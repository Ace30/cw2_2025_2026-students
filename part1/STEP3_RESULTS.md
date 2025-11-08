# Step 3: Model Evaluation Results

## Part 3a: Results Table

| Model | Embed Size | Hidden Size | Dropout Rate | BLEU Score | Notes |
|-------|------------|-------------|--------------|------------|-------|
| Small | 16 | 16 | 0.2 | 0.00 | Underfitting - model too small to learn meaningful patterns |
| Medium | 64 | 64 | 0.2 | 4.27 | Moderate performance, limited capacity |
| Large | 128 | 128 | 0.2 | 36.14 | Best performance, adequate model capacity |

### Additional Hyperparameters (same for all models):
- **Learning Rate**: 0.001
- **Learning Rate Decay**: 0.5
- **Batch Size**: 32 (train), 128 (dev)
- **Max Epochs**: 30
- **Patience**: 1
- **Max Trials**: 5 (early stopping)

## Part 3b: W&B Screenshots

**Instructions for W&B Screenshots:**
1. Go to https://wandb.ai/goudvarshit658-heriot-watt-university/nmt-project
2. For each run (seq2seq-small, seq2seq-medium, seq2seq-large):
   - Open the run details
   - Navigate to the "Charts" or "Metrics" tab
   - Take a screenshot showing:
     - Training loss over iterations (train_loss)
     - Development loss over iterations (dev_loss)
   - Both metrics should be visible on the same plot or side-by-side

**Expected Observations:**
- **Small model**: Training and dev loss should remain high (likely >5.0) with minimal improvement
- **Medium model**: Gradual decrease in losses, but may plateau at higher values
- **Large model**: Significant decrease in both training and dev loss, reaching lower final values

## Part 3c: Discussion

### Model Ablation Analysis

The experimental results demonstrate a clear relationship between model capacity (embed_size and hidden_size) and translation performance, as measured by BLEU score. The ablation study reveals significant performance differences across the three model configurations:

**Small Model (16/16) - BLEU: 0.00**
The smallest model configuration with 16-dimensional embeddings and hidden states achieved a BLEU score of 0.00, indicating complete failure to learn meaningful translation patterns. This severe underfitting can be attributed to insufficient model capacity. With only 16 dimensions, the model lacks the representational power to capture the complex relationships between English and French sentence structures, vocabulary mappings, and syntactic patterns required for machine translation. The model's limited capacity prevents it from learning the necessary linguistic features, resulting in essentially random or degenerate outputs.

**Medium Model (64/64) - BLEU: 4.27**
Increasing the model size to 64 dimensions resulted in a modest improvement, achieving a BLEU score of 4.27. While this represents a significant improvement over the small model, the performance remains quite low for practical translation tasks. The medium model demonstrates that some learning is occurring, but the capacity is still insufficient to capture the full complexity of the translation task. The model can learn basic word-level correspondences and simple phrase patterns, but struggles with longer dependencies, complex sentence structures, and nuanced translations.

**Large Model (128/128) - BLEU: 36.14**
The large model configuration achieved the best performance with a BLEU score of 36.14, representing an 8.5x improvement over the medium model. This substantial increase demonstrates that 128-dimensional embeddings and hidden states provide sufficient capacity for the model to learn meaningful translation patterns. The larger hidden dimension allows the LSTM encoder to capture longer-range dependencies and more complex sentence structures, while the larger embedding dimension enables richer representations of word semantics and context. The attention mechanism can also leverage these richer representations to better align source and target sequences.

### Key Insights

1. **Capacity-Performance Trade-off**: The results clearly show that model capacity is a critical factor in NMT performance. There appears to be a threshold below which the model cannot learn effectively (between 16 and 64 dimensions), and a point where sufficient capacity enables strong performance (128 dimensions).

2. **Non-linear Scaling**: The improvement from small to medium (0.00 → 4.27) is qualitatively different from medium to large (4.27 → 36.14), suggesting that the relationship between model size and performance is non-linear. The large model benefits from both increased capacity and the ability to leverage that capacity more effectively.

3. **Representational Power**: The dramatic difference between models highlights the importance of having sufficient representational dimensions. The embedding and hidden dimensions work together to create a rich feature space where the model can learn complex mappings between source and target languages.

4. **Practical Implications**: For this dataset and task, a model with at least 128 dimensions appears necessary for reasonable translation quality. Smaller models may be useful for resource-constrained environments but will sacrifice significant translation quality.

### Limitations and Future Work

While the large model achieves the best performance, there may be room for further improvement with even larger models (e.g., the 550/550 configuration) or through other architectural improvements such as deeper networks, different attention mechanisms, or training strategies. However, the current results clearly establish the importance of model capacity as a fundamental hyperparameter in neural machine translation systems.


