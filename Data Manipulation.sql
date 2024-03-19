select * from pizza_sales;

-- Total Revenue?

SELECT round(SUM(total_price),2) AS Total_Revenue FROM pizza_sales;

 -- Average Order Value?
 
 SELECT round((SUM(total_price) / COUNT(DISTINCT order_id)),2) AS Avg_order_Value FROM pizza_sales;

-- Total Pizzas Sold

SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;

-- Total Orders

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

-- Average Pizzas Per Order

SELECT round(round(SUM(quantity),2) / 
round(COUNT(DISTINCT order_id),2),2)
AS Avg_Pizzas_per_order
FROM pizza_sales;

 -- Daily Trend for Total Orders
 
SELECT dayname(order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY dayname(order_date);

-- Monthly Trend for Orders

select monthname(order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY monthname(order_date);

-- % of Sales by Pizza Category

SELECT pizza_category, round(SUM(total_price),2) as total_revenue,
round(SUM(total_price)*100 / (SELECT SUM(total_price) from pizza_sales),2) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

-- % of Sales by Pizza Size

SELECT pizza_size, round(SUM(total_price),2) as total_revenue,
round(SUM(total_price)*100 / (SELECT SUM(total_price) from pizza_sales),2) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

-- Total Pizzas Sold by Pizza Category

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

--  Top 5 Pizzas by Revenue

SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC limit 5 ;

-- Bottom 5 Pizza by Revenue

SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue asc limit 5 ;

-- Top 5 Pizza by Quantity

SELECT pizza_name, SUM(quantity) AS Total_pizza_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_pizza_sold desc limit 5 ;

-- Bottom 5 Pizza by Quantity

SELECT pizza_name, SUM(quantity) AS Total_pizza_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_pizza_sold asc limit 5 ;

-- Top 5 Pizza by Total Orders

SELECT pizza_name, count(distinct order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders desc limit 5 ;

-- Bottom 5 Pizza by Total Orders

SELECT pizza_name, count(distinct order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders asc limit 5 ;


