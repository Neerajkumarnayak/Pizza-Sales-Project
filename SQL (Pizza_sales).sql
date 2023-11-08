Create Database Pizza_Sales;

Use Pizza_Sales;

Select * From Pizza_Data;
Select * From Pizza_Order_Data;

Alter Table Pizza_Order_Data Alter column Order_date Date;

-- Total Revenue.
Select SUM(Total_Price) As Total_Revenue From Pizza_Data;

-- Avrage order value.
Select (SUM(A.Total_Price)/COUNT(Distinct(B.Order_id))) As Avrager_Order_value From Pizza_Data A
inner join Pizza_Order_Data B
On A.Pizza_id = B.Pizza_Id;

-- Total Pizza Sold.
Select SUM(Quantity) From Pizza_Order_Data;

-- Total Orders.
Select SUM(Order_id) From Pizza_Order_Data;

-- Count of Order on Months basis.
Select DateName(MONTH,Order_Date) As [Month],Count(Distinct(Order_Id)) As No_Of_Order From Pizza_Order_Data
Group By DateName(MONTH,Order_Date);

--% of Sale by Pizza Category.
Select Pizza_Category, (Sum(Total_Price)*100/(Select Sum(Total_Price) From Pizza_Data)) As PRC_Of_Sales
From Pizza_Data  
Group by Pizza_Category;

--Sale by Pizza Size.
Select B.Pizza_Size, Cast(Sum(A.Total_Price) As Decimal (10,2)) As Sales
From Pizza_Data  A
Inner join Pizza_Order_Data B
On A.pizza_id = B.Pizza_Id
Group by B.pizza_size;

-- Top 5 Pizza by Sales
Select Top 5 B.Pizza_Name, Sum(A.Total_Price) As Total_price
From Pizza_Data A
Inner Join Pizza_Order_Data B
On A.Pizza_Id = B.pizza_id
Group By B.Pizza_Name
Order By Sum(A.Total_Price) Desc;
