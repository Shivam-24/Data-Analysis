


USE [PowerBI-Pizza];

select top 5 * from pizza_sales ;

------KPI-------------
--Total Revenue-------
select	sum(total_price) as Total_Revenue
from dbo.pizza_sales;

-- Average_Order_Value-------
select sum(total_price)/Count(distinct order_id) as Average_Order_value
from dbo.pizza_sales;

---Total Pizza Sold--------
select sum(quantity) as Total_Pizza_sold
from dbo.pizza_sales;


---Total Orders Placed-----
select count(distinct order_id) as Total_Orders
from dbo.pizza_sales;

---Average Pizzas Sold----
select sum(quantity)/count(distinct order_id) as Average_Pizza_Sold
from dbo.pizza_sales;