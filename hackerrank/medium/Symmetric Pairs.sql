with f as (
select x,y , row_number() over(order by x,y ) as rn
    from functions 
)
select
distinct f.x,f.y
from  f join f as f2 on f.x=f2.y  
and f.rn!=f2.rn
and f2.x=f.y
where f.x<=f.y
order by x,y
;