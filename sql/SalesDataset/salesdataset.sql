select * from salesdataset;

# Payment mode wise Total Amount, Profit and Quantity
select PaymentMode,sum(Amount) as TotalAmt,sum(Profit) as TotalPft,sum(Quantity) as TotalQty from salesdataset group by PaymentMode order by PaymentMode;

# Category and sub Category wise Total Amount, profit and Quantity
select Category,`Sub-Category`,sum(Amount) as TotalAmt,sum(Profit) as TotalPft,sum(Quantity) as TotalQty from salesdataset group by Category,`Sub-Category` order by Category,`Sub-Category`;

# Order ID wise Total Amount, profit and Quantity
select `Order ID`,sum(Amount) as TotalAmt,sum(Profit) as TotalPft,sum(Quantity) as TotalQty from salesdataset group by `Order ID` order by `Order ID`;

# Customer wise Total Amount, profit and Quantity
select CustomerName,sum(Amount) as TotalAmt,sum(Profit) as TotalPft,sum(Quantity) as TotalQty from salesdataset group by CustomerName order by CustomerName;

# Location wise Total Amount, profit and Quantity
select State,City,sum(Amount) as TotalAmt,sum(Profit) as TotalPft,sum(Quantity) as TotalQty from salesdataset group by State,City order by State,City;

# Order Date wise Total Amount, profit and Quantity
select `Order Date`,sum(Amount) as TotalAmt,sum(Profit) as TotalPft,sum(Quantity) as TotalQty from salesdataset group by `Order Date` order by `Order Date`;

# Year wise Total Amount, profit and Quantity
with cte as (select `Order Date`,sum(Amount) as TotalAmt,sum(Profit) as TotalPft,sum(Quantity) as TotalQty from salesdataset group by `Order Date` order by `Order Date`)
select year(`Order Date`) as OrderYear,sum(TotalAmt) as TotalAmt,sum(TotalPft) as TotalPft,sum(TotalQty) as TotalQty from cte group by OrderYear;
