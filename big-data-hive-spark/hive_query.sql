-- Hive on Tez / YARN (Docker Hadoop cluster). Table: customer_profiles (~5M rows on HDFS)
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
