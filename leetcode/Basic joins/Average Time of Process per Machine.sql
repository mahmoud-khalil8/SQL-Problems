# Write your MySQL query statement below
with timestamp_difference as(
select a1.machine_id ,a1.process_id ,(a2.timestamp-a1.timestamp) as duration  from activity a1 
join activity a2 on a1.machine_id=a2.machine_id AND a1.process_id = a2.process_id where a1.activity_type='start' and a2.activity_type='end'
)
select machine_id , round(avg(duration),3) as processing_time
from timestamp_difference
group by machine_id