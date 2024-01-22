USE leetcode;

CREATE TABLE IF NOT EXISTS tweets (
    tweet_id int,
    content varchar(50)
);
TRUNCATE TABLE tweets;

insert into Tweets (tweet_id, content) values ('1', 'Vote for Biden');
insert into Tweets (tweet_id, content) values ('2', 'Let us make America great again!');

SELECT tweet_id
FROM tweets
WHERE CHAR_LENGTH(content) > 15;

DROP TABLE leetcode.tweets;