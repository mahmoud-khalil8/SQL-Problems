select DISTINCT CITY from STATION where SUBSTR(CITY,LENGTH(city),1) not in ('a','e','o','u','i') ;