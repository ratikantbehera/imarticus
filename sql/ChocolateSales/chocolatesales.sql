select * from chocolatesales;

# Sales of maximum amount
with cte as (select max(Amount) as MaxAmnt from chocolatesales)
select chocolatesales.* from chocolatesales,cte where Amount=MaxAmnt;

# Sales of min amount
with cte as (select min(Amount) as MinAmnt from chocolatesales)
select chocolatesales.* from chocolatesales,cte where Amount=MinAmnt;

# Max boxes Shipped
with cte as (select max(`Boxes Shipped`) as MaxBoxShip from chocolatesales)
select chocolatesales.* from chocolatesales,cte where `Boxes Shipped`=MaxBoxShip;

# Min Boxes Shipped
with cte as (select min(`Boxes Shipped`) as MinBoxShip from chocolatesales)
select chocolatesales.* from chocolatesales,cte where `Boxes Shipped`=MinBoxShip;

# Product wise Total Sales
select Product,sum(Amount) as TotalAmount from chocolatesales group by Product order by TotalAmount desc;

# Sales Person wise Total Sales
select `Sales Person`,sum(Amount) as TotalAmount from chocolatesales group by `Sales Person` order by TotalAmount desc;

# Sales Person and Product wise Total Sales
select `Sales Person`,Product,sum(Amount) as TotalAmount from chocolatesales group by `Sales Person`,Product order by `Sales Person`,Product;

# Country wise Total Sales
select Country,sum(Amount) as TotalAmount from chocolatesales group by Country order by TotalAmount desc;

# Country and Product wise Total Sales
select Country,Product,sum(Amount) as TotalAmount from chocolatesales group by Country,Product order by Country,Product;

# Product wise average price per boxes shipped
with cte as (select Product, (Amount/`Boxes Shipped`) as UnitBoxPrice from chocolatesales order by Product)
select Product,avg(UnitBoxPrice) as AvgUnitBoxPrice from cte group by Product order by AvgUnitBoxPrice desc;

# Country and Product wise Total boxes shipped
select Country,Product,sum(`Boxes Shipped`) as TotalBoxes from chocolatesales group by Country,Product order by Country,Product;

