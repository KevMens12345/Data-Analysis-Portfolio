# Hotel Booking Cancellation Prediction (INN Hotels)

**Question:** Which bookings are likely to be canceled, and what policies would reduce lost revenue?

**Data:** 36,275 bookings (2017–2018): lead time, price, segment, room and meal type, special requests, guest history. → [`data/INNHotelsGroup.csv`](data/INNHotelsGroup.csv)

## Key EDA findings
- **32.8%** of bookings are canceled. Repeat guests cancel only **1.7%**.
- **Lead time** is the strongest driver: 14% of bookings made 0–30 days ahead are canceled, vs 74% of bookings made more than 180 days ahead.
- **Special requests:** 43% cancel with none, 15% with two, 0% with three or more.
- **Online bookings** (64% of volume) cancel most (37%) and pay the highest prices (median €107).

## Models (test set, 30% stratified hold-out)
| Model | Recall | Precision | F1 | ROC-AUC |
|---|---|---|---|---|
| Logistic regression (threshold 0.50) | 0.63 | 0.73 | 0.68 | 0.86 |
| Logistic regression (threshold 0.39, best F1) | 0.72 | 0.68 | 0.69 | 0.86 |
| Decision tree (default, overfit: train F1 0.99) | 0.79 | 0.79 | 0.79 | 0.85 |
| **Decision tree (pre-pruned, 5-fold CV)** | **0.85** | 0.75 | **0.80** | **0.93** |
| Decision tree (post-pruned) | 0.84 | 0.76 | 0.80 | 0.92 |

- **Chosen model:** the pre-pruned tree. Its settings were chosen by cross-validation, and train vs test F1 is 0.83 vs 0.80.
- **Logistic regression:** less accurate, but its odds ratios explain the drivers:
  - Each special request: about −77% odds of cancelling.
  - Repeat guest: −95%.
  - Each extra day of lead time: +1.6%.
- **Method details:** checked multicollinearity with VIF, removed predictors with p > 0.05, and chose the threshold from the precision–recall curve.

## Recommendations
1. **Deposits for long lead times:** partial non-refundable deposits or cancellation deadlines for bookings made more than 90 days ahead.
2. **Ask for preferences:** prompt guests for preferences and special requests, since guests who make requests rarely cancel.
3. **Overbooking:** set overbooking levels per night from each booking's predicted cancellation probability.
4. **Online rate:** offer a cheaper non-refundable Online rate.
5. **Loyalty:** grow repeat and direct bookings through a loyalty programme.
6. **Contact high-risk bookings:** reach out 2–3 weeks before arrival, so released rooms can still be resold.

## Review fixes (2026)
- **Fixed the encoding:** the first draft one-hot encoded numeric columns (each `lead_time` value became its own dummy).
- **Fixed the run order:** it used variables before defining them.
- **Completed the empty sections:** pruning, comparison and recommendations.
- **Corrected the EDA notes:** they said special requests and price had no effect, but both clearly do.

*Course project: Supervised Learning – Classification (Great Learning PGP-DSBA).*
