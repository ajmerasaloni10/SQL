CREATE TABLE StudentClass
(ID INT,
StudentName VARCHAR(100),
ClassName VARCHAR(100),
Marks INT);


INSERT INTO StudentClass values(1, 'Roger', 'Science', 50);
INSERT INTO StudentClass values(2, 'Sara', 'Science', 40);

INSERT INTO StudentClass values(3, 'Jimmy', 'Science', 30);
INSERT INTO StudentClass values(4, 'Mike', 'Maths', 50);
INSERT INTO StudentClass values(5, 'Mona', 'Maths', 30);
INSERT INTO StudentClass values(6, 'Ronnie', 'Maths', 30);
INSERT INTO StudentClass values(7, 'James', 'Art', 50);
INSERT INTO StudentClass values(8, 'Mona', 'Art', 35);
INSERT INTO StudentClass values(9, 'Roger', 'Art', 25);


MY SQL SERVER SQL QUERY : 

SELECT ClassName, 
      StudentName,
      Marks, 
      Row_Number() OVER ( PARTITION BY ClassName order by Marks desc) as rank 

FROM StudentClass

********************************************

http://sqlfiddle.com/#!9/92c532/8
https://mattmazur.com/2017/03/26/exploring-ranking-techniques-in-mysql/
CREATE TABLE users (user_id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(20), start_date DATE, team_id INT);
INSERT INTO users (name, start_date, team_id) VALUES ('Matt', '2017-01-01', 1);
INSERT INTO users (name, start_date, team_id) VALUES ('John', '2017-01-02', 2);
INSERT INTO users (name, start_date, team_id) VALUES ('Sara', '2017-01-02', 2);
INSERT INTO users (name, start_date, team_id) VALUES ('Tim', '2017-01-02', 3);
INSERT INTO users (name, start_date, team_id) VALUES ('Bob', '2017-01-03', 3);
INSERT INTO users (name, start_date, team_id) VALUES ('Bill', '2017-01-04', 3);
INSERT INTO users (name, start_date, team_id) VALUES ('Kathy', '2017-01-04', 3);
INSERT INTO users (name, start_date, team_id) VALUES ('Anne', '2017-01-05', 3);




select team_id, 
       count(*), 
       @curRank := @curRank + 1 as rank_r
from users, (SELECT @curRank := 0) r
group by team_id
order by count(*) desc