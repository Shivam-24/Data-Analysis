


USE [PowerBI-Pizza];
--DROP Table dbo.pizza_sales;

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
select CAST( CAST(sum(quantity) as decimal(10,2))/CAST(count(distinct order_id)as decimal(10,2)) as decimal(10,2)) as Average_Pizzas_Per_Order
from dbo.pizza_sales;


select top 5 * from pizza_sales ;
--- Daily Trends for Orders-----
select	DATENAME(DW, order_date) as order_day,
		COUNT(distinct order_id) as total_orders
from dbo.pizza_sales
group by DATENAME(DW, order_date);

--- Monthly Order Trends----
select	DATENAME(MONTH,order_date) as  MonthName,
		COUNT(distinct order_id) as total_orders
FROM dbo.pizza_sales
group by DATENAME(MONTH,order_date)
ORDER BY DATENAME(MONTH,order_date) desc;

---Percentage of Sales by Pizza Category---
select	pizza_sales.pizza_category,
		--SUM(total_price) as pizza_sales,
		--(select SUM(total_price) from pizza_sales) as Total_sales,
		CAST(CAST(SUM(total_price) as decimal(10,2))/CAST((select SUM(total_price) from pizza_sales)as decimal(10,2))*100 as decimal(10,2))as Percentage_of_Total_Sales
from dbo.pizza_sales
group by pizza_category;

---Percentage of Sales by Pizza Size---
select	pizza_sales.pizza_size,
		--SUM(total_price) as pizza_sales,
		--(select SUM(total_price) from pizza_sales) as Total_sales,
		CAST(CAST(SUM(total_price) as decimal(10,2))/CAST((select SUM(total_price) from pizza_sales)as decimal(10,2))*100 as decimal(10,2))as Percentage_of_Total_Sales
from dbo.pizza_sales
group by pizza_size;

---TOP 5 & Bottonm 5 by Revenue----
select TOP 5 pizza_name, SUM(total_price) as Total_Revenue
from pizza_sales
group by pizza_name
order by Total_Revenue desc;

select TOP 5 pizza_name, SUM(total_price) as Total_Revenue
from pizza_sales
group by pizza_name
order by Total_Revenue asc;

------Top 5 & Bottom 5 by quantity
select TOP 5 pizza_name, SUM(quantity) as Total_Quantity
from pizza_sales
group by pizza_name
order by Total_Quantity desc;

select TOP 5 pizza_name, SUM(quantity) as Total_Quantity
from pizza_sales
group by pizza_name
order by Total_Quantity asc;


------Top 5 & Bottom 5 by Orders
select TOP 5 pizza_name, Count(distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders desc;

select TOP 5 pizza_name, Count(distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders asc;