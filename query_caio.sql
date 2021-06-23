------------------------------------------------------------------------------------------

-- Jogador que mais pontuou por temporada:

select
    a.season, player_name, b.max as points
from
    (SELECT 
        season, max(total_pts) as max
    from
        (SELECT 
        player_id, player_name, season, SUM(pts) as total_pts
    from
        games_details
    inner join games on games.game_id = games_details.game_id
    group by season, player_id, player_name
    order by total_pts desc , season) as season
    group by SEASON) as a
        left join
    (SELECT 
        season, MAX(total_pts) as max, player_name, player_id
    from
        (select
        player_id, player_name, season, SUM(pts) as total_pts
    from
        games_details
    inner join games on games.game_id = games_details.game_id
    group by season, player_id, player_name
    order by total_pts desc, season) as season
    group by season ,player_name, player_id) as b on a.max = b.max and a.season = b.season
order by a.season desc;

------------------------------------------------------------------------------------------

-- Top 10 jogadores que tiveram mais tempo em quadra em 17 anos de NBA:

select player_name, round((sum(min)/60),2) horas
from games_details
group by player_name
order by horas desc 
limit 10;

------------------------------------------------------------------------------------------

--Top 10 jogadores que tiveram mais participação em 17 anos de NBA:

select player_name, count(*) qtd
from games_details
group by player_name
order by qtd desc
limit 10;

------------------------------------------------------------------------------------------

--O menor tempo de um jogador em quadra:

select a.player_id id_jogador, a.player_name nome_jogador, a.min tempo_jogador, count(*) qtd
from games_details a
where a.min > 0
group by id_jogador, nome_jogador, tempo_jogador 
order by qtd, tempo_jogador LIMIT 6;

------------------------------------------------------------------------------------------


