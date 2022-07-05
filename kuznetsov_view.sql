-- создадим представление, которое извлекает из таблицы engines только газотурбинные двигатели (Gas turbine engines)
CREATE OR REPLACE VIEW gas_turbine_engines AS
	SELECT id, name 
	FROM engines
WHERE engines_type_id = 1;

SELECT * FROM gas_turbine_engines;


-- создадим представление, которое извлекает количество сотрудников ОКБ, кто написал выпустил технические справки (Technical report)
CREATE OR REPLACE VIEW technical_report AS
	SELECT COUNT(employee_id) 
	FROM engineering_documentation
WHERE engineering_documentation_type_id = 1;


SELECT * FROM technical_report;

