DROP PROCEDURE IF EXISTS Calc_Student_Completed_Courses;
DELIMITER $$

CREATE PROCEDURE Calc_Student_Completed_Courses(
    IN  p_student_id INT,
    OUT p_completed  INT
)
BEGIN
    DECLARE v_cp   INT;
    DECLARE done   INT DEFAULT 0;

    DECLARE cur_enroll CURSOR FOR
        SELECT Complete_Percentage
        FROM Enrollment
        WHERE Student_ID = p_student_id;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Mặc định
    SET p_completed = 0;

    -- Kiểm tra tham số đầu vào
    IF p_student_id IS NULL OR p_student_id <= 0 THEN
        -- giữ nguyên p_completed = 0
        SET p_completed = p_completed;       -- câu lệnh “no-op”
        
    ELSEIF NOT EXISTS (SELECT 1 FROM Student WHERE ID = p_student_id) THEN
        -- sinh viên không tồn tại, cũng giữ 0
        SET p_completed = p_completed;       -- có ít nhất 1 câu lệnh
        
    ELSE
        -- Tham số hợp lệ, bắt đầu duyệt con trỏ
        OPEN cur_enroll;

        read_loop: LOOP
            FETCH cur_enroll INTO v_cp;
            IF done = 1 THEN
                LEAVE read_loop;
            END IF;

            -- Nếu hoàn thành khoá học (>= 100%)
            IF v_cp >= 100 THEN
                SET p_completed = p_completed + 1;
            END IF;
        END LOOP;

        CLOSE cur_enroll;
    END IF;
END $$
DELIMITER ;
