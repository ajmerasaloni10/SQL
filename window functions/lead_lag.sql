http://sqlfiddle.com/#!18/9c269/10

CREATE TABLE Sales_table
    (store varchar(1), purchase_date datetime, sales int)
;
    
INSERT INTO Sales_table
    
VALUES
    ('A', '2014-08-04 00:00:00', 600),
    ('A', '2014-07-05 00:00:00', 500),
    ('A', '2014-03-06 00:00:00', 500),
    ('A', '2014-08-07 00:00:00', 400),
    ('A', '2014-02-02 00:00:00', 200),
    ('B', '2014-08-09 00:00:00', 100),
    ('B', '2014-08-10 00:00:00', 1000),
    ('B', '2014-08-11 00:00:00', 2000),
    ('B', '2014-08-12 00:00:00', 30),
    ('A', '2015-08-04 00:00:00', 4000),
    ('A', '2015-07-05 00:00:00', 500),
    ('A', '2015-03-06 00:00:00', 400),
    ('A', '2015-08-07 00:00:00', 500),
    ('A', '2015-02-02 00:00:00', 200),
    ('B', '2015-08-09 00:00:00', 100),
    ('B', '2015-08-10 00:00:00', 20),
    ('B', '2015-08-11 00:00:00', 30),
    ('A', '2015-08-12 00:00:00', 4000)
;
with sales_subwuery as (Select store, 
       year(purchase_date) as year,
       sum(sales) as total_sales
from Sales_table
group by store, year(purchase_date))

select store, 
       year, 
       total_sales, 
       lag(total_sales, 1, null) over(partition by store order by year )
from sales_subwuery


output : 

tore    year      total_sales 
A   2014    2200    (null)
A   2015    9600    2200
B   2014    3130    (null)
B   2015    150      3130



with sales_subquery as (Select store, 
       year(purchase_date) as year,
       sum(sales) as total_sales
from Sales_table
group by store, year(purchase_date))


select store, year,total_sales, prev_sa, 100 * ( total_sales- prev_sa)
           / prev_sa  as pct_change
from
(select store, 
year, 
total_sales, 
lag(total_sales, 1, null) over(partition by store order by year) as prev_sa
from sales_subquery)  as new
