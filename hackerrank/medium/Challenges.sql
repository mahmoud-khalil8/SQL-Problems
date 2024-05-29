with all_challenges as 
(
    select h.hacker_id ,h.name ,count(c.challenge_id) as challenges_created from hackers h join challenges c on 
    c.hacker_id=h.hacker_id 
    group by h.hacker_id ,h.name
) ,
 count_challenges as(
select a.hacker_id ,a.name ,a.challenges_created , count(*) over (partition by a.challenges_created ) as challenges_count  from all_challenges a 
order by 
    a.challenges_created desc
    )
select co.hacker_id,co.name ,co.challenges_created  from count_challenges co where co.challenges_count=1 or(co.challenges_count>1 and co.challenges_created>=(select max(co.challenges_created) from count_challenges co ))
group by co.hacker_id,co.name
order by co.challenges_created desc,hacker_id 
;