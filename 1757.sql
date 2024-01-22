USE leetcode;

CREATE TABLE IF NOT EXISTS Products (
    product_id int,
    low_fats   enum('Y', 'N'),
    recyclable enum('Y', 'N')
);
TRUNCATE TABLE Products;

INSERT INTO Products (product_id, low_fats, recyclable) VALUES ('0', 'Y', 'N');
INSERT INTO Products (product_id, low_fats, recyclable) VALUES ('1', 'Y', 'Y');
INSERT INTO Products (product_id, low_fats, recyclable) VALUES ('2', 'N', 'Y');
INSERT INTO Products (product_id, low_fats, recyclable) VALUES ('3', 'Y', 'Y');
INSERT INTO Products (product_id, low_fats, recyclable) VALUES ('4', 'N', 'N');

SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';

DROP TABLE leetcode.Products;