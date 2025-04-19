select * from amazon_sales_data2025;

# List of completed orders
select * from amazon_sales_data2025 where Status="Completed";

# List of pending orders
select * from amazon_sales_data2025 where Status="Pending";

# List of cancelled orders
select * from amazon_sales_data2025 where Status="Cancelled";

# Product wise total sales
select Product,sum(`Total Sales`) as TotalSales from amazon_sales_data2025 where Status="Completed" group by Product order by TotalSales desc;

# Category wise total sales
select Category,sum(`Total Sales`) as TotalSales from amazon_sales_data2025 where Status="Completed" group by Category order by TotalSales desc;

# Customer wise total sales
select `Customer Name`,sum(`Total Sales`) as TotalSales from amazon_sales_data2025 where Status="Completed" group by `Customer Name` order by TotalSales desc;

# Payment Method wise total sales
select `Payment Method`,sum(`Total Sales`) as TotalSales from amazon_sales_data2025 where Status="Completed" group by `Payment Method` order by TotalSales desc;

# Location wise total sales
select `Customer Location`,sum(`Total Sales`) as TotalSales from amazon_sales_data2025 where Status="Completed" group by `Customer Location` order by TotalSales desc;

# Percentage of Orders by Status
with cte1 as (select count(*) as TotalOrders from amazon_sales_data2025),
cte2 as (select Status,count(*) as No_of_orders from amazon_sales_data2025 group by Status)
select Status, (No_of_orders/TotalOrders)*100 as PercentOfOrders from cte1,cte2;

