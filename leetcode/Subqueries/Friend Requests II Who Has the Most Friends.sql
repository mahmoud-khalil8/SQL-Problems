with friends as (
select accepter_id as id ,requester_id as friend from  RequestAccepted
 union all select requester_id as id ,accepter_id as friend
 from RequestAccepted order by id 
)
  select id,count(id) as num from friends group by id order by count(id) desc limit 1  ;