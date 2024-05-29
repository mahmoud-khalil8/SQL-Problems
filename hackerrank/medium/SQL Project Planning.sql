with sd as (
    select start_date 
    ,rank() over(order by start_date ) as st_rank
    from projects where start_date not in (select end_date from projects)
)
,ed as 
(
    select end_date , rank() over(order by end_date ) as en_rank from projects where end_date not in (select start_date from projects) 
)
select start_date,end_date from sd ,ed where ed.en_rank=sd.st_rank 
order by DATEDIFF(end_date, start_date)  asc , start_date
;
