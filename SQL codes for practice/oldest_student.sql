

1. Determine the name sex and age of the oldest student. 

create table student (
name varchar(255), 
age int,
sex varchar(255),
start_date date
);

insert into student values('Saloni', 34, 'f', '2018-08-27');
insert into student values('Pranay', 45, 'f','20170827');
insert into student values('Anita', 50, 'f', '20170727');
insert into student values('Ankita', 24, 'f', '20170327');
insert into student values('ritika', 28, 'f', '20170120');
insert into student values('godha', 45, 'f', '20170101');
insert into student values('amera', 25, 'f', '20170303');
insert into student values('yukti', 50, 'f','20170303');
insert into student values('amc', 25, 'f', '20170303');

# using window function : 

with oldest_student as (select name,
       age, 
       sex, 
       start_date, 
       row_number() over( order by start_date) as rank_n
from student )

select * 
from oldest_student 
where rank_n = 1
