DELIMITER $$

CREATE TRIGGER trg_CheckQuizAttempts
BEFORE INSERT ON Make_Progress
FOR EACH ROW
BEGIN
    DECLARE v_max_attempts INT;
    DECLARE v_current_attempts INT;
    DECLARE v_is_quiz INT;
    
    SELECT 
        COUNT(*), 
        MAX(Max_Attempt) 
    INTO 
        v_is_quiz, 
        v_max_attempts
    FROM 
        Quiz
    WHERE 
        ID = NEW.Learning_Item_ID 
        AND Module_Title = NEW.Learning_Item_Module_Title 
        AND Course_ID = NEW.Learning_Item_Course_ID;

    IF v_is_quiz > 0 THEN
        SELECT COUNT(*) 
        INTO v_current_attempts
        FROM Make_Progress
        WHERE 
            Enroll_ID = NEW.Enroll_ID
            AND Learning_Item_ID = NEW.Learning_Item_ID
            AND Learning_Item_Module_Title = NEW.Learning_Item_Module_Title
            AND Learning_Item_Course_ID = NEW.Learning_Item_Course_ID;
            
        IF v_current_attempts >= v_max_attempts THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Đã vượt quá số lần làm bài kiểm tra tối đa.';
        END IF;
    END IF;
END$$

DELIMITER ;