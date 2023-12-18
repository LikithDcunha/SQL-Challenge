-- 9. Who is the oldest athlete to win the gold medal? 
WITH
    t1 as (
        SELECT
            distinct p.full_name as name,
            p.gender,
            nr.region_name as Team,
            gc.age as age,
            m.medal_name 
        From
            person p
            Inner join games_competitor gc on gc.person_id = p.id
            inner join competitor_event ce on gc.id = ce.competitor_id
            Inner join medal m on m.id = ce.medal_id
            inner join person_region pr on pr.person_id = p.id
            Inner join noc_region nr on nr.id = pr.region_id
        Where m.medal_name = 'Gold'
        ORDER by age DESC )
SELECT t1.*
From t1 
WHERE t1.age = (SELECT MAX(t1.age) From t1);