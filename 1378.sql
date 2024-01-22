USE leetcode;

CREATE TABLE IF NOT EXISTS employees (
    id   int,
    name varchar(20)
);

CREATE TABLE IF NOT EXISTS employeeuni (
    id        int,
    unique_id int
);

TRUNCATE TABLE employees;

insert into Employees (id, name) values ('1', 'Alice');
insert into Employees (id, name) values ('7', 'Bob');
insert into Employees (id, name) values ('11', 'Meir');
insert into Employees (id, name) values ('90', 'Winston');
insert into Employees (id, name) values ('3', 'Jonathan');

TRUNCATE TABLE employeeuni;

insert into EmployeeUNI (id, unique_id) values ('3', '1');
insert into EmployeeUNI (id, unique_id) values ('11', '2');
insert into EmployeeUNI (id, unique_id) values ('90', '3');

SELECT unique_id, name
FROM employees LEFT JOIN employeeuni USING (id);

DROP TABLE leetcode.employees;
DROP TABLE leetcode.employeeuni;