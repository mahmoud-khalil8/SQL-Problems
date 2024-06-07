select p.product_name ,sum(o.unit) as unit from orders o join products p on p.product_id =o.product_id where left(o.order_date,7) ='2020-02' group by o.product_id having sum(unit) >=100 ;