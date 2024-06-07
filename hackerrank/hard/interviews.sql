with cte as(
    
select col.contest_id
    ,sum(sub.total_submissions) as s_total_sub
    , sum(sub.total_accepted_submissions) as s_total_acc_sub
    from colleges  col 
join challenges chal on chal.college_id=col.college_id
join submission_stats sub on sub.challenge_id=chal.challenge_id
    group by col.contest_id 
    
),
cte2 as (
select col.contest_id ,sum(v.total_views) as s_total_views
    ,sum( v.total_unique_views ) as s_total_uni_views
    
    from colleges  col 
join challenges chal on chal.college_id=col.college_id
join view_stats v on v.challenge_id=chal.challenge_id
    group by col.contest_id 

)
select con.contest_id ,con.hacker_id,con.name ,cte.s_total_sub ,cte.s_total_acc_sub ,cte2.s_total_views ,cte2.s_total_uni_views from contests  con

join cte on con.contest_id=cte.contest_id
join cte2 on con.contest_id=cte2.contest_id
where cte.s_total_sub>0
or cte.s_total_acc_sub>0 
or cte2.s_total_views >0 
or cte2.s_total_uni_views>0
order by con.contest_id
;