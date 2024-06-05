with fun as (select person_name , weight ,turn ,
sum(weight) over(order by turn) as com_weight 
from queue )
select person_name from fun where com_weight<=1000 order by com_weight desc limit 1 ;
