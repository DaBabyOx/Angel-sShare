--1
select StaffName, sum(Quantity) as DrinkSold
from Staff s
join TransactionHeader th on s.StaffID = th.StaffID
join TransactionDetail td on th.TID = td.TID
where year(TransactionDate) > 2021 and datediff(year, DOB, '2023-12-12')>26
group  by StaffName

--2
select 'Ms./Mrs. ' + upper(StaffName) as StaffName, count(th.CustID) as TotalCustomers
from TransactionHeader th
join Staff s on th.StaffID = s.StaffID
join Cust c on th.CustID = c.CustID
join City ct on c.CityID = ct.CityID
where Gender like 'Female' and City like '%Village'
group by StaffName
order by TotalCustomers

--3
select replace(c.CustID, 'CU', 'Customer ') as CustomerID, 'Mr. ' + CustName as CustomerName, sum(td.Quantity * d.Price) as TotalTransaction, max(td.Quantity * d.Price) as [Max Transaction]
from Cust c
join TransactionHeader th on c.CustID = th.CustID
join TransactionDetail td on th.TID = td.TID
join Drink d on td.DrinkSold = d.DrinkID
where c.CustID in(
    select th2.CustID
    from TransactionHeader th2
    join Cust c2 on th2.CustID = c2.CustID
    where year(TransactionDate)<2022 and c2.CustGender like 'Male')
group by c.CustID, CustName

--4
select upper(TypeName) as DrinkTypeName, sum(td.Quantity) as TotalDrinksBoughth, concat('Rp. ', avg(Price)) as AveragePrice
from DrinkType dt
join Drink d on dt.DrinkTID = d.DrinkTID
join TransactionDetail td on d.DrinkID = td.DrinkSold
join TransactionHeader th on td.TID = th.TID
where TypeName in ('Alcohol', 'Cocktail') and datepart(weekday, TransactionDate) in (2,4,6)
group by TypeName

--5
select CustName, datediff(year, CustDOB, '2023-12-12') as CustomerAge, convert(varchar, CustDOB, 106) as CustomerDOB, City
from Cust c
join City ct on c.CityID = ct.CityID
join Membership m on c.CustID = m.CustID
where year(EndDate) = 2023 and datediff(year, CustDOB, '2023-12-12')>(
    select avg(age)
    from(
        select datediff(year, CustDOB, '2023-12-12') as age
        from Cust
        )as sub)

--6
select concat(PosName, ' ', StaffName) as Staff, td.Quantity, replace(td.TID, 'TR','Transaction') as TransactionID, sum(td.Quantity * 5000) as StaffBonus
from Staff s
join Position p on s.PosID = p.PosID
join TransactionHeader th on s.StaffID = th.StaffID
join TransactionDetail td on th.TID = td.TID
where PosName not like 'Manager' and td.Quantity>(
    select avg(quant)
    from (select Quantity as quant
          from TransactionDetail) as quantt)
group by PosName, StaffName, td.Quantity, td.TID

--7
select concat(left(DrinkName, 1), substring(DrinkName, charindex(' ', DrinkName) + 1, 1), left(TypeName, 1)) as DrinkCode, DrinkName, cast(sum((Price - ((Price) * 0.10)))as int) as DrinkDiscountedPrice, cast(sum(Price - (Price - ((Price) * 0.10))) as int) as TotalProfit, TypeName as DrinkTypeName
from Drink d
join DrinkType dt on d.DrinkTID = dt.DrinkTID
join TransactionDetail td on d.DrinkID = td.DrinkSold
join TransactionHeader th on td.TID = th.TID
where month(TransactionDate) = 6 and Drinkname in(
    select drname
    from(select DrinkName as drname
         from Drink
         where DrinkName like '%a%') as drck)
group by DrinkName, DrinkName, DrinkName, TypeName, DrinkName, TypeName

--8
select concat(left(DrinkName, charindex(' ', DrinkName) - 1), ' ', right(DrinkName, len(DrinkName) - charindex(' ', DrinkName))) as DrinkName, c.CustName, datediff(day, TransactionDate, '2023-12-12') as DaysAgo, td.Quantity
from Drink d
join TransactionDetail td on d.DrinkID = td.DrinkSold
join TransactionHeader th on td.TID = th.TID
join Cust c on th.CustID = c.CustID
where td.Quantity>(
    select min(num1)
    from(select Quantity as num1
         from TransactionDetail) as n1)
and td.Quantity<(
    select max(num2)
    from(select Quantity as num2
         from TransactionDetail) as n2)
and TransactionDate<='2023-12-12'

--9
create view TotalSalesDrinkType as
select TypeName as DrinkTypeName, concat(sum(td.Quantity),' Drink(s)') as DrinksSold, avg(Price) as AverageDrinkPrice
from Drink d
join DrinkType dt on d.DrinkTID = dt.DrinkTID
join TransactionDetail td on d.DrinkID = td.DrinkSold
join TransactionHeader th on td.TID = th.TID
where TypeName in ('Boba', 'Juice', 'Milkshake', 'Smoothie', 'Tea') and datepart(quarter, TransactionDate)>2
group by TypeName

--10
create view TotalCustomersBasedOnCity as
select City, count(c.CustID) as TotalCustomers, concat(min(td.Quantity), ' Drink(s)') as MinAmountOfDrinksBought
from Cust c
join City ct on c.CityID = ct.CityID
join TransactionHeader th on c.CustID = th.CustID
join TransactionDetail td on th.TID = td.TID
where charindex(' ', City)>1 and Address like '%Road'
group by City