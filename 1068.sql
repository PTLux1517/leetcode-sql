USE leetcode;

CREATE TABLE IF NOT EXISTS sales (
    sale_id    int,
    product_id int,
    year       int,
    quantity   int,
    price      int
);
CREATE TABLE IF NOT EXISTS product (
    product_id   int,
    product_name varchar(10)
);

TRUNCATE TABLE sales;

INSERT INTO sales (sale_id, product_id, year, quantity, price)
VALUES ('1', '100', '2008', '10', '5000');
INSERT INTO sales (sale_id, product_id, year, quantity, price)
VALUES ('2', '100', '2009', '12', '5000');
INSERT INTO sales (sale_id, product_id, year, quantity, price)
VALUES ('7', '200', '2011', '15', '9000');

TRUNCATE TABLE product;

INSERT INTO product (product_id, product_name)
VALUES ('100', 'Nokia');
INSERT INTO product (product_id, product_name)
VALUES ('200', 'Apple');
INSERT INTO product (product_id, product_name)
VALUES ('300', 'Samsung');

SELECT product_name, year, price
FROM sales JOIN product USING (product_id);

DROP TABLE leetcode.sales;
DROP TABLE leetcode.product;