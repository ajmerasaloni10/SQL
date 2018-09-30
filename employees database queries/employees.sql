

1. Find the number of employees hired each year.

mysql-> select year(hire_date), count(*) as employee_count
    -> from employees
    -> group by year(hire_date)
    -> ;
++-----------------+----------------+
| year(hire_date) | employee_count |
+-----------------+----------------+
|            1986 |          36150 |
|            1985 |          35316 |
|            1989 |          28394 |
|            1994 |          14835 |
|            1990 |          25610 |
|            1992 |          20402 |
|            1987 |          33501 |
|            1995 |          12115 |
|            1993 |          17772 |
|            1999 |           1514 |
|            1991 |          22568 |
|            1988 |          31436 |
|            1997 |           6669 |
|            1996 |           9574 |
|            1998 |           4155 |
|            2000 |             13 |
+-----------------+----------------+
16 rows in set (0.11 sec)

2. Find the number of employees hired each month. 


select year(hire_date), month(hire_date), count(*) as employee_count
from employees
group by year(hire_date), month(hire_date)
order by year(hire_date),month(hire_date)

3. Find the number of employees hired each week. This table should have the format:
+------+------+-----------+
| Year | Week | Employees |
+------+------+-----------+
| 1999 |   48 |        10 |
| 1999 |   49 |         6 |
| 1999 |   50 |         6 |


select year(hire_date), week(hire_date), count(*) as employees 
from employees
group by year(hire_date), week(hire_date)



