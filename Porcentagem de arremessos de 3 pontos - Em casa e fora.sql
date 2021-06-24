select * from games;
select * from teams;
select avg(FG3_PCT_home), Nickname
from games 
inner join teams
on TEAM_ID = TEAM_ID_home
group by NICKNAME
ORDER BY avg(FG3_PCT_home) DESC;
select avg(FG3_PCT_away), Nickname
from games 
inner join teams
on TEAM_ID = TEAM_ID_away
group by NICKNAME
ORDER BY avg(FG3_PCT_away) DESC;

