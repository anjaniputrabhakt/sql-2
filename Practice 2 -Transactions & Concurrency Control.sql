DROP TABLE IF EXISTS StudentEnrollments;

CREATE TABLE StudentEnrollments (
    enrollment_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    course_id VARCHAR(10) NOT NULL,
    enrollment_date DATE NOT NULL,
    UNIQUE(student_name, course_id)
);

INSERT IGNORE INTO StudentEnrollments (enrollment_id, student_name, course_id, enrollment_date)
VALUES
(1, 'Ashish', 'CSE101', '2024-07-01'),
(2, 'Smaran', 'CSE102', '2024-07-01'),
(3, 'Vaibhav', 'CSE101', '2024-07-01');

START TRANSACTION;
INSERT IGNORE INTO StudentEnrollments (enrollment_id, student_name, course_id, enrollment_date)
VALUES (4, 'Ashish', 'CSE101', '2024-07-02');
COMMIT;

START TRANSACTION;
INSERT IGNORE INTO StudentEnrollments (enrollment_id, student_name, course_id, enrollment_date)
VALUES (5, 'Ashish', 'CSE101', '2024-07-02');
COMMIT;

START TRANSACTION;
SELECT * 
FROM StudentEnrollments
WHERE student_name = 'Ashish' AND course_id = 'CSE101'
FOR UPDATE;

UPDATE StudentEnrollments
SET enrollment_date = '2024-07-03'
WHERE student_name = 'Ashish' AND course_id = 'CSE101';
COMMIT;

START TRANSACTION;
SELECT * FROM StudentEnrollments WHERE enrollment_id = 1 FOR UPDATE;
UPDATE StudentEnrollments
SET enrollment_date = '2024-07-05'
WHERE enrollment_id = 1;
COMMIT;

SELECT * FROM StudentEnrollments;
