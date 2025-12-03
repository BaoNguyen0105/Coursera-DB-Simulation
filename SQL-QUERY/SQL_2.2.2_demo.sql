-- ==========================================
-- DỮ LIỆU CƠ SỞ PHỤC VỤ TEST TRIGGER
-- ==========================================

-- 1. Users: 1 student (36) và 1 teacher (37)
INSERT INTO Users (
    ID, Username, User_Password, Email, Phone,
    First_Name, Last_Name, Sex, Create_Dated
) VALUES
(36, 'student', 'pw', 'student@example.com', '0123456789',
 'Stu', 'Dent', 'M', '2024-01-01'),
(37, 'teacher', 'pw', 'teacher@example.com', '0987654321',
 'Tea', 'Cher', 'F', '2024-01-01');

-- 2. Student (36) tham gia khoá học
INSERT INTO Student (
    ID, Date_of_birth, Number_course_enrolled, Number_course_completed
) VALUES
(36, '2004-01-01', 0, 0);

-- 3. Teacher (37) dạy khoá học
INSERT INTO Teacher (
    ID, Title
) VALUES
(37, 'Professor');

-- 4. Course 36: khoá có Learning_Item
INSERT INTO Course (
    ID,
    Title,
    Course_Language,
    Course_Description,
    Price,
    Course_Level,
    Duration,
    Teacher_ID,
    Delete_Date,
    Delete_By,
    Course_Status
) VALUES (
    36,
    'Intro DB',
    'English',
    'Test course with learning items',
    'Free',
    'Beginner',
    '1h',
    37,         -- Teacher_ID
    NULL,       -- Delete_Date
    NULL,       -- Delete_By
    'Available' -- Course_Status
);

-- 5. Course 37: khoá *không có* Learning_Item (test v_total_items = 0)
INSERT INTO Course (
    ID,
    Title,
    Course_Language,
    Course_Description,
    Price,
    Course_Level,
    Duration,
    Teacher_ID,
    Delete_Date,
    Delete_By,
    Course_Status
) VALUES (
    37,
    'No Item Course',
    'English',
    'Course without learning items',
    'Free',
    'Any',
    '0h',
    37,
    NULL,
    NULL,
    'Available'
);

-- 6. Module cho Course 36
INSERT INTO Module (
    Title,
    Course_ID,
    Duration
) VALUES (
    'Chapter 1',
    36,
    '30m'
);

-- 7. 2 Learning_Item thuộc Course 36, Module 'Chapter 1'
INSERT INTO Learning_Item (
    ID,
    Module_Title,
    Course_ID,
    Item_Order,
    Content_Type,
    Title
) VALUES
(1, 'Chapter 1', 36, 1, 'video',   'Video 1'),
(2, 'Chapter 1', 36, 2, 'reading', 'Doc 1');

-- 8. Enrollment cho Student 36, Course 36
INSERT INTO Enrollment (
    Enroll_ID,
    Enroll_date,
    Complete_Percentage,
    Student_ID,
    Course_ID
) VALUES (
    3600,
    '2024-01-01',
    0,
    36,
    36
);

-- Enrollment cho Course 37 (không có Learning_Item)
INSERT INTO Enrollment (
    Enroll_ID,
    Enroll_date,
    Complete_Percentage,
    Student_ID,
    Course_ID
) VALUES (
    3700,
    '2024-01-02',
    0,
    36,
    37
);

-- ==========================================
-- TEST 0: Ban đầu Complete_Percentage = 0 ?
-- ==========================================
SELECT Enroll_ID, Course_ID, Complete_Percentage
FROM Enrollment
WHERE Enroll_ID IN (3600, 3700);
-- Kỳ vọng: cả 2 đều = 0

-- ==========================================
-- TEST 1: INSERT 1 tiến độ cho Learning_Item 1
-- → 1/2 item hoàn thành → 50%
-- Điều kiện hoàn thành: Score > 0 hoặc Completion_Time > '00:00:00'
-- ==========================================
INSERT INTO Make_Progress (
    Enroll_ID,
    Learning_Item_ID,
    Learning_Item_Module_Title,
    Learning_Item_Course_ID,
    Completion_Time,
    Score,
    Total_Time_Limit
) VALUES (
    3600,
    1,
    'Chapter 1',
    36,
    '00:05:00',   -- > '00:00:00'
    10,           -- > 0
    '00:10:00'
);

SELECT Enroll_ID, Complete_Percentage
FROM Enrollment
WHERE Enroll_ID = 3600;
-- Kỳ vọng: 50 (vì 1/2 item)

-- ==========================================
-- TEST 2: Thêm 1 tiến độ *trùng* Learning_Item 1
-- → DISTINCT nên không tăng số lượng item hoàn thành
-- ==========================================
INSERT INTO Make_Progress (
    Enroll_ID,
    Learning_Item_ID,
    Learning_Item_Module_Title,
    Learning_Item_Course_ID,
    Completion_Time,
    Score,
    Total_Time_Limit
) VALUES (
    3600,
    1,
    'Chapter 1',
    36,
    '00:10:00',
    5,
    '00:10:00'
);

SELECT Enroll_ID, Complete_Percentage
FROM Enrollment
WHERE Enroll_ID = 3600;
-- Kỳ vọng: vẫn 50

-- ==========================================
-- TEST 3: Hoàn thành Learning_Item 2
-- → 2/2 item hoàn thành → 100%
-- ==========================================
INSERT INTO Make_Progress (
    Enroll_ID,
    Learning_Item_ID,
    Learning_Item_Module_Title,
    Learning_Item_Course_ID,
    Completion_Time,
    Score,
    Total_Time_Limit
) VALUES (
    3600,
    2,
    'Chapter 1',
    36,
    '00:07:00',   -- > '00:00:00' → tính là hoàn thành
    0,            -- Score = 0 cũng không sao
    '00:10:00'
);

SELECT Enroll_ID, Complete_Percentage
FROM Enrollment
WHERE Enroll_ID = 3600;
-- Kỳ vọng: 100

-- ==========================================
-- TEST 4: Xoá tiến độ của Learning_Item 2
-- → chỉ còn 1/2 item hoàn thành → 50%
-- ==========================================
DELETE FROM Make_Progress
WHERE Enroll_ID = 3600
  AND Learning_Item_ID = 2
  AND Learning_Item_Module_Title = 'Chapter 1'
  AND Learning_Item_Course_ID = 36;

SELECT Enroll_ID, Complete_Percentage
FROM Enrollment
WHERE Enroll_ID = 3600;
-- Kỳ vọng: 50

-- ==========================================
-- TEST 5: Course 37 không có Learning_Item
-- → v_total_items = 0 → Complete_Percentage = 0
-- ==========================================
CALL Recalc_Complete_Percentage(3700);

SELECT Enroll_ID, Course_ID, Complete_Percentage
FROM Enrollment
WHERE Enroll_ID = 3700;
-- Kỳ vọng: 0
