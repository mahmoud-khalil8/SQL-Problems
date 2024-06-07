with cte as (
    select  row_number() over(partition by s.submission_date order by count(s.hacker_id) desc, s.hacker_id asc) as rn, s.hacker_id, h.name,
        s.submission_date from submissions s  join hackers h on h.hacker_id = s.hacker_id
    group by s.hacker_id, h.name, s.submission_date
),
submission_counts as (
    select        s1.submission_date, s1.hacker_id,  count(distinct s2.submission_date) as prior_submissions
    from   submissions s1
    join  submissions s2 on s1.hacker_id = s2.hacker_id and s2.submission_date < s1.submission_date
    group by 
        s1.submission_date, s1.hacker_id
),
cnt_hackers as (
    select s1.submission_date, count(distinct s1.hacker_id) as cnt
    from  submissions s1
    left join  submission_counts sc on s1.submission_date = sc.submission_date and s1.hacker_id = sc.hacker_id
    where  isnull(sc.prior_submissions, 0) = datediff(day, '2016-03-01', s1.submission_date)group by s1.submission_date
)
select 
    s1.submission_date,
    c.cnt,
    cte.hacker_id,
    cte.name
from 
    (select distinct submission_date from submissions) s1
left join  cnt_hackers c on s1.submission_date = c.submission_date
join  cte on cte.submission_date = s1.submission_date and cte.rn = 1
order by 
    s1.submission_date;
