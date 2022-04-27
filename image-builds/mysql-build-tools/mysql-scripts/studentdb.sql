--  Sample student database 
DROP DATABASE IF EXISTS studentdb;
CREATE DATABASE IF NOT EXISTS studentdb;
USE studentdb;

CREATE table student_attendance_tbl(
   student_regnum VARCHAR(15) NOT NULL,
   student_fname VARCHAR(40) NOT NULL,
   student_lname VARCHAR(40) NOT NULL,
   student_grade VARCHAR(15) NOT NULL,
   PRIMARY KEY (student_regnum)
);

INSERT INTO student_attendance_tbl (student_regnum, student_fname, student_lname, student_grade) \
VALUES ("stud-avng-001", "Anthony", "Stark", "Seventh Grade");
INSERT INTO student_attendance_tbl (student_regnum, student_fname, student_lname, student_grade) \
VALUES ("stud-avng-002", "Natasha", "Romanov", "Second Grade");
INSERT INTO student_attendance_tbl (student_regnum, student_fname, student_lname, student_grade) \
VALUES ("stud-avng-003", "Mark", "Rafallo", "First Grade");
INSERT INTO student_attendance_tbl (student_regnum, student_fname, student_lname, student_grade) \
VALUES ("stud-avng-004", "Steven", "Strange", "Third Grade");
INSERT INTO student_attendance_tbl (student_regnum, student_fname, student_lname, student_grade) \
VALUES ("stud-avng-005", "Steve", "Rogers", "Fourth Grade");
INSERT INTO student_attendance_tbl (student_regnum, student_fname, student_lname, student_grade) \
VALUES ("stud-avng-006", "Francis", "Barton", "Nineth Grade");
INSERT INTO student_attendance_tbl (student_regnum, student_fname, student_lname, student_grade) \
VALUES ("stud-avng-007", "Paul", "Bethany", "First Grade");
INSERT INTO student_attendance_tbl (student_regnum, student_fname, student_lname, student_grade) \
VALUES ("stud-avng-008", "Christopher", "Helmsworth", "Second Grade");
