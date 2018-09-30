/*CREATE TABLE manager
    (Id int, Name varchar(5), Department varchar(1), ManagerId varchar(4))
;
    
INSERT INTO manager

VALUES
    (101, 'John', 'A', NULL),
    (102, 'Dan', 'A', '101'),
    (103, 'James', 'A', '101'),
    (104, 'Amy', 'A', '101'),
    (105, 'Anne', 'A', '101'),
    (106, 'Ron', 'B', '101')
;
*/

select ManagerId 
from manager 
group by ManagerId
having count(ManagerId)>=5