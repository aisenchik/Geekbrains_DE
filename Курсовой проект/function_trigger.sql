delimiter //
CREATE DEFINER=`root`@`localhost` FUNCTION `last_activity`(for_user_id INT) RETURNS date
    READS SQL DATA
BEGIN
	DECLARE last_usage DATE;
    
    SELECT DATE(MAX(created_at))
    INTO last_usage
    FROM tbl_order to2
    WHERE pass_id = for_user_id OR driver_id = for_user_id
    AND status = 'done';
    
RETURN DATE(last_usage);
END //


CREATE TRIGGER nullTrigger BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF(ISNULL(NEW.name) AND ISNULL(NEW.description)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Trigger Warning! NULL in both fields!';
	END IF;
END //
delimiter ;