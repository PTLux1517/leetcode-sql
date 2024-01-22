USE leetcode;

CREATE TABLE IF NOT EXISTS employee (
    empid      int,
    name       varchar(255),
    supervisor int, -- empid
    salary     int
);
CREATE TABLE IF NOT EXISTS bonus (
    empid int,
    bonus int
);
TRUNCATE TABLE employee;
INSERT INTO employee (empid, name, supervisor, salary)
VALUES ('3', 'Brad', null, '4000');
INSERT INTO employee (empid, name, supervisor, salary)
VALUES ('1', 'John', '3', '1000');
INSERT INTO employee (empid, name, supervisor, salary)
VALUES ('2', 'Dan', '3', '2000');
INSERT INTO employee (empid, name, supervisor, salary)
VALUES ('4', 'Thomas', '3', '4000');

TRUNCATE TABLE bonus;
INSERT INTO bonus (empid, bonus)
VALUES ('2', '500');
INSERT INTO bonus (empid, bonus)
VALUES ('4', '2000');

SELECT name, bonus
FROM employee LEFT JOIN bonus USING (empid)
WHERE bonus < 1000 OR bonus IS NULL;

DROP TABLE leetcode.employee;
DROP TABLE leetcode.bonus;