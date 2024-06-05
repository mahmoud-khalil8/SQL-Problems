with latest as (select product_id,new_price,change_date ,
row_number() over(partition by product_id order by change_date desc ) as rn 
from products where change_date <= '2019-08-16' ),

n as (select product_id from products where product_id not in (select product_id from latest where rn =1 )) 

select l.product_id ,l.new_price as price  from latest l  where rn=1  union( select distinct  product_id  ,10 as price from n) 
