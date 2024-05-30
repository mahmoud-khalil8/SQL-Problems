select r.contest_id  , round((count(r.user_id)/(select count(u.user_id) from users u)) *100,2) as percentage from register r join users u on u.user_id=r.user_id 
group by r.contest_id 
order by percentage desc,r.contest_id asc
;