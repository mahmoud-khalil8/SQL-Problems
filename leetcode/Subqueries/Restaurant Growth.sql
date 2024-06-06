select c.visited_on,sum(c2.amount )as amount , round(avg(c2.amount),2) as average_amount from 
(select sum(amount) as amount ,visited_on from customer    group by visited_on)c
 join (
 select sum(amount)  as amount,visited_on from customer  group by visited_on
)c2 
on datediff(c.visited_on ,c2.visited_on) between 0 and 6
group by c.visited_on having count(c2.visited_on)=7
order by c.visited_on
;