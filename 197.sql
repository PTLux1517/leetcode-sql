USE leetcode;

CREATE TABLE IF NOT EXISTS weather (
    id          int,
    recorddate  date,
    temperature int
);

TRUNCATE TABLE weather;

INSERT INTO weather (id, recorddate, temperature)
VALUES ('1', '2015-01-01', '10');
INSERT INTO weather (id, recorddate, temperature)
VALUES ('2', '2015-01-02', '25');
INSERT INTO weather (id, recorddate, temperature)
VALUES ('3', '2015-01-03', '20');
INSERT INTO weather (id, recorddate, temperature)
VALUES ('4', '2015-01-04', '30');

/*
INSERT INTO weather (id, recorddate, temperature)
VALUES ('1','2000-12-14','3');
INSERT INTO weather (id, recorddate, temperature)
VALUES ('1','2000-12-16','5');
*/

WITH weather_sorted AS (
    SELECT *
    FROM weather
    ORDER BY recorddate
),
    daily_temp_diffs AS (
    SELECT id,
           DATEDIFF(recorddate, LAG(recorddate) OVER w) AS date_diff,
           temperature - LAG(temperature) OVER w AS temp_diff
    FROM weather_sorted
    WINDOW w AS (
        ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
    )
)
SELECT id
FROM weather_sorted JOIN daily_temp_diffs USING (id)
WHERE temp_diff > 0 AND date_diff = 1;

/*
SELECT w1.id
FROM Weather w1
     JOIN Weather w2 ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE w1.temperature > w2.temperature
*/

DROP TABLE leetcode.weather;