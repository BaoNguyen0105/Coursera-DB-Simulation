DELIMITER $$

CREATE PROCEDURE Recalc_Complete_Percentage(IN p_enroll_id INT)
BEGIN
    DECLARE v_course_id INT;
    DECLARE v_total_items INT DEFAULT 0;
    DECLARE v_completed_items INT DEFAULT 0;
    DECLARE v_percentage INT DEFAULT 0;

    SELECT Course_ID INTO v_course_id
    FROM Enrollment
    WHERE Enroll_ID = p_enroll_id;

    IF v_course_id IS NOT NULL THEN
        SELECT COUNT(*) INTO v_total_items
        FROM Learning_Item
        WHERE Course_ID = v_course_id;

        SELECT COUNT(DISTINCT MP.Learning_Item_ID,
                                  MP.Learning_Item_Module_Title,
                                  MP.Learning_Item_Course_ID)
        INTO v_completed_items
        FROM Make_Progress MP
        WHERE MP.Enroll_ID = p_enroll_id
          AND (MP.Score > 0 OR MP.Completion_Time > '00:00:00');

        IF v_total_items > 0 THEN
            SET v_percentage = ROUND(100 * v_completed_items / v_total_items);
        ELSE
            SET v_percentage = 0;
        END IF;
    END IF;

    UPDATE Enrollment
    SET Complete_Percentage = v_percentage
    WHERE Enroll_ID = p_enroll_id;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_mp_after_insert
AFTER INSERT ON Make_Progress
FOR EACH ROW
BEGIN
    CALL Recalc_Complete_Percentage(NEW.Enroll_ID);
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_mp_after_update
AFTER UPDATE ON Make_Progress
FOR EACH ROW
BEGIN
    -- Nếu Enroll_ID không đổi thì dùng NEW, 
    -- nếu có thể đổi Enroll_ID thì cần tính cho cả OLD và NEW
    IF NEW.Enroll_ID = OLD.Enroll_ID THEN
        CALL Recalc_Complete_Percentage(NEW.Enroll_ID);
    ELSE
        CALL Recalc_Complete_Percentage(OLD.Enroll_ID);
        CALL Recalc_Complete_Percentage(NEW.Enroll_ID);
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_mp_after_delete
AFTER DELETE ON Make_Progress
FOR EACH ROW
BEGIN
    CALL Recalc_Complete_Percentage(OLD.Enroll_ID);
END $$

DELIMITER ;


