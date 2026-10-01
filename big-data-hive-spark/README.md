# Big Data Pipeline: Hadoop, Hive and PySpark

**Goal:** Process a 5-million-row retail customer dataset on a local Hadoop cluster (Docker): store it in HDFS, query it with Hive (Tez on YARN), then repeat the analysis and add an ML pipeline in PySpark.

## Stack
HDFS · Hive (HiveServer2 / Beeline, Tez on YARN) · PySpark (Spark 3.5, Spark SQL, Spark ML) · Docker

## Steps
1. Loaded `retailstore_5mn.csv` (5,015,737 rows: CustomerID, Age, Salary, Gender, Country) into HDFS.
2. **Hive** ([`hive_query.sql`](hive_query.sql)): ran a NULL-safe aggregation by gender and country. On Tez it used 1 map task and 9 reducers and finished in about 12 s.
3. **PySpark** ([`spark_pipeline.py`](spark_pipeline.py)): ran the same aggregation through the DataFrame API, then built a Spark ML pipeline (StringIndexer → OneHotEncoder → VectorAssembler → LogisticRegression) to classify salary > 45k. Accuracy: 80%.

![Hive on YARN](figures/hive_query_yarn.png)

## Data-quality observations
- **Synthetic data:** average salary is about 35,387 in every gender × country group, varying by less than 0.02%.
- **Probable data-entry errors:** some minimum salaries are implausible. The minimum for Male/England is 2,600, while every other group's minimum is between 4,300 and 7,600. The 2,600 is probably a typo for 26,000.

## Limitations
The 80% accuracy has to be compared with the majority-class baseline (the share of salaries ≤ 45k). With identical salary distributions across groups, the features carry almost no signal, so the model probably predicts the majority class. The value of this project is the distributed pipeline, not the model.
