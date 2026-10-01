-- 1. External table over HDFS (data stays in HDFS; dropping the table does not delete files)
CREATE EXTERNAL TABLE retail_transactions (
  invoice_no   STRING,
  stock_code   STRING,
  description  STRING,
  quantity     INT,
  invoice_date STRING,
  unit_price   FLOAT,
  customer_id  STRING,
  country      STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 'hdfs://namenode:8020/bigdata/input/';
-- Improvements for production use:
--   * point LOCATION at a dedicated folder (Hive reads EVERY file in the directory)
--   * TBLPROPERTIES ("skip.header.line.count"="1") to drop the CSV header
--   * OpenCSVSerde if descriptions contain commas; DATE/DECIMAL types instead of STRING/FLOAT

-- 2. Aggregation on customer_profiles (~5M rows), Hive on Tez / YARN
SELECT
    Gender,
    Country,
    COUNT(*)    AS Num_Records,
    AVG(Salary) AS Avg_Salary,
    MAX(Salary) AS Max_Salary,
    MIN(Salary) AS Min_Salary
FROM customer_profiles
WHERE Salary IS NOT NULL AND Gender IS NOT NULL AND Country IS NOT NULL
GROUP BY Gender, Country
ORDER BY Country;
