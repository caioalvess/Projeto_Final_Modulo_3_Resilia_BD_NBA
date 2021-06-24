select * from teams;
SELECT   city,
         COUNT(city)
FROM  teams
GROUP BY city
ORDER BY COUNT(city) DESC