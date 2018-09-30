# SETUP: 



Tables: 
1. users 
2. events 

#find the unique customers count. 
	
	select count(distinct id)
    -> from users; 

	+--------------------+
	| count(distinct id) |
	+--------------------+
	|              54541 |
	+--------------------+
	1 row in set (0.02 sec)

# find the unique cutomers name and id. (limit 10)

	mysql> select distinct id, name 
    -> from users 
    -> limit 10
    -> ;
	+----+----------+
	| id | name     |
	+----+----------+
	|  1 | Miriam   |
	|  2 | Patricia |
	|  3 | Paula    |
	|  4 | Anita    |
	|  5 | Herman   |
	|  6 | Lynn     |
	|  7 | Bob      |
	|  8 | Jamie    |
	|  9 | Kristen  |
	| 10 | Terry    |
	+----+----------+
	10 rows in set (0.01 sec)


3. count users joined by year.

	select year(date), count(*) 
    -> from users 
    -> group by year(date)
    -> ;
	+------------+----------+
	| year(date) | count(*) |
	+------------+----------+
	|       2013 |    54541 |
	+------------+----------+
	1 row in set (0.03 sec) 

	NOTE: It tells us that data is only for the year 2013 


4.	count users joined by month. MONTHLY COHORTS


	 mysql> select year(date), month(date), count(*)
	    -> from users 
	    -> group by year(date), month(date)
	    -> ;
	+------------+-------------+----------+
	| year(date) | month(date) | count(*) |
	+------------+-------------+----------+
	|       2013 |           2 |       48 |
	|       2013 |           3 |      338 |
	|       2013 |           4 |     1699 |
	|       2013 |           5 |     7658 |
	|       2013 |           6 |    24716 |
	|       2013 |           7 |    20082 |
	+------------+-------------+----------+
	6 rows in set (0.05 sec)

	NOTE: data is from feb through oct. 


select year(date), month(date), count(*)
	    -> from users 
	    -> group by year(date), month(date)
	    -> ;

*************************************EVENTS TABLE ********************************
5. 
mysql> select year(date), month(date) 
    -> , count(*)
    -> from events 
    -> group by year(date), month(date) 
    -> ;
+------------+-------------+----------+
| year(date) | month(date) | count(*) |
+------------+-------------+----------+
|       2013 |           2 |       31 |
|       2013 |           3 |      223 |
|       2013 |           4 |     1351 |
|       2013 |           5 |     6199 |
|       2013 |           6 |    57898 |
|       2013 |           7 |    35982 |
+------------+-------------+----------+


6 rows in set (0.05 sec)


mysql> select type, count(*), count(*)/ (select count(*) from events ) 
							  as percent from events  group by type order by count(*) desc;
+----------------+----------+---------+
| type           | count(*) | percent |
+----------------+----------+---------+
| like           |    57984 |  0.5702 |
| comment        |    14606 |  0.1436 |
| twitter share  |    14570 |  0.1433 |
| facebook share |    14524 |  0.1428 |
+----------------+----------+---------+
4 rows in set (0.09 sec)

7. 


select e.user_id, 
	  u.name, 
	  count(e.user_id) as count, 
	  @curRank := @curRank + 1 as Rank

from events e 
inner join users u 
on e.user_id = u.id 
group by e.user_id
order by count(e.user_id)
		



select e.user_id, 
	   count(*) as count_users, 
	   @curRank := @curRank + 1 as rank_r
from events e, (SELECT @curRank := 0) r
group by e.user_id
order by count(*) asc 
limit 5 


select type, count(*),
       @curRank := @curRank + 1 as rank_r

from events, (SELECT @curRank := 0) r
group by type
order by count(*) desc

				



______________

seletc count(*)
from bots 
where signup_date between '20180615' and '20180820';


select b.id, sum(integration_count)
from bots b 
inner join  integrations_count c on 
b.id = c.id and b.signup_date between '20180615' and '20180820';




SELECT count(*)
FROM bots
WHERE 
  (SELECT COUNT(*)
  FROM integrations_count
  WHERE integrations_count.id = bots.id)
AND bots.signup_date BETWEEN '20180615' and '20180820';



create table reporting (
id int 
reporting )





