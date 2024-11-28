-- Revo Jeremy Joe bought 3 Vodka Absoluts today, only Andre was available to serve Joe that day, he inserted and then Dhanu updated the Drink Database by updating the value of the drink, then Daffa asked Farrel for the report, he was slacking, so he asked the Senior Leaders which is Ammara and Aqila to prepare a report on who bought drinks that is Alcohol and their age when buying,
-- After knowing Revo Jeremy Joe bought alcohol when Revo is underage, he ordered Ammara and Aqila to delete the overall data because if it's not deleted, the police will need too interogate Daffa for it, after Ammara and Aqila deleted Transaction, Daffa ordered them to order the Intern (so they wouldn't have to pay extra) to alter the table so that Customers must be 21+ to register.


-- Andre inserting the data into the database
insert into Cust(CustName, CustDOB, CustGender, Address, CityID, CustID) values
                                                                             ('Revo Jeremy Joe', '2005-07-05', 'Male', 'Pondok Indah', 'CI001', 'CU011')
insert into TransactionHeader(StaffID, CustID, TransactionDate, TID) values
                                                                         ('ST007', 'CU011', getdate(), 'TR016')
insert into TransactionDetail(DrinkSold, Quantity, TID) values
                                                            ('DR010',3,'TR016')

-- Dhanu updating the Drink database
update Drink
set Quantity = Quantity-3
where DrinkTID like 'DT010'

-- Ammara and Aqila prepares (selecting) the data for each who bought the alcohols
select CustName, DrinkName, datediff(year, CustDOB, TransactionDate) as CustAge
from TransactionHeader th
join Cust c on th.CustID = c.CustID
join TransactionDetail td on th.TID = td.TID
join Drink d on td.DrinkSold = d.DrinkID
where DrinkTID like 'DT010'

-- Ammara and Aqila delete the data for Revo's Purchase
delete from TransactionDetail where TID like 'TR016'
delete from TransactionHeader where CustID like 'CU011'

-- Ammara and Aqila asks Ihya the intern to alter the Customer table to add the constraint
alter table Cust
add constraint ck_age check(datediff(year, CustDOB, getdate())>=21)

