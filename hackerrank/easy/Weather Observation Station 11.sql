select DISTINCT CITY from STATION where SUBSTR(CITY,LENGTH(city),1) not in ('a','e','o','u','i') or SUBSTR(CITY,1,1) not in ('A','E','O','U','I'); 