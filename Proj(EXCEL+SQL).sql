select * from [pizza_sales excel file]

--Calculating Revenue
select SUM(total_price) AS Total_Revenue
from [pizza_sales excel file]


--Calculating Average Order
SELECT SUM(total_price)/COUNT(DISTINCT order_id) as Avg_Order_Value
FROM [pizza_sales excel file]

--Calculating Total Pizzas Sold
SELECT SUM(quantity) AS Total_Pizzas_Sold
FROM [pizza_sales excel file]


--FINDING Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders_Placed
FROM [pizza_sales excel file]


--CALCULATING AVG PIZZAS PER ORDER
SELECT CAST(SUM(quantity) AS DECIMAL(10,2))/CAST(COUNT(DISTINCT order_id)AS DECIMAL(10,2)) AS AVG_Pizzas_Per_Order
FROM [pizza_sales excel file]


--CALCULATING TOTAL ORDERS PER DAY(DAILY TREND)
SELECT DATENAME(DW,order_date) AS Order_day, COUNT(DISTINCT order_id) AS Total_orders
FROM [pizza_sales excel file]
GROUP BY DATENAME(DW,order_date)


--HOURLY TREND
SELECT DATEPART(HOUR,order_time) AS Order_hours, COUNT(DISTINCT order_id) AS Total_orders
FROM [pizza_sales excel file]
GROUP BY DATEPART(HOUR,order_time)
ORDER BY DATEPART(HOUR,order_time)


--PERCENTAGE OF SALES BY PIZZA CATEGORY
SELECT pizza_category,SUM(total_price)*100/(SELECT SUM(total_price)
FROM [pizza_sales excel file]
WHERE MONTH(order_date)=1) AS Percentage_Sales
FROM [pizza_sales excel file]
WHERE MONTH(order_date)=1        ---FOR MONTHWISE
GROUP BY pizza_category


--PERCENTAGE OF SALES BY PIZZA SIZE
SELECT pizza_size,SUM(total_price)*100/(SELECT SUM(total_price)
FROM [pizza_sales excel file]) AS Percenatge_Sales
FROM [pizza_sales excel file]
GROUP BY pizza_size


--TOTAL PIZZAS SOLD PER PIZZA CATEGORY
SELECT pizza_category, SUM(quantity) AS Total_Pizzas_Sold
FROM [pizza_sales excel file]
GROUP BY pizza_category


--TOP 5 BEST SALES BY TOTAL PIZZAS SOLD
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Sales
FROM [pizza_sales excel file]
GROUP BY pizza_name
ORDER BY Total_Sales DESC



--BOTTOM 5 BEST SALES BY TOTAL PIZZAS SOLD
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Sales
FROM [pizza_sales excel file]
GROUP BY pizza_name
ORDER BY Total_Sales 
