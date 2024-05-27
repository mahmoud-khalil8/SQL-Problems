select w.id ,wa.age,m.minimum,w.power from wands w 
join (
    select code ,min(coins_needed) as minimum , power from wands 
     group by code ,power
)  m
     on w.code=m.code and w.power=m.power and w.coins_needed=m.minimum
     join wands_property wa on w.code=wa.code
     where wa.is_evil = 0
     order by m.power desc,wa.age desc ;