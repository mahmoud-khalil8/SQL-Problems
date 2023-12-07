select CASE
WHEN A>=B+C OR B>=C+A OR C>=B+A then 'Not A Triangle'
WHEN A=B AND B=C THEN 'Equilateral'
WHEN A=B OR B=C OR C=A then 'Isosceles'
WHEN A!=B AND B!=C AND A!=C then 'Scalene'
END 
FROM TRIANGLES ;

