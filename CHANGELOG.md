# Portfolio Change Log

**Author:** Kevin Selorm Mensah · Changes made with assistance from Claude (Anthropic) · Last updated: 1 October 2026

## 1. Summary
- 16 projects published, starting from an empty repository.
- 1 security issue fixed: a hard-coded API token was removed before publishing.
- Wrong conclusions or wrong numbers corrected in 11 projects; 2 unfinished projects completed.
- All numbers in the READMEs were checked against the data or the notebook outputs.

## 2. Repository setup
- Main README: portfolio index with the dissertation featured first, a project table, tools list, run instructions and contact email.
- `requirements.txt` with all Python libraries used.
- `.gitignore` for checkpoints, caches, secrets (`.env`) and stray CSV files.
- Removed Colab user identity metadata from every notebook.
- Changed Google Drive file paths to relative `data/` paths so the notebooks run for anyone.

## 3. Changes per project

### Afrohouse Global Influence Network (MSc dissertation)

**Added**
- Added the final notebook and featured it at the top of the portfolio.
- Added an introduction cell and 9 section headings to the notebook.
- Wrote the README from the dissertation: research questions, method, network metrics (2,988 artists, 4,744 ties), top-5 artist table, findings, reproducibility note.

**Fixed or corrected**
- Spotify credentials kept out of the code (entered at run time with getpass).
- Documented that a January 2026 re-run gives slightly different counts (3,085 artists / 4,848 ties), so readers are not confused.

### African CO₂ Emissions (data cleaning and QC)

**Fixed or corrected**
- Fixed country names that did not match ISO3 codes (manual overrides; 0 unmatched).
- Flagged and set to missing the implausible Mali values for 1990–97.
- Logged data gaps: Côte d'Ivoire missing; Mali 1998–99, Eritrea 1990–91, Namibia 1990.
- Flagged suspicious year-on-year jumps: Equatorial Guinea 1992, Benin 1996, Cameroon 1991.

### Employee Attrition Dashboard (Tableau, HR)

**Added**
- README with KPIs, the 5 calculated fields, parameters, dashboard and heatmap images.
- Added the Tableau Public link and course context.
- Added an "attrition drivers" table checked in Python against the IBM dataset.

**Fixed or corrected**
- Separated "share of leavers" from "attrition rate" (the original report mixed them).
- Corrected role figures: Lab Technicians 26.2% of leavers, Sales Executives 24.1%; highest rate is Sales Representatives at 39.8%.

### Adidas Sales Dashboard (Tableau)

**Added**
- New project page from the original report: Tableau Public link, dataset, stakeholders, data preparation, 5 dashboard parts, 12 calculated fields.
- Added to the portfolio index.

**Fixed or corrected**
- Documented the target logic flaw: target = actual × 1.05, so achievement is always about 95.2%.
- Calculated fields listed by name; formulas to be added from the workbook.

### Big Data Pipeline (Hadoop, Hive, PySpark)

**Added**
- Hive table DDL (hive_query.sql) with improvement comments.
- Screenshots of Hive on YARN and PySpark reading from HDFS.
- Stack versions, Spark vs Hive timing table (about 3 s vs 12 s), and the problems solved (HDFS permissions, ARM images, Beeline networking).

**Fixed or corrected**
- Corrected "local Hadoop cluster" to Spark local mode.
- Flagged that the data is synthetic (average salary the same in every group) and that CustomerID 4 has a salary typo (2,600, probably 26,000).
- Noted that 80% accuracy must be compared with the majority-class baseline.
- Noted the timing comparison is a single run and includes Hive start-up time.

### Telecom MySQL Database

**Added**
- ERD, schema and sample data, 11 tested analysis queries, a stored procedure, and data-quality checks.
- Ran the full script in MariaDB to confirm it works.

**Fixed or corrected**
- Active customers: counted subscriptions (24) instead of people. Fixed to 22.
- Inactive customers: listed people with an active line on another number, plus duplicates (12 rows). Fixed to 8.
- Stored procedure: date format "%y-%m" never matched "2025-06", so it returned everyone. Fixed to "%Y-%m".
- Revenue column was labelled "May" but bills are June. Fixed.

### Hospital Management SQL App

**Added**
- Notebook and README: architecture, 5 SQL KPIs, parameterised queries.

**Fixed or corrected**
- Removed a hard-coded API token (now read from an environment variable).
- Removed install logs and the public tunnel URL from the outputs.

### A/B Test: Landing Page (E-news Express)

**Added**
- New project: notebook re-run with the data included, README with a results table.

**Fixed or corrected**
- The original conclusion said the new page was not better. The tests show it is: conversion 66% vs 42% (p = 0.008), +1.7 minutes on page (p = 0.0001). Conclusion rewritten.
- Removed a paragraph that said the result was "nan".
- Time test changed to one-sided, matching the question.
- Language test (ANOVA) changed to new-page users only, as the question asks (p = 0.43).

### Sensor Quality Prediction (KC Roasters)

**Added**
- New project: notebook, data, README, and a leakage-check script (time_split_check.py).

**Fixed or corrected**
- Found time-order leakage: readings are consecutive (lag-1 autocorrelation 0.96). R² 0.92 on a random split falls to about −0.05 on a time-ordered split.
- Corrected the claim that all models scored above 0.84 (Gradient Boosting 0.65, XGBoost 0.54).

### Stock Segmentation (Trade & Ahead)

**Added**
- New project: notebook, data, README with verified cluster profiles.

**Fixed or corrected**
- The write-up mixed up cluster numbers (called the 7-stock outlier group the "stable backbone"). Added a correction note and the correct table.
- Noted that hierarchical clustering put 336 of 340 stocks in one cluster, so it adds little.

### Bitcoin Price Forecasting

**Added**
- New project: notebook re-run with data, plus a "Phase 4" honest evaluation section.

**Fixed or corrected**
- Added a time-ordered split and a naive baseline. No model beats "tomorrow = today"; direction accuracy 48%.
- Chart used typed-in RMSE values that did not match the results. Now uses the computed values.
- Fixed an undefined variable ("features") and sorted the data by date before creating the target.

### Hotel Cancellation Prediction (INN Hotels)

**Added**
- Added EDA answers, VIF check, p-value elimination, odds ratios, threshold tuning, pre- and post-pruned decision trees, model comparison, and recommendations.
- README with results table and policy recommendations.

**Fixed or corrected**
- Numeric columns were one-hot encoded (each lead_time value became a dummy). Now only categorical columns are encoded.
- Code relied on variables defined out of order. Fixed so it runs top to bottom.
- EDA notes said special requests and price had no effect. Corrected: cancellations fall from 43% (no requests) to 0% (3+), and prices differ by segment.
- Final model: pre-pruned tree, recall 0.85, ROC-AUC 0.93.

### ReneWind: Wind-Turbine Failure Prediction

**Added**
- Added a maintenance-cost metric (replacement vs repair vs inspection) to choose the final model.
- README with results and recommendations.

**Fixed or corrected**
- Tuning on recall alone increased false alarms, so the untuned XGBoost was added as a reference and won on cost.
- Final model on the test set: recall 0.84, precision 0.89; about 51% lower maintenance cost under the stated cost assumption.

### Social Media Engagement Clustering

**Added**
- Notebook and README enriched from the original FDA report.

**Fixed or corrected**
- Corrected the missing-value counts in the README (Paid 1, like 1, share 4).

### Mushroom Classification

**Added**
- Notebook and README with the entropy and information-gain maths and the full 7-model comparison table.

