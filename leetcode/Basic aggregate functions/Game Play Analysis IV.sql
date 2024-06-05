with first_day as (
    select player_id ,min(event_date) as first from activity group by player_id  
)
select round( count(a.player_id)/(select count(distinct player_id) from activity),2)  as fraction from activity a
join first_day f on a.player_id=f.player_id
where
datediff(event_date,f.first)=1 ;