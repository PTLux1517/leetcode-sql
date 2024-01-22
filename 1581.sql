USE leetcode;

CREATE TABLE IF NOT EXISTS visits (
    visit_id    int,
    customer_id int
);

CREATE TABLE IF NOT EXISTS transactions (
    transaction_id int,
    visit_id       int,
    amount         int
);

TRUNCATE TABLE visits;
INSERT INTO visits (visit_id, customer_id)
VALUES ('1', '23');
INSERT INTO visits (visit_id, customer_id)
VALUES ('2', '9');
INSERT INTO visits (visit_id, customer_id)
VALUES ('4', '30');
INSERT INTO visits (visit_id, customer_id)
VALUES ('5', '54');
INSERT INTO visits (visit_id, customer_id)
VALUES ('6', '96');
INSERT INTO visits (visit_id, customer_id)
VALUES ('7', '54');
INSERT INTO visits (visit_id, customer_id)
VALUES ('8', '54');

TRUNCATE TABLE transactions;
INSERT INTO transactions (transaction_id, visit_id, amount)
VALUES ('2', '5', '310');
INSERT INTO transactions (transaction_id, visit_id, amount)
VALUES ('3', '5', '300');
INSERT INTO transactions (transaction_id, visit_id, amount)
VALUES ('9', '5', '200');
INSERT INTO transactions (transaction_id, visit_id, amount)
VALUES ('12', '1', '910');
INSERT INTO transactions (transaction_id, visit_id, amount)
VALUES ('13', '2', '970');

SELECT customer_id, COUNT(*) AS count_no_trans
FROM visits LEFT JOIN transactions USING (visit_id)
WHERE transaction_id IS NULL
GROUP BY customer_id;

DROP TABLE leetcode.visits;
DROP TABLE leetcode.transactions;