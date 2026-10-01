# Mushroom Classification

*Predictive Analytics and Machine Learning using Python coursework: "Unveiling Mushroom Mysteries".*

## Part 1: Decision-tree maths by hand (10-sample toy set)
- Entropy of the balanced set = **1.0 bit**
- Information gain of Cap-Color = 1.000 − 0.486 = **0.514 bits**, the best first split (3 of the 4 child nodes are pure)
- Next split in the mixed `y` branch: Cap-Shape and Habitat **tie at IG = 0.971** (both give pure leaves); Odor gives only 0.171
- Random-guess baseline error = 2·p₁·p₂ = **50%**

## Part 2: Machine learning on the full dataset

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
| Support Vector Classifier | 0.992 | 0.991 |
| Logistic Regression | 0.955 | 0.953 |
| Gaussian Naive Bayes | 0.922 | 0.921 |

Poisonous is the positive class, so **recall** is the safety-critical metric: a false negative means a poisonous mushroom is labelled edible. Logistic Regression (recall 0.950) and Naive Bayes (0.940) miss poisonous mushrooms, and the tree ensembles miss none. Random Forest is chosen over a single tree because it is less prone to overfitting.

## Limitations
- 100% accuracy shows that this dataset is close to deterministic. It does not mean the model generalises to real foraging decisions.
- Label encoding gives nominal categories a false order. This affects linear and distance-based models. One-hot encoding would be the better choice for those.
- A single train/test split was used. Cross-validation would give a more robust estimate.
