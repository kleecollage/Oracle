/* GROUP FUNCTIONS */
    -- AVG(<NUMBER>)
SELECT AVG(salary) FROM employees;
    -- MAX(VALUE)
SELECT MAX(salary) FROM employees;
    -- MIN(VALUE)
SELECT MIN(salary) FROM employees;

SELECT AVG(salary), MAX(salary), MIN(salary) FROM employees;
SELECT AVG(salary), MAX(salary), MIN(salary) FROM employees WHERE department_id = 50;

SELECT MAX(hire_date) , MIN(hire_date)FROM employees;
SELECT MAX(first_name) , MIN(first_name)FROM employees;


    -- COUNT
SELECT COUNT(first_name) FROM employees;
SELECT COUNT(salary), COUNT(commission_pct) FROM employees;
SELECT COUNT(employee_id) FROM employees;

SELECT COUNT(*) FROM employees;
SELECT COUNT(*) FROM employees WHERE department_id = 60;
SELECT COUNT(*) FROM employees WHERE salary > 6000;

SELECT COUNT(DISTINCT first_name) FROM employees;
SELECT COUNT(DISTINCT department_id) FROM employees;
SELECT DISTINCT department_id FROM employees ORDER BY department_id DESC;


    -- SUM
SELECT SUM(salary) AS "Sum Salaries", SUM(salary)*12 AS "Anual Income", COUNT(*) AS "Total Employees" FROM employees WHERE department_id = 50;
SELECT MAX(salary) - MIN(salary) FROM employees;


    -- GROUP BY
SELECT department_id, job_id, COUNT(*), SUM(salary) FROM employees GROUP BY department_id, job_id ORDER BY department_id;


    -- HAVING CLAUSE
SELECT department_id, job_id, COUNT(*), SUM(salary) 
    FROM employees WHERE salary>5000 
    GROUP BY department_id, job_id
    ORDER BY department_id;

SELECT department_id, job_id, COUNT(*), SUM(salary) 
    FROM employees 
    GROUP BY department_id, job_id HAVING SUM(salary)>25000 AND COUNT(*)>10
    ORDER BY department_id;

SELECT COUNT(*) FROM employees WHERE department_id=50;

SELECT COUNT(*) FROM employees WHERE hire_date BETWEEN '01/JAN/2007' AND'31/DEC/2007';
SELECT COUNT(*) FROM employees WHERE TO_CHAR(hire_date, 'YYYY')=2007;

SELECT MAX(salary)-MIN(salary) FROM employees;

SELECT SUM(salary) FROM employees WHERE department_id = 100;

SELECT department_id, TO_CHAR(AVG(salary), 'L999,999.99') FROM employees GROUP BY department_id ORDER BY department_id;
SELECT department_id, ROUND(AVG(salary), 2) FROM employees GROUP BY department_id ORDER BY department_id;

SELECT country_id, COUNT(city) FROM locations GROUP BY country_id;

SELECT department_id, ROUND(AVG(salary), 2) FROM employees WHERE commission_pct IS NOT NULL 
    GROUP BY department_id ORDER BY department_id;
    
SELECT TO_CHAR(hire_date, 'YYYY'), COUNT(*) FROM employees GROUP BY TO_CHAR(hire_date, 'YYYY') HAVING COUNT(employee_id) > 10;

SELECT department_id, TO_CHAR(hire_date, 'YYYY'), COUNT(*) FROM employees GROUP BY TO_CHAR(hire_date, 'YYYY'), department_id;

SELECT DISTINCT department_id FROM employees GROUP BY department_id, manager_id HAVING COUNT(employee_id) > 5;






