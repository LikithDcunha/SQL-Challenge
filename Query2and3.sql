--2) How many olympics games have been held?
SELECT
    Count(games_name) total_olympic_games
FROM
    games;

--3) which are all the olympic games held so far  (year, season and City)
SELECT
    g.games_year,
    g.games_name,
    c.city_name
From
    games g
    LEFT Join games_city gc on g.id = gc.games_id
    LEFT JOIN city c on gc.city_id = c.id
order by
    1;