-- триггер, который извлекает количество клиентов в таблице clients
DELIMITER //
CREATE TRIGGER clients_count AFTER INSERT ON clients
FOR EACH ROW
BEGIN
	SELECT COUNT(*) INTO @total FROM clients;
END//


INSERT INTO clients (id, name, created_at, updated_at) VALUES ('101', 'unde', '1981-11-24 09:10:19', '1994-09-04 11:29:59');

-- проверка 
SELECT * FROM clients;

SELECT @total;

-- № 2 триггер, который проверяет превышает ли значение заработной платы (salary), вставляемое в таблицу профилей сотрудников, величину 100000, и выдает ошибку, если это так
DELIMITER //
CREATE TRIGGER validate_salary_amount
BEFORE INSERT
ON profiles_employees
FOR EACH ROW
	IF NEW.salary > 100000 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Salary has exceeded the allowed amount of 10000';
END IF//
DELIMITER ;

-- проверка 
INSERT INTO profiles_employees (employee_id, post_employees_id, gender, birthday, salary, created_at) VALUES ('101', '5', 'F', '1979-11-21', 104302, '1993-06-25 03:20:59');


