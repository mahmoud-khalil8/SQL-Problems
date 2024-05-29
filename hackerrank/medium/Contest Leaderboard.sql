with max_score as(
    select hacker_id ,challenge_id ,max(score) as maxScore from submissions 
    group by hacker_id,challenge_id
)
select h.hacker_id,h.name ,sum(ms.maxScore) as total  from hackers h   join max_score ms on ms.hacker_id =h.hacker_id group by h.hacker_id,h.name having sum(ms.maxScore)>0
order by total desc,h.hacker_id asc  ;