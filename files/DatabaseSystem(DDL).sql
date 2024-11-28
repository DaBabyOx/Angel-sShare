create database project
use project
drop database project

create table Position(
    PosName varchar(255) not null check (len(PosName) >= 5),
    PosID char(5) primary key check(PosID like 'SP[0-9][0-9][0-9]'))

create table Staff(
    StaffName varchar(255) not null check (len(StaffName) >= 3),
    DOB date not null,
    Gender varchar(10) not null check(Gender in ('Male','Female')),
    PosID char(5) not null,
    foreign key (PosID) references Position(PosID),
    StaffID char(5) primary key check(StaffID Like 'ST[0-9][0-9][0-9]'))

create table DrinkType(
    TypeName varchar(255) not null check (len(TypeName) > 0 and charindex(' ', TypeName) = 0),
    DrinkTID char(5) primary key check(DrinkTID like 'DT[0-9][0-9][0-9]'))

create table Drink(
    DrinkName varchar(255) not null check((len(DrinkName) > 0 and charindex(' ', DrinkName) > 0)),
    Price int not null check(Price between 15000 and 60000),
    Quantity int check (Quantity>0),
    DrinkTID char(5) not null,
    foreign key (DrinkTID) references DrinkType(DrinkTID),
    DrinkID char(5) primary key check(DrinkID like 'DR[0-9][0-9][0-9]'))

create table City(
    City varchar(255) not null check(len(City)>=5),
    CityID char(5) primary key check(CityID like 'CI[0-9][0-9][0-9]'))

create table Cust(
    CustName varchar(255) not null check (len(CustName) >= 3),
    CustDOB date not null,
    CustGender varchar(10) not null check(CustGender in ('Male','Female')),
    Address varchar(255) not null check (Address like '%Street' or Address like '%Avenue' or Address like '%Lane' or Address like '%Terrace' or Address like '%Hill' or Address like '%Road' or Address like '%Path' or Address like '%Center'),
    CityID char(5) not null,
    foreign key (CityID) references city(CityID),
    CustID char(5) primary key check(CustID like 'CU[0-9][0-9][0-9]'))

create table TransactionHeader(
    StaffID char(5) not null,
    foreign key (StaffID) references Staff(StaffID),
    CustID char(5) not null,
    foreign key (CustID) references Cust(CustID),
    TransactionDate date not null,
    TID char(5) primary key check (TID like 'TR[0-9][0-9][0-9]'))

create table TransactionDetail(
    DrinkSold char(5) not null,
    foreign key (DrinkSold) references Drink(DrinkID),
    Quantity INT not null check (Quantity>0),
    TID char(5) not null,
    foreign key (TID) references  TransactionHeader(TID),
    primary key (DrinkSold,TID))

create table Membership(
    CustID char(5) not null,
    foreign key (CustID) references Cust(CustID),
    StartDate date not null,
    EndDate date not null,
    MemberID char(5) primary key check(MemberID like 'ME[0-9][0-9][0-9]'))