# Predicting Product Quality from Industrial Sensor Data (KC Roasters)

**Question:** Can roasted-coffee quality (0–100) be predicted from the roasting machine's sensors, to automate quality inspection and pricing?

**Data:** 29,131 consecutive readings: 15 temperature sensors (5 chambers × 3), raw-material height, and humidity. → [`data/kc_roasters.csv`](data/kc_roasters.csv)

## Method
EDA and outlier removal → Decision Tree baseline → tuned Random Forest, Gradient Boosting and XGBoost (RandomizedSearchCV) → feature importance → scikit-learn pipeline.

## Results (random 80/20 split)
| Model | Test R² | Test MSE |
|---|---|---|
| Decision Tree (baseline) | 0.84 | 42.6 |
| **Random Forest (tuned)** | **0.92** | 22.0 |
| Gradient Boosting (tuned) | 0.65 | 93.3 |
| XGBoost (tuned) | 0.54 | 123.9 |

Temperatures in chambers 3 and 4 have the highest feature importance.

## Leakage check (added in review)
The readings are a time series: quality has a lag-1 autocorrelation of **0.96**, and about 0 after shuffling. A random split puts near-identical neighbouring readings in both train and test, which inflates accuracy. [`time_split_check.py`](time_split_check.py) tests this:

| Split | R² | MAE |
|---|---|---|
| Random | 0.92 | 3.3 |
| Time-ordered (last 20% as test) | **−0.05** | 13.9 (predicting the mean: 13.5) |

**Interpretation:** the model does not yet generalise to a later production period. The fix is to use time-series cross-validation, add lag and rolling sensor features, and check for sensor drift between periods. This is the same issue as in any equipment-monitoring or energy-load model.

*Course project: Model Tuning (Great Learning PGP-DSBA).*
