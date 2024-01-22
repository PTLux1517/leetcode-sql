USE leetcode;

CREATE TABLE IF NOT EXISTS students (
    student_id   int,
    student_name varchar(20),
    PRIMARY KEY (student_id)
);
CREATE TABLE IF NOT EXISTS subjects (
    subject_name varchar(20),
    PRIMARY KEY (subject_name)
);
CREATE TABLE IF NOT EXISTS examinations (
    student_id   int,
    subject_name varchar(20)
);

TRUNCATE TABLE students;
INSERT INTO students (student_id, student_name)
VALUES ('1', 'Alice');
INSERT INTO students (student_id, student_name)
VALUES ('2', 'Bob');
INSERT INTO students (student_id, student_name)
VALUES ('13', 'John');
INSERT INTO students (student_id, student_name)
VALUES ('6', 'Alex');

TRUNCATE TABLE subjects;
INSERT INTO subjects (subject_name)
VALUES ('Math');
INSERT INTO subjects (subject_name)
VALUES ('Physics');
INSERT INTO subjects (subject_name)
VALUES ('Programming');

TRUNCATE TABLE examinations;
INSERT INTO examinations (student_id, subject_name)
VALUES ('1', 'Math');
INSERT INTO examinations (student_id, subject_name)
VALUES ('1', 'Physics');
INSERT INTO examinations (student_id, subject_name)
VALUES ('1', 'Programming');
INSERT INTO examinations (student_id, subject_name)
VALUES ('2', 'Programming');
INSERT INTO examinations (student_id, subject_name)
VALUES ('1', 'Physics');
INSERT INTO examinations (student_id, subject_name)
VALUES ('1', 'Math');
INSERT INTO examinations (student_id, subject_name)
VALUES ('13', 'Math');
INSERT INTO examinations (student_id, subject_name)
VALUES ('13', 'Programming');
INSERT INTO examinations (student_id, subject_name)
VALUES ('13', 'Physics');
INSERT INTO examinations (student_id, subject_name)
VALUES ('2', 'Math');
INSERT INTO examinations (student_id, subject_name)
VALUES ('1', 'Math');
/*
SELECT student_id, student_name, subject_name, COUNT(*) AS attended_exams
FROM students
     LEFT JOIN examinations USING (student_id)
     RIGHT JOIN subjects USING (subject_name)
GROUP BY student_id, student_name, subject_name
ORDER BY student_id;
*/
/*
WITH exam_counts AS (
    SELECT student_id, subject_name, COUNT(*) AS ct
    FROM examinations
    GROUP BY student_id, subject_name
)
SELECT DISTINCT student_id, student_name, subject_name, ct
FROM students
     CROSS JOIN subjects
     LEFT JOIN examinations USING (student_id, subject_name)
     LEFT JOIN exam_counts USING (student_id, subject_name)
ORDER BY student_id;
*/
/*
WITH exam_counts AS (
    SELECT student_id, subject_name, COUNT(*) AS attended_exams
    FROM examinations
    GROUP BY student_id, subject_name
)
SELECT DISTINCT student_id, student_name, subject_name, attended_exams
FROM students
     CROSS JOIN subjects
     LEFT JOIN exam_counts USING (student_id, subject_name)
ORDER BY student_id;
*/
/*
SELECT student_id, student_name, subject_name, COUNT(subject_name) AS attended_exams
FROM subjects
     LEFT JOIN examinations USING (subject_name)
     RIGHT JOIN students USING (student_id)
GROUP BY student_id, subject_name;
*/
WITH students_subjects AS (
    SELECT *
    FROM students
         CROSS JOIN subjects
), exam_counts AS (
    SELECT student_id, subject_name, COUNT(*) AS attended_exams
    FROM examinations
    GROUP BY student_id, subject_name
)
SELECT student_id, student_name, exam_counts.subject_name, attended_exams
FROM students_subjects LEFT JOIN exam_counts USING (student_id)
;

DROP TABLE leetcode.students;
DROP TABLE leetcode.subjects;
DROP TABLE leetcode.examinations;