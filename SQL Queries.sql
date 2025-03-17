Create Database "Normalized Pizza DB"


USE [Normalized Pizza DB]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[pizza_sales](
	[pizza_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[pizza_name_id] [varchar](50) NOT NULL,
	[quantity] [tinyint] NOT NULL,
	[order_date] [date] NOT NULL,
	[order_time] [time](7) NOT NULL,
	[unit_price] [float] NOT NULL,
	[total_price] [float] NOT NULL,
	[pizza_size] [varchar](50) NOT NULL,
	[pizza_category] [varchar](50) NOT NULL,
	[pizza_ingredients] [varchar](200) NOT NULL,
	[pizza_name] [varchar](50) NOT NULLf
) ON [PRIMARY]
GO



EXEC sp_configure "show advanced options", 1;
RECONFIGURE;
EXEC sp_configure "Ad Hoc Distributed Queries", 1;
RECONFIGURE;

BULK INSERT pizza_sales
FROM 'D:\Data Science Project\Pizza Sales\pizza_sales.csv'
WITH (
    FIRSTROW = 2,  
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n',  
    TABLOCK
);



select * from New_pizza_sales;



select distinct(pizza_name_id), pizza_size,pizza_name, 
pizza_category,pizza_ingredients,unit_price 
into Pizza_Menu
from New_pizza_sales

Alter Table New_pizza_sales
drop column pizza_id, pizza_size,pizza_name, pizza_category
,pizza_ingredients,unit_price,total_price

select count(*) from New_pizza_sales

Alter Table New_pizza_sales
Add constraint PK_New_pizza_sales primary Key (order_id,Pizza_name_id)

Alter Table Pizza_Menu 
Add constraint PK_Pizza_Menu primary Key (pizza_name_id)

Alter table New_pizza_sales
add constraint FK_New_pizza_sales_Pizza_Menu
Foreign key (pizza_name_id) references Pizza_Menu(pizza_name_id)







select cast(sum(s.quantity * m.unit_Price) as decimal(10,0)) as Total_Revenu
from New_pizza_sales as s , pizza_menu as m
where s.pizza_name_id = m.pizza_name_id

select 
cast(
cast(sum(s.quantity * m.unit_Price) as decimal(10,2)) / 
cast( count( distinct(s.order_id) ) as decimal(10,2) )
as decimal(10,2)) as Avg_Order_Value
from New_pizza_sales as s , pizza_menu as m
where s.pizza_name_id = m.pizza_name_id

select * from New_pizza_sales

select * from Pizza_menu

select sum(quantity) as Total_Pizza_Sold from New_pizza_sales

select count(distinct(order_id)) Total_Order from New_pizza_sales

select 
cast(
cast(sum(quantity) as decimal(10,2))
/ count(distinct(order_id))
as decimal(10,2)) as Avg_Pizza_Per_Order
from New_pizza_sales

SELECT DATENAME(DW, order_date) AS order_day 
, count(distinct(order_id)) as Total_Orders
from New_pizza_sales
group by DATENAME(DW, order_date) 


SELECT DATENAME(MONTH, order_date) AS order_Month 
, count(distinct(order_id)) as Total_Orders
from New_pizza_sales
group by DATENAME(MONTH, order_date) 


select pizza_category 
, cast(sum(s.quantity * m.unit_Price) as decimal(10,0)) as Total_Revenu ,
cast(
cast(sum(s.quantity * m.unit_Price) as decimal(10,2) ) * 100 /
(select sum(s.quantity * m.unit_Price) 
from New_pizza_sales as s , pizza_menu as m 
where s.pizza_name_id = m.pizza_name_id) 
 as decimal(10,2) ) as PCT
from New_pizza_sales as s , pizza_menu as m
where s.pizza_name_id = m.pizza_name_id
group by pizza_category
order by Total_Revenu desc


select pizza_size 
, cast(sum(s.quantity * m.unit_Price) as decimal(10,0)) as Total_Revenu ,
cast(
cast(sum(s.quantity * m.unit_Price) as decimal(10,2) ) * 100 /
(select sum(s.quantity * m.unit_Price) 
from New_pizza_sales as s , pizza_menu as m 
where s.pizza_name_id = m.pizza_name_id) 
 as decimal(10,2) ) as PCT
from New_pizza_sales as s , pizza_menu as m
where s.pizza_name_id = m.pizza_name_id
group by pizza_size
order by Total_Revenu desc


select m.pizza_category , sum(s.quantity) as Total_Quantity_Sold
from New_pizza_sales as s , pizza_menu as m
where s.pizza_name_id = m.pizza_name_id
group by m.pizza_category
order by Total_Quantity_Sold desc


select top 5 pizza_name 
, cast(sum(s.quantity * m.unit_Price) as decimal(10,0)) as Total_Revenu 
from New_pizza_sales as s , pizza_menu as m
where s.pizza_name_id = m.pizza_name_id
group by pizza_name
order by Total_Revenu desc


select top 5 pizza_name 
, cast(sum(s.quantity * m.unit_Price) as decimal(10,0)) as Total_Revenu 
from New_pizza_sales as s , pizza_menu as m
where s.pizza_name_id = m.pizza_name_id
group by pizza_name
order by Total_Revenu asc


select top 5 pizza_name ,sum(quantity) Quantity_Sold
from New_pizza_sales as s , pizza_menu as m
where s.pizza_name_id = m.pizza_name_id
group by pizza_name
order by Quantity_Sold desc


select top 5 pizza_name ,sum(quantity) Quantity_Sold
from New_pizza_sales as s , pizza_menu as m
where s.pizza_name_id = m.pizza_name_id
group by pizza_name
order by Quantity_Sold asc


select top 5 pizza_name ,count(distinct(order_id)) Total_Orders
from New_pizza_sales as s , pizza_menu as m
where s.pizza_name_id = m.pizza_name_id
group by pizza_name
order by Total_Orders desc


select top 5 pizza_name ,count(distinct(order_id)) Total_Orders
from New_pizza_sales as s , pizza_menu as m
where s.pizza_name_id = m.pizza_name_id
group by pizza_name
order by Total_Orders asc