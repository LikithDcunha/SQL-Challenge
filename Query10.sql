--10. Find the Ratio of male and female athletes participated in all olympic games

-- This is a tricky one: We will use row number to get the desired result in method 2.

SELECT 
    gender, COUNT(1) as cnt 
From person
group by 1 ;           ---get the count of Male and female athletes. 

----- 

-- Method 1) 
SELECT
    gender,
    COUNT(1) AS gender_count,
    COUNT(1) / SUM(COUNT(1)) over () AS gender_ratio 
FROM
    person
GROUP BY
    gender;

-----




-- Method 2)  Find the Ratio of male and female athletes participated in all olympic games.
WITH 
    t1 AS (
        SELECT gender, COUNT(1) AS cnt
        FROM person
        GROUP BY 1
    ),
    t2 AS (
        SELECT *, ROW_NUMBER() OVER (ORDER BY cnt) AS rn
        FROM t1
    ),
    min_cnt AS (
        SELECT cnt FROM t2 WHERE rn = 1
    ),
    max_cnt AS (
        SELECT cnt FROM t2 WHERE rn = 2
    )
SELECT CONCAT('1 : ', ROUND(CAST(max_cnt.cnt AS DECIMAL) / min_cnt.cnt, 2)) AS ratio_Females_To_Males -- we find that males outnumber females in our previous queries
FROM min_cnt, max_cnt;