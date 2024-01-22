USE leetcode;

CREATE TABLE IF NOT EXISTS Customer (
    id int,
    name varchar(25),
    referee_id int
);
TRUNCATE TABLE Customer;

insert into Customer (id, name, referee_id) values ('1', 'Will', null);
insert into Customer (id, name, referee_id) values ('2', 'Jane', null);
insert into Customer (id, name, referee_id) values ('3', 'Alex', '2');
insert into Customer (id, name, referee_id) values ('4', 'Bill', null);
insert into Customer (id, name, referee_id) values ('5', 'Zack', '1');
insert into Customer (id, name, referee_id) values ('6', 'Mark', '2');

SELECT name
FROM Customer
WHERE referee_id IS NULL
   OR referee_id != 2;

DROP TABLE leetcode.Customer;