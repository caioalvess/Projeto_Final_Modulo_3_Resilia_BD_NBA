#Time mais antigo
SELECT MIN(YEARFOUNDED) AS `Ano de Fundação` from teams;
SELECT NICKNAME, YEARFOUNDED from teams where YEARFOUNDED = '1946';

#Time mais recente
SELECT MAX(YEARFOUNDED) AS `Ano de Fundação` from teams;
SELECT NICKNAME, YEARFOUNDED from teams where YEARFOUNDED = '2002' ;

#Comparativo
SELECT NICKNAME AS TIME, YEARFOUNDED AS ANO_FUNDADO FROM teams WHERE YEARFOUNDED IN (SELECT YEARFOUNDED 
FROM teams WHERE YEARFOUNDED = '1946' OR YEARFOUNDED = '2002');


#QUERY GAMES;
SELECT TEAM_ID_home, FG3_PCT_home FROM games;
SELECT TEAM_ID, FG3M, FG3_PCT FROM games_details;


#Média percentual Acerto de 3 pontos - Fora de casa
SELECT NICKNAME, AVG(FG3_PCT_home) FROM games Cesta_3_Home
INNER JOIN teams
ON team_id = team_id_home 
GROUP BY NICKNAME 
ORDER BY AVG(FG3_PCT_home) desc limit 3;
#Quando roda esse select retorna que Spurs tem o maior percentual em cestas de 3 pontos
#Seguido do Warrioes e Suns 
#Jogando em CASA


#Média percentual Acerto de 3 pontos - Fora de casa
SELECT NICKNAME, AVG(FG3_PCT_away) FROM games 
INNER JOIN teams
ON team_id = team_id_away 
GROUP BY NICKNAME 
ORDER BY AVG(FG3_PCT_away) DESC LIMIT 3;
#JOGANDO FORA: WARRIOS, SPURS, ROCKETS


#VIEW
CREATE VIEW media_away AS
SELECT NICKNAME, avg(FG3_PCT_away) media_3pts_home from games 
inner join teams
on team_id = team_id_away 
group by NICKNAME 
order by avg(FG3_PCT_away) desc ;

#VIEW
CREATE VIEW media_ponto_em_casa AS
SELECT NICKNAME, AVG(FG3_PCT_home) media_3pts_visit FROM games Cesta_3_Home
INNER JOIN teams
ON team_id = team_id_home 
GROUP BY NICKNAME 
ORDER BY AVG(FG3_PCT_home) desc;


select a.nickname, concat(round((a.media_3pts_home * 100), 3), '%') media_pct_home, 
concat(round((b.media_3pts_visit * 100), 3), '%') media_pct_visit from media_away a left join media_ponto_em_casa b on a.nickname = b.nickname limit 3;










