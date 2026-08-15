-- Purpose: 1.Create a separate database for the Finance Data Analysis project
CREATE DATABASE FINANCE_DATA_PROJECT;

--Use the Finance Data Project data
USE FINANCE_DATA_PROJECT;

--2.Import the Finance Dataset
SELECT TOP 10 *
FROM FINANCE_DATA;

--3.Validate the Imported Finance Dataset
--Check the table name
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

--Check the columns and data types
SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'FINANCE_DATA'
ORDER BY ORDINAL_POSITION;
--Check total records
SELECT COUNT(*) AS Total_Records
FROM FINANCE_DATA;


--4.Check NULL values in all important Finance dataset columns
SELECT
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS Null_Gender,
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS Null_Age,
    SUM(CASE WHEN Investment_Avenues IS NULL THEN 1 ELSE 0 END) AS Null_Investment_Avenues,
    SUM(CASE WHEN Mutual_Funds IS NULL THEN 1 ELSE 0 END) AS Null_Mutual_Funds,
    SUM(CASE WHEN Equity_Market IS NULL THEN 1 ELSE 0 END) AS Null_Equity_Market,
    SUM(CASE WHEN Debentures IS NULL THEN 1 ELSE 0 END) AS Null_Debentures,
    SUM(CASE WHEN Government_Bonds IS NULL THEN 1 ELSE 0 END) AS Null_Government_Bonds,
    SUM(CASE WHEN Fixed_Deposits IS NULL THEN 1 ELSE 0 END) AS Null_Fixed_Deposits,
    SUM(CASE WHEN PPF IS NULL THEN 1 ELSE 0 END) AS Null_PPF,
    SUM(CASE WHEN Gold IS NULL THEN 1 ELSE 0 END) AS Null_Gold,
    SUM(CASE WHEN Stock_Marktet IS NULL THEN 1 ELSE 0 END) AS Null_Stock_Marktet,
    SUM(CASE WHEN Factor IS NULL THEN 1 ELSE 0 END) AS Null_Factor,
    SUM(CASE WHEN Objective IS NULL THEN 1 ELSE 0 END) AS Null_Objective,
    SUM(CASE WHEN Purpose IS NULL THEN 1 ELSE 0 END) AS Null_Purpose,
    SUM(CASE WHEN Duration IS NULL THEN 1 ELSE 0 END) AS Null_Duration,
    SUM(CASE WHEN Invest_Monitor IS NULL THEN 1 ELSE 0 END) AS Null_Invest_Monitor,
    SUM(CASE WHEN Expect IS NULL THEN 1 ELSE 0 END) AS Null_Expect,
    SUM(CASE WHEN Avenue IS NULL THEN 1 ELSE 0 END) AS Null_Avenue,
    SUM(CASE WHEN Source IS NULL THEN 1 ELSE 0 END) AS Null_Source
FROM FINANCE_DATA;


--Identify completely duplicated records
SELECT
    COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'FINANCE_DATA'
ORDER BY ORDINAL_POSITION;

--Check whether gender values are standardized
SELECT
    gender,
    COUNT(*) AS Investor_Count
FROM FINANCE_DATA
GROUP BY gender
ORDER BY Investor_Count DESC;

--Check available investment avenue categories 
SELECT
    Investment_Avenues,
    COUNT(*) AS Investor_Count
FROM FINANCE_DATA
GROUP BY Investment_Avenues
ORDER BY Investor_Count DESC;

--Check investment objective categories
SELECT
    Objective,
    COUNT(*) AS Investor_Count
FROM FINANCE_DATA
GROUP BY Objective
ORDER BY Investor_Count DESC;

--Check factors influencing investment decisions
SELECT
    Factor,
    COUNT(*) AS Investor_Count
FROM FINANCE_DATA
GROUP BY Factor
ORDER BY Investor_Count DESC;

--Check investment duration categories
SELECT
    Duration,
    COUNT(*) AS Investor_Count
FROM FINANCE_DATA
GROUP BY Duration
ORDER BY Investor_Count DESC;

--Check investment monitoring frequency 
SELECT
    Invest_Monitor,
    COUNT(*) AS Investor_Count
FROM FINANCE_DATA
GROUP BY Invest_Monitor
ORDER BY Investor_Count DESC;

--Check sources from which investors receive investment knowledge
SELECT
    Source,
    COUNT(*) AS Investor_Count
FROM FINANCE_DATA
GROUP BY Source
ORDER BY Investor_Count DESC;

--BASIC
--1.	Count total records in the dataset.
SELECT COUNT(*) AS Total_Records
FROM FINANCE_DATA;
--2.	Find distinct investment avenues.

SELECT DISTINCT
    Investment_Avenues
FROM FINANCE_DATA
ORDER BY Investment_Avenues;

--3.	Calculate average age by gender.
SELECT
    gender,
    ROUND(AVG(age), 2) AS Average_Age
FROM FINANCE_DATA
GROUP BY gender
ORDER BY Average_Age DESC;

--4.	Count number of investors for each avenue.
SELECT
    Investment_Avenues,
    COUNT(*) AS Investor_Count
FROM FINANCE_DATA
GROUP BY Investment_Avenues
ORDER BY Investor_Count DESC;

--5.	Find most preferred investment option.
SELECT TOP 1
    Investment_Avenues,
    COUNT(*) AS Investor_Count
FROM FINANCE_DATA
GROUP BY Investment_Avenues
ORDER BY Investor_Count DESC;

--6.	Retrieve records where age < 30.
SELECT *
FROM FINANCE_DATA
WHERE age < 30;

--7.	Count investors whose objective is “Safety”.
SELECT
    COUNT(*) AS Safety_Investors
FROM FINANCE_DATA
WHERE Objective = 'Safety';

--8.	Display top 5 most common savings objectives.
SELECT TOP 5
    What_are_your_savings_objectives,
    COUNT(*) AS Investor_Count
FROM FINANCE_DATA
GROUP BY What_are_your_savings_objectives
ORDER BY Investor_Count DESC;

--9.	Find number of investors choosing Fixed Deposits.
SELECT
    Fixed_Deposits,
    COUNT(*) AS Investor_Count
FROM FINANCE_DATA
GROUP BY Fixed_Deposits
ORDER BY Fixed_Deposits;
--10.	Group investors by source of information.
SELECT
    Source,
    COUNT(*) AS Investor_Count
FROM FINANCE_DATA
GROUP BY Source
ORDER BY Investor_Count DESC;

--INTERMEDIATE
--1.	Group investors by age range and investment avenue.
SELECT
    CASE
        WHEN age < 30 THEN 'Below 30'
        WHEN age BETWEEN 30 AND 40 THEN '30-40'
        WHEN age BETWEEN 41 AND 50 THEN '41-50'
        ELSE 'Above 50'
    END AS Age_Group,

    Investment_Avenues,

    COUNT(*) AS Investor_Count

FROM FINANCE_DATA

GROUP BY
    CASE
        WHEN age < 30 THEN 'Below 30'
        WHEN age BETWEEN 30 AND 40 THEN '30-40'
        WHEN age BETWEEN 41 AND 50 THEN '41-50'
        ELSE 'Above 50'
    END,
    Investment_Avenues
	ORDER BY
    Age_Group,
    Investor_Count DESC;

--2.	Calculate percentage contribution of each avenue.
SELECT
    Investment_Avenues,
    COUNT(*) AS Investor_Count,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM FINANCE_DATA),
        2
    ) AS Contribution_Percentage
FROM FINANCE_DATA
GROUP BY Investment_Avenues
ORDER BY Contribution_Percentage DESC;

--3.	Compare average age for Equity vs Fixed Deposit investors.
SELECT
    'Equity' AS Investment_Type,
    ROUND(AVG(CAST(age AS FLOAT)), 2) AS Average_Age
FROM FINANCE_DATA
WHERE Equity_Market = 1

UNION ALL

SELECT
    'Fixed Deposit' AS Investment_Type,
    ROUND(AVG(CAST(age AS FLOAT)), 2) AS Average_Age
FROM FINANCE_DATA
WHERE Fixed_Deposits = 1;
--4.	Identify dominant factor influencing investment decisions.

SELECT TOP 1
    Factor,
    COUNT(*) AS Investor_Count
FROM FINANCE_DATA
GROUP BY Factor
ORDER BY Investor_Count DESC;
--5.	Analyse purpose vs duration of investment.
SELECT
    Purpose,
    Duration,
    COUNT(*) AS Investor_Count
FROM FINANCE_DATA
GROUP BY
    Purpose,
    Duration
ORDER BY
    Purpose,
    Investor_Count DESC;
--6.	Rank investment avenues by popularity.
SELECT
    Investment_Avenues,
    COUNT(*) AS Investor_Count,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS Popularity_Rank
FROM FINANCE_DATA
GROUP BY Investment_Avenues
ORDER BY Popularity_Rank;

--7.	Count investors monitoring investments frequently.
SELECT
    Invest_Monitor,
    COUNT(*) AS Investor_Count
FROM FINANCE_DATA
GROUP BY Invest_Monitor
ORDER BY Investor_Count DESC;

--8.	Find correlation between objective and avenue.
SELECT
    Objective,
    Investment_Avenues,
    COUNT(*) AS Investor_Count
FROM FINANCE_DATA
GROUP BY
    Objective,
    Investment_Avenues
ORDER BY
    Objective,
    Investor_Count DESC;

--9.	Identify top reason for Mutual Fund investment.
SELECT TOP 1
    Reason_Mutual,
    COUNT(*) AS Investor_Count
FROM FINANCE_DATA
GROUP BY Reason_Mutual
ORDER BY Investor_Count DESC;

--10.	Create a view for long-term investors.
CREATE VIEW VW_LONG_TERM_INVESTERS
AS
SELECT * FROM FINANCE_DATA
WHERE DURATION = '>5 YEARS';
SELECT *
FROM W_LONG_TERM_INVESTERS;

--ADVANCED 
--1.	Create CTEs for investor segmentation.


WITH Investor_Segmentation AS
(
    SELECT
        gender,
        age,
        Investment_Avenues,
        CASE
            WHEN age < 30 THEN 'Young'
            WHEN age BETWEEN 30 AND 50 THEN 'Middle-Aged'
            ELSE 'Senior'
        END AS Age_Segment
    FROM FINANCE_DATA
)

SELECT
    Age_Segment,
    COUNT(*) AS Investor_Count
FROM Investor_Segmentation
GROUP BY Age_Segment
ORDER BY Investor_Count DESC;

--2.	Rank investors based on risk appetite.
WITH Investor_Risk AS
(
    SELECT
        *,
        CASE
            WHEN Equity_Market = 1 THEN 'Higher Risk'
            ELSE 'Lower Risk'
        END AS Risk_Category
    FROM FINANCE_DATA
)

SELECT
    age,
    gender,
    Risk_Category,
    RANK() OVER
    (
        ORDER BY
            CASE
                WHEN Risk_Category = 'Higher Risk' THEN 1
                ELSE 2
            END
    ) AS Risk_Rank
FROM Investor_Risk
ORDER BY Risk_Rank;
--3.	Identify hidden trends using window functions.
WITH Investor_Risk AS
(
    SELECT
        age,
        gender,
        Equity_Market,
        CASE
            WHEN Equity_Market = 1 THEN 'Higher Risk'
            ELSE 'Lower Risk'
        END AS Risk_Category
    FROM FINANCE_DATA
)

SELECT
    age,
    gender,
    Risk_Category,
    RANK() OVER
    (
        ORDER BY
            CASE
                WHEN Risk_Category = 'Higher Risk' THEN 1
                ELSE 2
            END
    ) AS Risk_Rank
FROM Investor_Risk
ORDER BY Risk_Rank;
--4.	Build view for fast reporting.

CREATE VIEW vw_Finance_Investor_Report
AS
SELECT
    gender,
    age,
    Investment_Avenues,
    Objective,
    Purpose,
    Duration,
    Invest_Monitor,
    Expect,
    Avenue,
    Source
FROM FINANCE_DATA;
--5.	Detect inconsistencies between objective and avenue.
SELECT
    Objective,
    Avenue,
    COUNT(*) AS Investor_Count
FROM FINANCE_DATA
GROUP BY
    Objective,
    Avenue
ORDER BY
    Objective,
    Investor_Count DESC;

	SELECT
    Objective,
    Avenue,
    COUNT(*) AS Investor_Count
FROM FINANCE_DATA
GROUP BY
    Objective,
    Avenue
HAVING COUNT(*) = 1
ORDER BY Objective
--6.	Perform cohort analysis based on age.


WITH Age_Cohorts AS
(
    SELECT
        age,
        gender,
        Investment_Avenues,
        Objective,

        CASE
            WHEN age < 30 THEN 'Under 30'
            WHEN age BETWEEN 30 AND 39 THEN '30-39'
            WHEN age BETWEEN 40 AND 49 THEN '40-49'
            ELSE '50+'
        END AS Age_Cohort

    FROM FINANCE_DATA
)

SELECT
    Age_Cohort,
    COUNT(*) AS Investor_Count,
    ROUND(AVG(CAST(age AS FLOAT)), 2) AS Average_Age
FROM Age_Cohorts
GROUP BY Age_Cohort
ORDER BY Age_Cohort;
