-- сделаем процедуру, которая считает количество поставщиков
DROP PROCEDURE IF EXISTS sp_suppliers;

DELIMITER //
CREATE PROCEDURE sp_suppliers()
BEGIN 
	SELECT COUNT(*)
	FROM suppliers;
END //

DELIMITER ;

CALL sp_suppliers();

-- сделаем процедуру, которая возращает количество сотрудников в отделе в зависимости от входных параметров
DROP PROCEDURE IF EXISTS get_employees;

DELIMITER //
CREATE PROCEDURE get_employees(IN x INT(3))
BEGIN 
	SELECT COUNT(*)
	FROM employees_departments
	WHERE departments_id = x;
END //

DELIMITER ;

CALL get_employees('1');