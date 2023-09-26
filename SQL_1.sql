create table input_table (id PRIMARY KEY, num INT(11));

insert into input_table VALUES
(1,1),
(2,2),
(3,2),
(4,2),
(5,2),
(6,1),
(7,1),
(8,1),
(9,1)
;

SELECT num
from ( 
  	SELECT num, (row_number() over (order by id) - row_number() OVER (PARTITION by num order by id )) as grup
  	from input_table
  )
  GROUP by num, grup
  having count (*) >= 3;