# Write your MySQL query statement below
with fun as (
select  customer_id , min(order_date) as first  ,customer_pref_delivery_date as pref from delivery   group by customer_id having first =min(pref) order by order_date
)
select round((count(f.customer_id) /(select count( distinct customer_id)from delivery)*100),2) as immediate_percentage from fun f ; 