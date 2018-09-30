
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
INSERT INTO StudentClass values(6, 'Ronnie', 'Maths', 20);
INSERT INTO StudentClass values(7, 'James', 'Art', 50);
INSERT INTO StudentClass values(8, 'Mona', 'Art', 35);
INSERT INTO StudentClass values(9, 'Roger', 'Art', 25);
                                

WITH ClassRanks AS (SELECT ClassName, 
      StudentName,
      Marks, 
      DENSE_Rank() OVER ( PARTITION BY ClassName order by Marks desc) as rank 

FROM StudentClass)

SELECT StudentName, Marks
FROM ClassRanks
WHERE rank >2