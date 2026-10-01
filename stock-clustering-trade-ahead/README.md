# Stock Segmentation with Clustering (Trade & Ahead)

**Question:** Can NYSE stocks be grouped by their financial profile to build diversified, risk-based portfolios?

**Data:** 340 S&P/NYSE stocks, 10 indicators: price, 13-week price change, volatility, ROE, cash ratio, net cash flow, net income, EPS, P/E, P/B. → [`data/stock_data.csv`](data/stock_data.csv)

## Method
EDA by sector → standardisation → K-means (elbow method, k = 4) → hierarchical clustering (cophenetic correlation to choose linkage) → cluster profiling.

## K-means segments (verified)
| Cluster | Stocks | Profile (medians) | Main sectors |
|---|---|---|---|
| Stable core | 279 | Positive earnings, low volatility, P/E ≈ 19 | Industrials, Financials, Consumer Discretionary |
| Distressed / high-risk | 29 | Price change −13%, negative net income and EPS, highest volatility | Energy (21 of 29) |
| Cash-rich growth | 25 | Price ≈ $120, +14% price change, cash ratio ≈ 221 | Health Care, IT |
| ROE outliers | 7 | ROE ≈ 600 (low equity base) | Mixed |

## Findings
- **Energy concentration:** the Energy concentration in the distressed cluster matches the 2014–16 oil-price fall. This is useful for energy-sector risk screening.
- **Hierarchical clustering adds little here:** with average linkage and 4 clusters it puts 336 of 340 stocks in one group, so it mainly isolates outliers. K-means is more useful.
- **Use for portfolios:** risk-averse clients → stable core; growth → cash-rich growth; avoid or hedge → distressed cluster.

## Review fix (2026)
The original write-up mixed up the cluster numbers (for example, it called the 7-stock outlier cluster "the stable backbone"). The notebook has a correction note, and this table uses the verified profiles.

*Course project: Unsupervised Learning (Great Learning PGP-DSBA).*
