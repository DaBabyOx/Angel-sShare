insert City values
                ('Jakarta', 'CI001'),
                ('Bandung', 'CI002'),
                ('Depok', 'CI003'),
                ('Bekasi', 'CI004'),
                ('Tangerang Village', 'CI005'),
                ('Papua', 'CI006'),
                ('Banjar Wijaya', 'CI007'),
                ('Arcadia Arcadium', 'CI008'),
                ('Ascent Village', 'CI009'),
                ('South Nusa Dua', 'CI010')

insert into Cust(CustID, CityID, Address, CustGender, CustDOB, CustName) values
                                                                            ('CU001', 'CI001', 'Kenari Street', 'Male', '2004-10-27', 'Ilham God'),
                                                                            ('CU002', 'CI002', 'Duta Avenue', 'Female', '2009-01-30', 'Siti'),
                                                                            ('CU003', 'CI003', 'Alam Sutera Hill', 'Male', '2001-09-08', 'Syuja'),
                                                                            ('CU004', 'CI004', 'Electronic Center', 'Female', '1998-01-20', 'Adriani'),
                                                                            ('CU005', 'CI005', 'Bukit Terrace', 'Male', '1980-11-19', 'Burhan'),
                                                                            ('CU006', 'CI006', 'Trances Lane', 'Female', '1945-08-17', 'Vincent Joshua'),
                                                                            ('CU007', 'CI007', 'Braces Road', 'Male', '2005-05-12', 'Fadel Ferdy'),
                                                                            ('CU008', 'CI008', 'Ajazz Path', 'Female', '1979-04-04', 'Aji Sujandi'),
                                                                            ('CU009', 'CI009', 'Koorui Road', 'Male', '2001-09-09', 'Gavin Nivag'),
                                                                            ('CU010', 'CI010', 'Samsung Road', 'Female', '2003-10-10', 'Revo Jeremy Joe')

insert into Position(PosID, PosName) values
                                        ('SP001', 'Manager'),
                                        ('SP002', 'Senior Leader'),
                                        ('SP003', 'Employee'),
                                        ('SP004', 'Janitor'),
                                        ('SP005', 'Cashier'),
                                        ('SP006', 'Security'),
                                        ('SP007', 'Barista'),
                                        ('SP008', 'DishWasher'),
                                        ('SP009', 'Intern'),
                                        ('SP010', 'Owner')

insert into Staff(StaffID, PosID, StaffName, DOB, Gender) values
                                                            ('ST001', 'SP001', 'Farrel', '2005-01-01', 'Male'),
                                                            ('ST002', 'SP002', 'Ammara', '2005-07-18', 'Female'),
                                                            ('ST003', 'SP003', 'Dhanu', '1995-03-03', 'Male'),
                                                            ('ST004', 'SP001', 'Pippop', '2005-04-04', 'Female'),
                                                            ('ST005', 'SP005', 'Nasywa', '2005-05-05', 'Female'),
                                                            ('ST006', 'SP002', 'Aqila', '2005-07-18', 'Female'),
                                                            ('ST007', 'SP005', 'Andre', '1885-06-06', 'Male'),
                                                            ('ST008', 'SP009', 'Raka', '2005-07-07', 'Male'),
                                                            ('ST009', 'SP007', 'Ihya', '2004-08-08', 'Male'),
                                                            ('ST010', 'SP010', 'Daffa', '2004-09-06', 'Male')

insert into DrinkType(DrinkTID, TypeName) values
                                            ('DT001', 'Tea'),
                                            ('DT002', 'Coffee'),
                                            ('DT003', 'Mocktail'),
                                            ('DT004', 'Smoothie'),
                                            ('DT005', 'Juice'),
                                            ('DT006', 'Soda'),
                                            ('DT007', 'Milkshake'),
                                            ('DT008', 'Boba'),
                                            ('DT009', 'Cocktail'),
                                            ('DT010', 'Alcohol')

insert into Drink(DrinkID, DrinkTID, DrinkName, Price, Quantity) values
                                                                    ('DR001', 'DT001', 'Teh Sisri', 20000, 10),
                                                                    ('DR002', 'DT002', 'Kapal Api', 22000, 15),
                                                                    ('DR003', 'DT003', 'Soda Gembira', 24000, 20),
                                                                    ('DR004', 'DT004', 'Banana Smoothie', 26000, 25),
                                                                    ('DR005', 'DT005', 'Orange Juice', 28000, 30),
                                                                    ('DR006', 'DT006', 'Coca Cola', 30000, 35),
                                                                    ('DR007', 'DT007', 'Vanilla Milkshake', 32000, 40),
                                                                    ('DR008', 'DT008', 'Mixue Boba', 34000, 45),
                                                                    ('DR009', 'DT009', 'Manhattan Cocktail', 36000, 50),
                                                                    ('DR010', 'DT010', 'Vodka Absolut', 38000, 55)

insert into TransactionHeader(StaffID, CustID, TransactionDate, TID) values
                                                                        ('ST005', 'CU001', '2022-07-01', 'TR001'),
                                                                        ('ST007', 'CU002', '2021-07-02', 'TR002'),
                                                                        ('ST005', 'CU003', '2022-07-03', 'TR003'),
                                                                        ('ST007', 'CU004', '2020-07-04', 'TR004'),
                                                                        ('ST005', 'CU005', '2023-07-05', 'TR005'),
                                                                        ('ST007', 'CU006', '2019-07-06', 'TR006'),
                                                                        ('ST005', 'CU007', '2022-07-07', 'TR007'),
                                                                        ('ST007', 'CU008', '2021-07-08', 'TR008'),
                                                                        ('ST005', 'CU009', '2022-08-01', 'TR009'),
                                                                        ('ST007', 'CU010', '2024-08-02', 'TR010'),
                                                                        ('ST005', 'CU009', '2023-08-03', 'TR011'),
                                                                        ('ST007', 'CU008', '2022-09-09', 'TR012'),
                                                                        ('ST005', 'CU007', '2021-06-18', 'TR013'),
                                                                        ('ST007', 'CU006', '2024-04-04', 'TR014'),
                                                                        ('ST005', 'CU005', '2023-05-18', 'TR015')

insert into TransactionDetail(DrinkSold, Quantity, TID) values
                                                            ('DR008', 7, 'TR001'),
                                                            ('DR005', 8, 'TR002'),
                                                            ('DR007', 5, 'TR003'),
                                                            ('DR004', 4, 'TR004'),
                                                            ('DR001', 3, 'TR005'),
                                                            ('DR010', 5, 'TR006'),
                                                            ('DR009', 7, 'TR007'),
                                                            ('DR006', 4, 'TR008'),
                                                            ('DR007', 3, 'TR009'),
                                                            ('DR008', 1, 'TR010'),
                                                            ('DR009', 2, 'TR011'),
                                                            ('DR010', 2, 'TR012'),
                                                            ('DR002', 3, 'TR013'),
                                                            ('DR002', 4, 'TR014'),
                                                            ('DR003', 5, 'TR015'),
                                                            ('DR004', 6, 'TR001'),
                                                            ('DR005', 7, 'TR003'),
                                                            ('DR006', 8, 'TR004'),
                                                            ('DR007', 8, 'TR005'),
                                                            ('DR008', 9, 'TR006'),
                                                            ('DR009', 10, 'TR007'),
                                                            ('DR010', 11, 'TR008'),
                                                            ('DR001', 12, 'TR009'),
                                                            ('DR009', 13, 'TR010')

insert into Membership (MemberID, CustID, StartDate, EndDate) values
                                                                ('ME001', 'CU001', '2024-01-01', '2024-02-02'),
                                                                ('ME002', 'CU003', '2023-11-21', '2024-04-08'),
                                                                ('ME003', 'CU002', '2022-12-12', '2023-12-12'),
                                                                ('ME004', 'CU004', '2022-11-11', '2022-12-19'),
                                                                ('ME005', 'CU005', '2021-01-01', '2021-12-31'),
                                                                ('ME006', 'CU006', '2020-03-03', '2023-04-04'),
                                                                ('ME007', 'CU007', '2019-04-04', '2022-12-19'),
                                                                ('ME008', 'CU008', '2018-01-02', '2018-02-01'),
                                                                ('ME009', 'CU009', '2020-02-02', '2020-03-03'),
                                                                ('ME010', 'CU010', '2021-04-04', '2024-04-04')