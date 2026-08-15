# Finance Data Analysis – SQL Project

## 📌 Project Overview

This project focuses on analyzing investor behavior and investment preferences using SQL.

The analysis covers investor demographics, investment avenues, investment objectives, savings objectives, investment duration, monitoring behavior, and sources of investment information.

The project contains Basic, Intermediate, and Advanced SQL analyses.

---

## 🎯 Project Objectives

The main objectives of this project are:

- Analyze investor demographics.
- Identify preferred investment avenues.
- Analyze investment objectives and savings objectives.
- Compare investment behavior across different age groups.
- Analyze investment duration and purpose.
- Identify important factors influencing investment decisions.
- Rank investment avenues based on popularity.
- Analyze investor behavior using advanced SQL techniques.
- Create reusable SQL views and CTE-based analyses.
- Generate business insights from investor data.

---

## 🗂️ Dataset

### Table Name

`FINANCE_DATA`

### Dataset Columns

- gender
- age
- Investment_Avenues
- Mutual_Funds
- Equity_Market
- Debentures
- Government_Bonds
- Fixed_Deposits
- PPF
- Gold
- Stock_Marktet
- Factor
- Objective
- Purpose
- Duration
- Invest_Monitor
- Expect
- Avenue
- What_are_your_savings_objectives
- Reason_Equity
- Reason_Mutual
- Reason_Bonds
- Reason_FD
- Source

---

## 🛠️ Tools & Technologies

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- SQL
- GitHub

---

## 📊 SQL Analysis

### Basic Analysis

The Basic analysis includes:

1. Count total number of records.
2. Find distinct investment avenues.
3. Calculate average age by gender.
4. Count investors for each investment avenue.
5. Identify the most preferred investment option.
6. Retrieve investors below 30 years of age.
7. Count investors whose objective is Safety.
8. Identify the top 5 savings objectives.
9. Count investors choosing Fixed Deposits.
10. Group investors by source of investment information.

---

### Intermediate Analysis

The Intermediate analysis includes:

1. Group investors by age range and investment avenue.
2. Calculate percentage contribution of each investment avenue.
3. Compare average age of Equity and Fixed Deposit investors.
4. Identify the dominant factor influencing investment decisions.
5. Analyze investment purpose versus investment duration.
6. Rank investment avenues by popularity.
7. Analyze investors based on investment monitoring behavior.
8. Analyze the association between investment objective and investment avenue.
9. Identify the top reason for Mutual Fund investment.
10. Create a view for long-term investors.

---

### Advanced Analysis

The Advanced analysis includes:

1. Create CTEs for investor segmentation.
2. Rank investors based on a defined risk indicator.
3. Identify trends using window functions.
4. Create a reusable reporting view.
5. Identify unusual Objective and Avenue combinations for review.
6. Perform cohort analysis based on age.

---

## 🔑 SQL Concepts Used

The project demonstrates the following SQL concepts:

- SELECT
- DISTINCT
- WHERE
- GROUP BY
- HAVING
- ORDER BY
- COUNT()
- AVG()
- ROUND()
- CASE
- CAST()
- Subqueries
- UNION ALL
- TOP
- RANK()
- LAG()
- Common Table Expressions (CTEs)
- Views
- Window Functions

---

## 📈 Business Insights

The analysis helps identify:

- The most preferred investment avenues.
- Investment preferences across different age groups.
- Common investment objectives.
- Common savings objectives.
- Investment duration patterns.
- Investment monitoring behavior.
- Major factors influencing investment decisions.
- Common reasons for Mutual Fund investment.
- Differences in investment behavior across age cohorts.

Actual numerical findings are derived from the SQL query outputs.

---

## 💡 Business Recommendations

Based on the analysis, financial institutions can:

- Focus products and marketing on the most preferred investment avenues.
- Customize investment recommendations according to investor age groups.
- Align financial products with investors' objectives and investment duration.
- Use investor information sources to improve marketing communication.
- Develop targeted strategies for different investor segments.

---

## 📁 Project Structure

```text
Finance-Data-SQL-Project/
│
├── README.md
├── Finance_Data_Analysis.sql
├── Finance_Data.csv
├── Business_Insights.md
└── Finance_Data_Schema_Diagram.png
