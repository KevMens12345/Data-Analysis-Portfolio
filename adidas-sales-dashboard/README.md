# Adidas US Sales Performance Dashboard (Tableau)

**Question:** Where do Adidas US sales and profit come from (region, retailer, product, sales channel), and how does performance track against target?

**Live dashboard:** [Tableau Public](https://public.tableau.com/shared/J7X8N95TS?:display_count=n&:origin=viz_share_link)  
*Course project: Visualization and Storytelling using Tableau (2025).*

**Data:** [Adidas Sales Dataset](https://www.kaggle.com/datasets/heemalichaudhari/adidas-sales-dataset) (Kaggle), US transactions 2020–2021. Fields: Retailer, Retailer ID, Invoice Date, Region, State, City, Product, Units Sold, Total Sales, Operating Profit, Operating Margin, Sales Method.

## Stakeholders
| Stakeholder | Need |
|---|---|
| Head of Sales | Top-level revenue, profit and regional trend |
| Regional managers | Compare states, retailers, channels against target |
| Marketing | Campaign and seasonal effects on revenue and margin |
| Finance | Profitability and input for forecasting |

## Data preparation
- Invoice Date cast to date; Operating Margin cast to decimal.
- Duplicates removed; missing City values checked (no effect on aggregates).
- Sales and profit formatted as USD.

## Dashboard components
1. **KPI card** driven by a `KPI Selector` parameter (Total Sales / Operating Profit / Units Sold).
2. **Monthly trend** line chart with Date Range and Sales Method filters.
3. **State map** coloured by the selected KPI.
4. **Top N chart** (states, products, retailers) with a `Top N` parameter and a rank-based filter.
5. **Target vs actual** dual-axis line chart.

All views follow the same KPI, channel and date controls, and use dynamic titles.

## Calculated fields
`Selected KPI`, `KPI Selector Value`, `Top N Filter`, `Target Sales`, `Target Achievement`, `Sales Growth`, `Profit Margin`, `Average Sales per Retailer`, `Order Month`, `Order Year`, `Date Range Filter`, `Sales Method Filter`.

```
Selected KPI  = CASE [KPI Selector]
                  WHEN "Total Sales"      THEN SUM([Total Sales])
                  WHEN "Operating Profit" THEN SUM([Operating Profit])
                  WHEN "Units Sold"       THEN SUM([Units Sold]) END
Profit Margin = SUM([Operating Profit]) / SUM([Total Sales])
```

## Insights (from the report)
- Sales concentrate in large states (California, Texas, New York).
- Footwear lines rank in the top five for every KPI.
- A small group of retailers produces most of the sales (Pareto pattern).

## Known limitation and next iteration
- **Target logic:** target = actual × 1.05, so achievement is always 1/1.05 ≈ 95.2% and cannot show over- or under-performance. Next version: target = same month of the previous year × 1.05, or a regional budget.
- Static CSV (2020–2021 only); no marketing spend or customer data.
- Add weekly drill-down and a forecast (Python or Tableau forecasting).
