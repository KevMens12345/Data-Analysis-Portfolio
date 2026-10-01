# ReneWind: Predicting Wind-Turbine Generator Failures

**Question:** Can sensor data predict generator failures early enough to repair turbines instead of replacing them?

**Data:** 20,000 training and 5,000 test readings, 40 anonymised sensor features, 5.5% failures. → [`data/`](data/)

## Why recall and cost, not accuracy
| Outcome | Meaning | Cost |
|---|---|---|
| Missed failure (FN) | Generator breaks | **Replacement** (highest) |
| Caught failure (TP) | Repaired in time | Repair |
| False alarm (FP) | Unneeded check | Inspection (lowest) |

A model that never predicts a failure would be 94% accurate and useless. Models are compared on **recall** and on a **maintenance-cost ratio**.

**Assumed relative costs:** replace 40, repair 15, inspect 5. The brief gives only the order of these costs; the values are an assumption.

## Method
1. EDA; median imputation of `V1`/`V2`, fitted on training data only.
2. 7 models (Logistic Regression, Decision Tree, Bagging, Random Forest, AdaBoost, Gradient Boosting, XGBoost), each trained on:
   - original data
   - SMOTE-oversampled data
   - undersampled data

   Scored by 5-fold CV recall and on a validation set.
3. Tuned 3 candidates with RandomizedSearchCV. The final model was chosen by the cost ratio on the validation set.
4. Production pipeline (impute → resample → model), refit on all training data, evaluated once on the untouched test set.

## Results
| Validation | Recall | Precision | Cost ratio (1.0 = perfect) |
|---|---|---|---|
| **XGBoost (SMOTE, default)** | 0.87 | **0.90** | **1.25** |
| Gradient Boosting (SMOTE, tuned) | 0.88 | 0.75 | 1.30 |
| XGBoost (SMOTE, tuned) | 0.88 | 0.74 | 1.31 |
| Random Forest (undersampled, tuned) | 0.90 | 0.51 | 1.46 |

**Final model on the test set:**
- **Recall 0.84, precision 0.89.**
- Catches 236 of 282 failures, with 29 false alarms.
- Under the assumed costs, maintenance cost is **51% lower** than replacing turbines after they fail.

**Lesson:** tuning on recall alone made the models raise more false alarms, so the default XGBoost beat the tuned ones on cost. Next step: tune with a cost-based scorer.

## Recommendations
1. **Rank turbines daily by failure risk** and send inspection crews to the top of the list.
2. **Re-set the alert threshold** using ReneWind's real repair, replacement and inspection costs.
3. **Monitor recall on confirmed failures and retrain regularly**, because sensors drift.
4. **Collect timestamps and turbine IDs.** That would allow predicting how far ahead a failure is, and validating the model over time.

*Course project: Model Tuning (Great Learning PGP-DSBA). Completed and re-run in 2026.*
