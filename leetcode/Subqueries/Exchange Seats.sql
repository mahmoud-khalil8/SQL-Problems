select s.id,
case when s.id%2=1 and s2.student is not null then s2.student
    when s.id%2=0 and s3.student is not null then s3.student else s.student end  as student 

 from seat s left join seat s2 on s.id= s2.id-1
 left join seat s3 on s.id= s3.id+1
 ;