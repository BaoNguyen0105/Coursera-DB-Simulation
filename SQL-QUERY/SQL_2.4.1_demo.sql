-- Users
INSERT INTO Users 
VALUES (101, 'stud1', 'pw', 'stud1@test.com', '0123', 'A', 'B', 'M', '2024-01-01');

-- Student
INSERT INTO Student VALUES (101, '2004-01-01', 0, 0);

-- Teacher (để tạo Course)
INSERT INTO Users 
VALUES (102, 'teach1', 'pw', 'teach1@test.com', '0124', 'T', 'C', 'F', '2024-01-01');

INSERT INTO Teacher VALUES (102, 'Professor');

-- Course 1
INSERT INTO Course 
(ID, Title, Course_Language, Course_Description, Price, Course_Level, Duration, Teacher_ID)
VALUES
(201, 'DB Basic', 'EN', 'Demo', 'Free', 'Beginner', '1h', 102);

-- Course 2
INSERT INTO Course 
(ID, Title, Course_Language, Course_Description, Price, Course_Level, Duration, Teacher_ID)
VALUES
(202, 'Network Intro', 'EN', 'Demo', 'Free', 'Beginner', '1h', 102);

-- Course 3
INSERT INTO Course 
(ID, Title, Course_Language, Course_Description, Price, Course_Level, Duration, Teacher_ID)
VALUES
(203, 'OOP', 'EN', 'Demo', 'Free', 'Beginner', '1h', 102);

-- Enrollment cho student 101
INSERT INTO Enrollment (Enroll_ID, Enroll_date, Complete_Percentage, Student_ID, Course_ID)
VALUES 
(3001, '2024-01-01', 100, 101, 201),   -- hoàn thành
(3002, '2024-01-01', 85,  101, 202),   -- chưa hoàn thành
(3003, '2024-01-01', 120, 101, 203);   -- hoàn thành

SET @completed = 0;

CALL Calc_Student_Completed_Courses(101, @completed);

SELECT @completed AS Number_of_Completed_Courses;
