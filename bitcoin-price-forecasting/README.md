# Bitcoin Next-Day Price Prediction (and why it fails)

**Question:** Can Random Forest, Linear Regression or KNN predict Bitcoin's next-day closing price from price, volume and moving averages?

**Data:** Daily BTC-USD OHLCV, June 2019 – August 2022 (1,151 days). → [`data/Bitcoin.csv`](data/Bitcoin.csv)

## Method
- **Features:** price change, high–low spread, 7- and 30-day moving averages. Selected with RFE and LASSO.
- **Models:** Random Forest, Linear Regression, KNN, scored by RMSE.
- **Evaluation in two phases:**
  1. Random 80/20 split (original analysis).
  2. Time-ordered split, with a naive baseline (*tomorrow = today*).

## Results
| Model | RMSE, random split | RMSE, time-ordered split (Jan–Aug 2022) |
|---|---|---|
| Naive: tomorrow = today | – | **1,206** |
| Linear Regression | 1,128 | 1,216 |
| Random Forest | 1,322 | 3,288 |
| KNN | 7,580 | 16,699 |

Direction accuracy (up or down) of the best model: **48%**.

## Conclusion
- **No model beats the naive forecast.** Linear Regression simply learns that *tomorrow ≈ today*.
- **Tree and KNN models fail on new data.** They cannot predict prices outside the range they were trained on, which a time-ordered split exposes.
- **The random-split results were misleading.** Consecutive prices are almost identical, so a random split makes any model look accurate.

The lesson for forecasting work: always use a time-ordered split and compare against a naive baseline.

**Next steps:** model returns instead of price levels, walk-forward validation, external drivers.

*Course project: Predictive Analytics and Machine Learning using Python (2025).*
