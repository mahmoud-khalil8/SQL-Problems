select h.hacker_id , h.name  from hackers  h
join submissions s on h.hacker_id=s.hacker_id
join challenges c on c.challenge_id =s.challenge_id
join difficulty d on d.difficulty_level =c.difficulty_level
where d.score=s.score
group by h.hacker_id , h.name
having count(distinct c.challenge_id)>1
order by count(distinct c.challenge_id) desc,h.hacker_id asc
;