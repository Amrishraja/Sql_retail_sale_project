DROP TABLE IF EXISTS retail_sales;

CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);


select * from retail_sales
limit 10

select 
count(*)
from retail_sales

select * from retail_sales
where transactions_id is null

select * from retail_sales
where sale_date is null

--data cleaning

select * from retail_sales
where
transactions_id is null
or
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or 
category is null
or
quantity is null
or 
cogs is null
or 
total_sale is null;

delete from retail_sales
where
transactions_id is null
or
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or 
category is null
or
quantity is null
or 
cogs is null
or 
total_sale is null;

--Data expolration

-- How many sales we have?

select count(*)as total_sale 
from retail_sales

-- How many customers we have?

select count(*)as total_sale 
from retail_sales

SELECT DISTINCT customer_id 
FROM retail_sales
ORDER BY customer_id;

__ data analysis & busines key problem and answers

-- Q.1 Write a sql query to retrieve all columns for sale made on "2022-11-05" 

select * from retail_sales
 where sale_date = '2022-11-05'

 --Q.2 Write a sql query to retrieve all the transaction where the category is clothing and the quantity sold is more than 10 in the monthof nov-2022
 
 
 SELECT * 
FROM retail_sales
WHERE 
    category = 'clothing'
    AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
    AND quantity >= 3;

--Q.3 Write a sql query to calculate the total sales (total_sales) for each category

select category,
sum(total_sale) as net_sale,
count(*) as total_orders from retail_sales
group by category

--Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:

select round(avg(age),2)
from retail_sales
where category = 'Beauty'

--Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.:

select * from retail_sales
where total_sale > 1000

--Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

select category,gender,count(*) as transaction
from retail_sales
group by 1,2
order by 

--Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

select
year,
month,
avg_sale
from
(
select
extract(year from sale_date) as year,
extract(month from sale_date) as month,
avg(total_sale) as avg_sale,
rank() over(partition by extract(year from sale_date) order by extract(month from sale_date)desc) as rank
from
retail_sales
group by 1,2
) as t1
where rank = 1

--Q.8 **Write a SQL query to find the top 5 customers based on the highest total sales **:

select 
customer_id,
sum(total_sale)as total_sales
from retail_sales
group by 1
order by 2 Desc
limit 5

--Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.:

SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM retail_sales
GROUP BY category

--q.10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):

WITH hourly_sale
AS
(
SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM retail_sales
)
SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift


--end project succesfully
