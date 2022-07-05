-- Подсчитаем количество работников, которые родились в 70-х, 80-х, 90-х и годах
SELECT
	COUNT(*) AS count_employees,
	SUBSTRING(birthday, 1, 3) AS decade
FROM
	profiles_employees
GROUP BY
	decade
ORDER BY
	decade DESC;
	
-- найдем сотрудника с самой высокой зарплатой 
SELECT
	employee_id
FROM
	profiles_employees
WHERE
	salary = (SELECT MAX(salary) FROM profiles_employees);

-- выберем сотрудников с зарплатой выше средней 
SELECT
	employee_id
FROM
	profiles_employees
WHERE
	salary > (SELECT AVG(salary) FROM profiles_employees);

-- выберем все отделы, в которых работает свыше 8 сотрудников
SELECT 
	* 
FROM 
	departments 
WHERE id IN (SELECT departments_id 
			FROM employees_departments GROUP BY departments_id HAVING COUNT(*) > 8);

-- выберем должности с указанием средней зарплаты в каждой из них
SELECT 
	*, 
	(SELECT AVG(salary) FROM profiles_employees
 	WHERE profiles_employees.post_employees_id = post_employees.id
) AS avg_salary FROM post_employees;


-- выведем имя сотрудника и содержание его выполненной работы
SELECT 
	e.firstname,
	ed.body
FROM
	employees AS e 
JOIN
	engineering_documentation AS ed
WHERE 
	e.id = ed.id;

-- выведем информацию какой отдел отвественен за определенный двигатель
SELECT 
	e.name AS name_engine,	
	d.name AS name_department 	
FROM
	engines AS e	
JOIN
	departments AS d 
WHERE 
	e.id = d.id;





















