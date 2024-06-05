select distinct num as ConsecutiveNums  from (
    select num ,
    id,
    lag(num,1) over(order by id) as bf ,
    lag(num,2) over(order by id) as after ,
    lag(id, 1) OVER (ORDER BY id) AS prev_id,
    lag(id, 2) OVER (ORDER BY id) AS prev_id2
    from logs
)AS temp
where bf =num and after=num and id = prev_id + 1 and id = prev_id2 + 2
;