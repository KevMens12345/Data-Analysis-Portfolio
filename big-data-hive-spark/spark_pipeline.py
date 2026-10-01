"""PySpark: same aggregation as Hive, plus a Spark ML pipeline. Input is read from HDFS."""
from pyspark.sql import SparkSession
from pyspark.sql.functions import avg, count, max, min
from pyspark.ml import Pipeline
from pyspark.ml.feature import StringIndexer, OneHotEncoder, VectorAssembler
from pyspark.ml.classification import LogisticRegression
from pyspark.ml.evaluation import MulticlassClassificationEvaluator

spark = SparkSession.builder.appName("Test Spark").getOrCreate()

df = (spark.read.option("header", "true").option("inferschema", "true")
      .csv("hdfs://namenode:8020/bigdata/input/retailstore_5mn.csv"))
df.printSchema()
print("Total records:", df.count())            # 5,015,737

df_cleaned = df.dropna()
(df_cleaned.groupBy("Gender", "Country")
    .agg(count("*").alias("Num_Records"), avg("Salary").alias("avg_salary"),
         max("Salary").alias("Max_Salary"), min("Salary").alias("Min_Salary"))
    .orderBy("Country").show(truncate=False))

# Classify high earners (salary > 45,000) from Age, Gender and Country
df_ml = df_cleaned.withColumn("label", (df_cleaned["Salary"] > 45000).cast("int"))
pipeline = Pipeline(stages=[
    StringIndexer(inputCol="Gender", outputCol="GenderIndex"),
    StringIndexer(inputCol="Country", outputCol="CountryIndex"),
    OneHotEncoder(inputCol="GenderIndex", outputCol="GenderVec"),
    OneHotEncoder(inputCol="CountryIndex", outputCol="CountryVec"),
    VectorAssembler(inputCols=["Age", "GenderVec", "CountryVec"], outputCol="features"),
    LogisticRegression(featuresCol="features", labelCol="label"),
])
train, test = df_ml.randomSplit([0.8, 0.2], seed=42)
model = pipeline.fit(train)
acc = MulticlassClassificationEvaluator(metricName="accuracy").evaluate(model.transform(test))
print(f"Model Accuracy: {round(acc * 100, 2)}%")   # 80.0%

# Recommended check: compare with the majority-class baseline
# baseline = 1 - df_ml.agg(avg("label")).first()[0]
