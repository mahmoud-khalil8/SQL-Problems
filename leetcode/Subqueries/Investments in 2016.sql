with cte as(
  select i1.tiv_2016, sum(i1.tiv_2016) over(partition by tiv_2015) ,count(i1.tiv_2016) over (partition by lat,lon)as lat_lon ,count(i1.tiv_2016 ) over (partition by i1.tiv_2015) cnt_tiv from Insurance i1 
  
)
select round(sum(tiv_2016),2) as tiv_2016 from cte where lat_lon=1 and cnt_tiv>1  
;