select 
    query_name,
    round(sum(rating / position) / count(rating), 2) as quality,
    round(ifnull((select count(rating)from queries q2
        where q2.query_name = q1.query_name and rating < 3), 0) / count(rating) * 100, 2) as poor_query_percentage
from  queries q1
where query_name is not null
group by query_name;
