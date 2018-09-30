http://sqlfiddle.com/#!18/09fd7/13

CREATE TABLE Customer
(Customer_No INTEGER IDENTITY (1,1) PRIMARY KEY,
 Customer_Name VARCHAR(30) NOT NULL
)

CREATE TABLE DVD
(DVD_No INTEGER IDENTITY (1,1) PRIMARY KEY,
 DVD_Name VARCHAR(30)
)

CREATE TABLE DVD_Purchase
(DVD_Purchase_No INTEGER IDENTITY (1,1) PRIMARY KEY,
 DVD_No INTEGER NOT NULL,
 Customer_No INTEGER NOT NULL
 )

INSERT INTO Customer (Customer_Name)
VALUES('Daman')
INSERT INTO Customer (Customer_Name)
VALUES('Saif')
INSERT INTO Customer (Customer_Name)
VALUES('Gurung')
INSERT INTO Customer (Customer_Name)
VALUES('Upendra')
INSERT INTO Customer (Customer_Name)
VALUES('Saloni')

INSERT INTO DVD (DVD_Name)
VALUES('Bleach')
INSERT INTO DVD (DVD_Name)
VALUES('Gintama')
INSERT INTO DVD (DVD_Name)
VALUES('Tokyo Ghoul')
INSERT INTO DVD (DVD_Name)
VALUES('Death Note')

INSERT INTO DVD_Purchase (DVD_No,Customer_No)
VALUES (4,1)
INSERT INTO DVD_Purchase (DVD_No,Customer_No)
VALUES (1,2)
INSERT INTO DVD_Purchase (DVD_No,Customer_No)
VALUES (1,3)
INSERT INTO DVD_Purchase (DVD_No,Customer_No)
VALUES (2,3)
INSERT INTO DVD_Purchase (DVD_No,Customer_No)
VALUES (3,3)
INSERT INTO DVD_Purchase (DVD_No,Customer_No)
VALUES (4,3)
INSERT INTO DVD_Purchase (DVD_No,Customer_No)
VALUES (1,4)
INSERT INTO DVD_Purchase (DVD_No,Customer_No)
VALUES (2,4)




# customers name who did not place the order 

select c.Customer_Name
from customer c 
left join DVD_Purchase d 
on c.Customer_no = d.Customer_no
where d.DVD_No is null



# count of orders placed by customers
select c.Customer_Name, count(d.Customer_No) 
from Customer c 
left join DVD_Purchase d 
on c.Customer_No = d.Customer_No
group by c.Customer_Name
