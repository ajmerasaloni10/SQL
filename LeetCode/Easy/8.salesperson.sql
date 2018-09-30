/*CREATE TABLE salesperson
    (sales_id int, name varchar(4), salary int, commission_rate int, hire_date datetime)
;
    
INSERT INTO salesperson
    
VALUES
    (1, 'John', 100000, 6, '2006-04-01 00:00:00'),
    (2, 'Amy', 120000, 5, '2010-05-01 00:00:00'),
    (3, 'Mark', 65000, 12, '2008-12-25 00:00:00'),
    (4, 'Pam', 25000, 25, '2005-01-01 00:00:00'),
    (5, 'Alex', 50000, 10, '2007-02-03 00:00:00')
;


CREATE TABLE company
    (com_id int, name varchar(6), city varchar(8))
;
    
INSERT INTO company
    
VALUES
    (1, 'RED', 'Boston'),
    (2, 'ORANGE', 'New York'),
    (3, 'YELLOW', 'Boston'),
    (4, 'GREEN', 'Austin')
;


CREATE TABLE orders
    (order_id int, date datetime, com_id int, sales_id int, amount int)
;
    
INSERT INTO orders
    
VALUES
    (1, '2014-01-01 00:00:00', 3, 4, 100000),
    (2, '2014-02-01 00:00:00', 4, 5, 5000),
    (3, '2014-03-01 00:00:00', 1, 1, 50000),
    (4, '2014-04-01 00:00:00', 1, 4, 25000)
;


select * from salesperson; 
select * from orders; 
select * from company;
*/



SELECT s.NAME 
FROM   salesperson s 
WHERE  sales_id NOT IN(SELECT sales_id 
                       FROM   orders o 
                              LEFT JOIN company c 
                                     ON o.com_id = c.com_id 
                       WHERE  c.NAME = 'RED') 