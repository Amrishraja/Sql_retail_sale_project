# 🛒 Retail Sales Analysis – SQL Project

This beginner-level project demonstrates practical SQL skills used by data analysts to explore, clean, and analyze retail sales data. It involves setting up a database, conducting exploratory data analysis (EDA), and answering business questions using SQL queries.

---

## 📌 Project Overview

- **Project Title**: Retail Sales Analysis  
- **Level**: Beginner  
- **Database Name**: `Sql_project_p1`  
- **Tools**: SQL (PostgreSQL / MySQL / any RDBMS)  

---

## 🎯 Project Objectives

- Set up and populate a retail sales database  
- Clean the dataset by handling missing/null values  
- Perform exploratory data analysis (EDA)  
- Answer business questions through SQL queries  

---

## 🗃️ Database Structure

```sql
CREATE DATABASE p1_retail_db;

CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
🧹 Data Cleaning
Checked for missing values using IS NULL

Deleted rows containing null values to maintain data integrity

🔍 Data Exploration Queries
sql
Copy
Edit
-- Total number of records
SELECT COUNT(*) FROM retail_sales;

-- Unique customers
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;

-- Unique categories
SELECT DISTINCT category FROM retail_sales;

-- Check for missing values
SELECT * FROM retail_sales
WHERE sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL 
OR gender IS NULL OR age IS NULL OR category IS NULL 
OR quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

-- Delete missing records
DELETE FROM retail_sales WHERE ...
📊 Business Analysis Queries
Sales on a specific date

Clothing category sales with quantity ≥ 4 (Nov 2022)

Total and average sales by category

Average age of customers purchasing Beauty items

Transactions with sales > ₹1000

Sales breakdown by gender and category

Monthly sales trends and best-performing months

Top 5 customers by sales

Unique customer count per category

Order distribution by time shift (Morning, Afternoon, Evening)

📈 Key Insights
Demographics: Customers span across age groups and genders

High-Value Purchases: Notable transactions exceed ₹1000

Sales Trends: Month-wise variation identifies peak seasons

Customer Behavior: Top-spending customers and favorite product categories

📊 Reports Generated
Sales Summary: Total sales, COGS, category performance

Customer Insights: Unique users, top spenders

Time Trends: Best-performing months and time shifts

✅ Conclusion
This project serves as an excellent introduction to SQL for data analysis. It covers data setup, cleaning, exploration, and analysis through business-driven queries—offering hands-on experience in drawing insights from a retail dataset.

👨‍💻 Author
Amrish
MBA in Business Analytics | Aspiring Data Analyst
🔗 LinkedIn











