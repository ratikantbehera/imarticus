select * from fashion_retail_sales;

# List of cancelled or pending orders
select * from fashion_retail_sales where Amount is null;

# List of completed orders
select * from fashion_retail_sales where Amount is not null;

# List of completed orders where the customer did not rate the product
select * from fashion_retail_sales where Amount is not null and Rating is null;

# Payment Method wise total amount
select PaymentMethod,sum(Amount) as TotalAmt from fashion_retail_sales group by PaymentMethod;

# Item wise Total amount
select Item,sum(Amount) as TotalAmt from fashion_retail_sales group by Item order by TotalAmt desc;

# Customer and Item wise total amount
with cte as (select ID,Item,sum(Amount) as TotalAmt from fashion_retail_sales group by ID, Item order by ID)
select * from cte where TotalAmt is not null;

# Year Wise Total Amount
select year(Date) as Year,sum(Amount) as TotalAmt from fashion_retail_sales group by Year;

# Item wise Average Ratings
select Item,round(avg(Rating),2) as AvgRating from fashion_retail_sales where Amount is not null group by Item order by Item;

# Customer and Item wise Cancelled/Pending orders
select ID,Item,count(*) as `Incomplete orders` from fashion_retail_sales where Amount is null group by ID,Item;

