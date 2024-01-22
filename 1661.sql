USE leetcode;

-- The user activities for a factory website
CREATE TABLE IF NOT EXISTS activity (
    machine_id    int,
    process_id    int, -- id of process running on the machine with id machine_id
    activity_type enum ('start', 'end'),
    timestamp     float, -- current time in seconds
    PRIMARY KEY (machine_id, process_id, activity_type)
);
TRUNCATE TABLE activity;
INSERT INTO activity (machine_id, process_id, activity_type, timestamp)
VALUES ('0', '0', 'start', '0.712');
INSERT INTO activity (machine_id, process_id, activity_type, timestamp)
VALUES ('0', '0', 'end', '1.52');
INSERT INTO activity (machine_id, process_id, activity_type, timestamp)
VALUES ('0', '1', 'start', '3.14');
INSERT INTO activity (machine_id, process_id, activity_type, timestamp)
VALUES ('0', '1', 'end', '4.12');
INSERT INTO activity (machine_id, process_id, activity_type, timestamp)
VALUES ('1', '0', 'start', '0.55');
INSERT INTO activity (machine_id, process_id, activity_type, timestamp)
VALUES ('1', '0', 'end', '1.55');
INSERT INTO activity (machine_id, process_id, activity_type, timestamp)
VALUES ('1', '1', 'start', '0.43');
INSERT INTO activity (machine_id, process_id, activity_type, timestamp)
VALUES ('1', '1', 'end', '1.42');
INSERT INTO activity (machine_id, process_id, activity_type, timestamp)
VALUES ('2', '0', 'start', '4.1');
INSERT INTO activity (machine_id, process_id, activity_type, timestamp)
VALUES ('2', '0', 'end', '4.512');
INSERT INTO activity (machine_id, process_id, activity_type, timestamp)
VALUES ('2', '1', 'start', '2.5');
INSERT INTO activity (machine_id, process_id, activity_type, timestamp)
VALUES ('2', '1', 'end', '5');

WITH start_times AS (
    SELECT *
    FROM activity
    WHERE activity_type = 'start'
),
    end_times AS (
    SELECT *
    FROM activity
    WHERE activity_type = 'end'
)
SELECT machine_id, ROUND(AVG(end_times.timestamp - start_times.timestamp), 3) AS processing_time
FROM start_times JOIN end_times USING (machine_id, process_id)
GROUP BY machine_id;

DROP TABLE leetcode.activity;