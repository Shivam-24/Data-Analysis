--Total Revenue

USE [PowerBI-Pizza];

select  sum(total_price) as Total_Revenue
from dbo.pizza_sales;