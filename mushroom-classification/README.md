# Mushroom Classification

**Question:** Can physical traits (odor, cap, gill, stalk) predict whether a mushroom is edible or poisonous?

**Data:** UCI Mushroom dataset (Schlimmer, 1987): 8,124 rows, 22 categorical features. The notebook downloads it automatically.

## Steps
1. **Data quality:** No NaN values, but `stalk-root` uses `?` for 2,480 missing values. These are kept as their own category.
2. **EDA:** The classes are balanced (52% edible, 48% poisonous), so accuracy is a valid metric. Odor is the strongest single signal.
3. **Modelling:** Label encoding, 75/25 train/test split, 7 classifiers (Naive Bayes, Logistic Regression, SVC, KNN, Decision Tree, Random Forest, Gradient Boosting).
4. **Evaluation:** Accuracy, precision, recall, F1, and a confusion matrix.

## Results
| Model | Accuracy | F1 |
|---|---|---|
| Random Forest / Decision Tree / Gradient Boosting | 1.000 | 1.000 |
| K-Nearest Neighbors | 0.998 | 0.998 |
| Support Vector Classifier | 0.992 | — |

## Limitations
- 100% accuracy shows that this dataset is close to deterministic. It does not mean the model generalises to real foraging decisions.
- Label encoding gives nominal categories a false order. This affects linear and distance-based models. One-hot encoding would be the better choice for those.
- A single train/test split was used. Cross-validation would give a more robust estimate.
