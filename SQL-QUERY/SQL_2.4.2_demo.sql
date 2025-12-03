-- =========================
-- 1. TEACHER USERS & TEACHER
-- =========================

INSERT INTO Users (
    ID, Username, User_Password, Email, Phone,
    First_Name, Last_Name, Sex, Create_Dated
) VALUES
    (2410001, 'tt_nam',   'pw', 'nam.tran@hcmut.edu.vn',    '0901000001', 'Nam',   'Tran',   'M', '2024-01-01'),
    (2410002, 'lt_thao',  'pw', 'thao.le@hcmut.edu.vn',    '0901000002', 'Thao',  'Le',     'F', '2024-01-02'),
    (2410003, 'pv_huy',   'pw', 'huy.pham@hcmut.edu.vn',   '0901000003', 'Huy',   'Pham',   'M', '2024-01-03'),
    (2410004, 'nd_anh',   'pw', 'anh.nguyen@hcmut.edu.vn', '0901000004', 'Anh',   'Nguyen', 'F', '2024-01-04'),
    (2410005, 'vn_khoa',  'pw', 'khoa.vo@hcmut.edu.vn',    '0901000005', 'Khoa',  'Vo',     'M', '2024-01-05');

INSERT INTO Teacher (ID, Title) VALUES
    (2410001, 'Assoc. Prof.'),
    (2410002, 'Dr.'),
    (2410003, 'MSc.'),
    (2410004, 'Lecturer'),
    (2410005, 'Lecturer');

-- =========================
-- 2. COURSES (5–6 KHÓA)
-- =========================

INSERT INTO Course (
    ID, Title, Course_Language, Course_Description, Price,
    Course_Level, Duration, Teacher_ID,
    Delete_Date, Delete_By, Course_Status
) VALUES
-- C1: Web Backend
(51001,
 'Web Programming with Node.js',
 'English',
 'Introduction to building backend REST APIs with Node.js, Express and basic deployment.',
 '49 USD',
 'Beginner',
 '6 weeks',
 2410001,
 NULL, NULL, 'Available'),

-- C2: Database Systems (HCMUT style)
(51002,
 'CO2013 - Database Systems',
 'Vietnamese',
 'Core concepts of relational databases, SQL, normalization and transaction processing.',
 '65 USD',
 'Intermediate',
 '10 weeks',
 2410002,
 NULL, NULL, 'Available'),

-- C3: Machine Learning căn bản
(51003,
 'Machine Learning Fundamentals',
 'English',
 'Supervised learning, regularization, model evaluation and basic ML workflows.',
 '79 USD',
 'Intermediate',
 '8 weeks',
 2410003,
 NULL, NULL, 'Available'),

-- C4: Operating Systems & Linux
(51004,
 'Operating Systems with Linux',
 'Vietnamese',
 'Processes, threads, scheduling, memory management and intro to Linux commands.',
 '59 USD',
 'Intermediate',
 '8 weeks',
 2410004,
 NULL, NULL, 'Available'),

-- C5: Network Fundamentals (Cisco-ish)
(51005,
 'Network Fundamentals (Cisco-style)',
 'English',
 'TCP/IP, switching, routing basics, subnetting and small campus network design.',
 '99 USD',
 'Beginner',
 '6 weeks',
 2410005,
 NULL, NULL, 'Available'),

-- C6: Capstone SE Project (TSS)
(51006,
 'Software Engineering Project - Tutor Support System',
 'Vietnamese',
 'Term-long project to design, implement and demo a Tutor Support System for HCMUT.',
 '120 USD',
 'Advanced',
 '12 weeks',
 2410002,
 NULL, NULL, 'Available');

-- =========================
-- 3. STUDENT USERS & STUDENT
-- =========================

INSERT INTO Users (
    ID, Username, User_Password, Email, Phone,
    First_Name, Last_Name, Sex, Create_Dated
) VALUES
    (2411001, 'sv_hkhanh', 'pw', 'hong.khanh@student.hcmut.edu.vn', '0912000001', 'Hong',   'Khanh', 'F', '2024-02-01'),
    (2411002, 'sv_mnhut',  'pw', 'minh.nhut@student.hcmut.edu.vn',  '0912000002', 'Minh',   'Nhut',  'M', '2024-02-02'),
    (2411003, 'sv_tlam',   'pw', 'thanh.lam@student.hcmut.edu.vn',  '0912000003', 'Thanh',  'Lam',   'M', '2024-02-03'),
    (2411004, 'sv_ttien',  'pw', 'thanh.tien@student.hcmut.edu.vn', '0912000004', 'Thanh',  'Tien',  'M', '2024-02-04'),
    (2411005, 'sv_qlinh',  'pw', 'quynh.linh@student.hcmut.edu.vn', '0912000005', 'Quynh',  'Linh',  'F', '2024-02-05'),
    (2411006, 'sv_tnghia', 'pw', 'thanh.nghia@student.hcmut.edu.vn','0912000006', 'Thanh',  'Nghia', 'M', '2024-02-06'),
    (2411007, 'sv_mthao',  'pw', 'my.thao@student.hcmut.edu.vn',    '0912000007', 'My',     'Thao',  'F', '2024-02-07'),
    (2411008, 'sv_ptuan',  'pw', 'phuc.tuan@student.hcmut.edu.vn',  '0912000008', 'Phuc',   'Tuan',  'M', '2024-02-08'),
    (2411009, 'sv_ytrang', 'pw', 'yen.trang@student.hcmut.edu.vn',  '0912000009', 'Yen',    'Trang', 'F', '2024-02-09'),
    (2411010, 'sv_hluan',  'pw', 'huu.luan@student.hcmut.edu.vn',   '0912000010', 'Huu',    'Luan',  'M', '2024-02-10');

INSERT INTO Student (
    ID, Date_of_birth, Number_course_enrolled, Number_course_completed
) VALUES
    (2411001, '2004-01-01', 0, 0),
    (2411002, '2004-02-02', 0, 0),
    (2411003, '2004-03-03', 0, 0),
    (2411004, '2004-04-04', 0, 0),
    (2411005, '2004-05-05', 0, 0),
    (2411006, '2004-06-06', 0, 0),
    (2411007, '2004-07-07', 0, 0),
    (2411008, '2004-08-08', 0, 0),
    (2411009, '2004-09-09', 0, 0),
    (2411010, '2004-10-10', 0, 0);

-- =========================
-- 4. ENROLLMENT
-- =========================

INSERT INTO Enrollment (
    Enroll_ID, Enroll_date, Complete_Percentage,
    Student_ID, Course_ID
) VALUES
-- ===== COURSE 51001: Web Node.js =====
    (710000, '2024-03-01', 100, 2411001, 51001),
    (710001, '2024-03-02',  80, 2411002, 51001),
    (710002, '2024-03-05', 100, 2411003, 51001),
    (710003, '2024-03-06',  20, 2411004, 51001),

-- ===== COURSE 51002: DB Systems =====
    (710010, '2024-04-01', 100, 2411001, 51002),
    (710011, '2024-04-02', 100, 2411005, 51002),
    (710012, '2024-04-03', 100, 2411006, 51002),

-- ===== COURSE 51003: Machine Learning =====
    (710020, '2024-05-01',  60, 2411007, 51003),
    (710021, '2024-05-02',  10, 2411008, 51003),
    (710022, '2024-05-03',   0, 2411009, 51003),

-- ===== COURSE 51004: OS & Linux (Free/Sponsored) =====
    (710030, '2024-06-01', 100, 2411002, 51004),
    (710031, '2024-06-02', 100, 2411003, 51004),

-- ===== COURSE 51005: Network Fundamentals =====
    (710040, '2024-07-01', 100, 2411004, 51005),
    (710041, '2024-07-02',  90, 2411005, 51005),
    (710042, '2024-07-03', 100, 2411006, 51005),

-- ===== COURSE 51006: SE Project (Capstone) =====
    (710050, '2024-08-01', 100, 2411010, 51006);

-- =========================
-- 5. PAYMENT
-- =========================

INSERT INTO Payment (
    ID, Payment_date, Method, Payment_Status, Ammount, Enroll_ID
) VALUES
-- ----- COURSE 51001: Web Node.js -----
-- 2411001: Finish 49 USD -> CỘNG
(610000, '2024-03-10', 'Card',     'Finish',   '49 USD',     710000),
-- 2411002: Unfinish 49 USD -> KHÔNG cộng
(610001, '2024-03-11', 'Card',     'Unfinish', '49 USD',     710001),
-- 2411003: Finish 49 USD -> CỘNG
(610002, '2024-03-12', 'Bank',     'Finish',   '49 USD',     710002),
-- 2411004: Finish nhưng Free (học bổng 100%) -> KHÔNG cộng
(610003, '2024-03-13', 'Scholar',  'Finish',   'Free',       710003),

-- EXPECTED REVENUE 51001 = 49 + 49 = 98.00

-- ----- COURSE 51002: DB Systems -----
-- 2411001: Full price 65 USD
(610010, '2024-04-10', 'Card',     'Finish',   '65 USD',     710010),
-- 2411005: Full price 65 USD
(610011, '2024-04-11', 'Bank',     'Finish',   '65 USD',     710011),
-- 2411006: Học bổng 50% -> 32.50 USD
(610012, '2024-04-12', 'Card',     'Finish',   '32.50 USD',  710012),

-- EXPECTED REVENUE 51002 = 65 + 65 + 32.5 = 162.50

-- ----- COURSE 51003: Machine Learning -----
-- tất cả Unfinish hoặc chưa có Payment
(610020, '2024-05-10', 'Card',     'Unfinish', '79 USD',     710020),
(610021, '2024-05-11', 'Momo',     'Unfinish', '79 USD',     710021),
-- 710022: chưa có payment => không tính

-- EXPECTED REVENUE 51003 = 0.00

-- ----- COURSE 51004: OS & Linux (Free/Sponsored) -----
(610030, '2024-06-10', 'Sponsor',  'Finish',   'Free',       710030),
(610031, '2024-06-11', 'Sponsor',  'Finish',   'Free',       710031),

-- EXPECTED REVENUE 51004 = 0.00

-- ----- COURSE 51005: Network Fundamentals -----
-- Early bird 79.00 USD
(610040, '2024-07-10', 'Card',     'Finish',   '79 USD',     710040),
-- Standard 99.00 USD nhưng Unfinish
(610041, '2024-07-11', 'Card',     'Unfinish', '99 USD',     710041),
-- Corporate discount 89.50 USD
(610042, '2024-07-12', 'Transfer', 'Finish',   '89.50 USD',  710042),

-- EXPECTED REVENUE 51005 = 79 + 89.5 = 168.50

-- ----- COURSE 51006: SE Project (Capstone) -----
(610050, '2024-08-10', 'Bank',     'Finish',   '120 USD',    710050);

-- EXPECTED REVENUE 51006 = 120.00

-- =========================
-- 6. TEST GỌI HÀM REVENUE
-- =========================

SET @rev := 0;
CALL Calc_Course_Revenue(51001, @rev);
SELECT @rev AS revenue_course_51001_expected_98_00;

SET @rev := 0;
CALL Calc_Course_Revenue(51002, @rev);
SELECT @rev AS revenue_course_51002_expected_162_50;

SET @rev := 0;
CALL Calc_Course_Revenue(51003, @rev);
SELECT @rev AS revenue_course_51003_expected_0_00;

SET @rev := 0;
CALL Calc_Course_Revenue(51004, @rev);
SELECT @rev AS revenue_course_51004_expected_0_00;

SET @rev := 0;
CALL Calc_Course_Revenue(51005, @rev);
SELECT @rev AS revenue_course_51005_expected_168_50;

SET @rev := 0;
CALL Calc_Course_Revenue(51006, @rev);
SELECT @rev AS revenue_course_51006_expected_120_00;