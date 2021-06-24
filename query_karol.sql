#Top 10 pontuações do time da casa:

select
    a.season, nickname, b.max as points
from
    (SELECT 
        season, max(max_pts) as max
    from
        (SELECT 
        games.TEAM_ID_home, teams.nickname, games.season, max(cast(games.pts_home as unsigned)) as max_pts
    from
        teams
    inner join games on games.TEAM_ID_home = teams.TEAM_ID
    group by games.TEAM_ID_home, teams.nickname, games.season
    order by max_pts desc , games.season) as season
    group by SEASON) as a
        left join
    (SELECT 
        season, MAX(max_pts) as max, nickname, team_id_home
    from
        (select
        TEAM_ID_home, NICKNAME, season, max(cast(pts_home as unsigned)) as max_pts
    from
        teams
    inner join games on games.TEAM_ID_home = teams.TEAM_ID
    group by season, TEAM_ID_home, NICKNAME
    order by max_pts desc, season) as season
    group by season , NICKNAME, TEAM_ID_home) as b on a.max = b.max and a.season = b.season
order by a.season desc limit 12;

#As 10 maiores arenas:

select nickname, arena, arenacapacity from teams
where arenacapacity > 0 order by arenacapacity desc limit 10;

#Capacidade média das arenas:

select round(avg(arenacapacity)) as `Capacidade média das arenas` from teams
where arenacapacity > 0;