/* INSERT ALL */
CREATE TABLE name_empl (COD_EMP NUMBER, first_name VARCHAR2(100));
CREATE TABLE wages (COD_EMP NUMBER, salary NUMBER);

INSERT ALL
    INTO name_empl VALUES(employee_id, first_name)
    INTO wages VALUES (employee_id, salary)
SELECT * FROM employees;
    
    -- Insert Constants
INSERT ALL
    INTO name_empl VALUES (999, 'Pedro')
    INTO wages VALUES (999, 1000)
SELECT 1 FROM DUAL;



/* INSERT ALL WITH CONDITIONAL */
CREATE TABLE emp_manager (cod_emp NUMBER, name VARCHAR2(100), salary NUMBER);
CREATE TABLE emp_supervisor (cod_emp NUMBER, name VARCHAR2(100), salary NUMBER, department NUMBER);
CREATE TABLE emp_normal (cod_emp NUMBER, name VARCHAR2(100), salary NUMBER, supervisor NUMBER);
CREATE TABLE financial(cod_emp NUMBER, name VARCHAR2(100), salary NUMBER, supervisor NUMBER);

INSERT ALL
    WHEN salary > 10000 THEN
        INTO emp_manager VALUES (employee_id, first_name || ' '|| last_name, salary)
    WHEN salary BETWEEN 8000 AND 10000 THEN
        INTO emp_supervisor VALUES (employee_id, first_name||' '||last_name, salary, department_id)
    WHEN salary < 8000 THEN
        INTO emp_normal VALUES (employee_id, first_name||' '||last_name, salary, manager_id)
    WHEN department_id = 100 THEN
        INTO financial VALUES (employee_id, first_name||' '||last_name, salary, manager_id)
SELECT * FROM employees;


/* INSERT FIRST */
TRUNCATE TABLE emp_manager;
TRUNCATE TABLE emp_supervisor;
TRUNCATE TABLE emp_normal;
TRUNCATE TABLE financial;

INSERT FIRST
    WHEN department_id = 100 THEN
        INTO financial VALUES (employee_id, first_name||' '||last_name, salary, manager_id)
    WHEN salary > 10000 THEN
        INTO emp_manager VALUES (employee_id, first_name || ' '|| last_name, salary)
    WHEN salary BETWEEN 8000 AND 10000 THEN
        INTO emp_supervisor VALUES (employee_id, first_name||' '||last_name, salary, department_id)
    WHEN salary < 8000 THEN
        INTO emp_normal VALUES (employee_id, first_name||' '||last_name, salary, manager_id)
SELECT * FROM employees;
    -- Records in financial are not repeated in other tables
SELECT COUNT(*) FROM financial;



