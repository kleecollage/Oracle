/* SUBQUERIES */
SELECT MAX(salary) FROM employees;
SELECT first_name, salary FROM employees WHERE salary = 24000;

    -- Return 1 row only
SELECT first_name, salary FROM employees WHERE salary = (SELECT MAX(salary) FROM employees);
    
SELECT first_name, department_id FROM employees 
    WHERE department_id = (SELECT department_id FROM employees WHERE first_name = 'Douglas' AND last_name = 'Grant');

    -- First you should try the subquery response ;)
SELECT AVG(salary) from employees;
SELECT first_name, last_name, salary FROM employees
    WHERE salary > (SELECT AVG(salary) from employees)
    AND department_id = 50;

SELECT first_name, last_name, salary FROM employees 
    WHERE salary <= (SELECT MIN(salary) FROM employees);
    
SELECT department_name, city FROM departments JOIN locations USING(location_id) WHERE city='Toronto';
        -- same result with subquery:
SELECT DEPARTMENT_NAME FROM DEPARTMENTS WHERE LOCATION_ID=(SELECT LOCATION_ID FROM LOCATIONS WHERE CITY='Toronto');

SELECT department_id, first_name, last_name FROM employees 
    WHERE department_id = (SELECT department_id from employees WHERE first_name = 'John' AND last_name = 'Chen');

SELECT city FROM locations JOIN departments USING (location_id) 
    WHERE department_id = (SELECT department_id FROM employees WHERE first_name='Guy' AND last_name='Himuro');
        -- same result with multiple subqueries:
SELECT city FROM locations 
    WHERE location_id = (SELECT location_id FROM departments 
        WHERE department_id = (SELECT department_id FROM employees WHERE first_name='Guy' AND last_name='Himuro'));
        


    -- HAVING CLAUSE
SELECT department_id, ROUND(AVG(salary), 2) AS "Salary Per Department" FROM employees
    GROUP BY department_id HAVING AVG(salary) > (SELECT AVG(salary) from employees);




/* MULTIPLE ROWS */
    -- IN
SELECT first_name, department_id FROM employees
    WHERE (department_id, salary) IN (SELECT department_id, MAX(salary) FROM employees GROUP BY department_id);
    
SELECT first_name, department_id, department_name FROM employees JOIN departments USING (department_id)
    WHERE (department_id, department_name) 
    IN (SELECT department_id, department_name FROM departments JOIN locations USING (location_id) WHERE city = 'Seattle');

SELECT manager_id FROM employees GROUP BY manager_id HAVING Count(employee_id) > 5 ORDER BY manager_id;
SELECT manager_id, first_name, last_name FROM employees 
    WHERE manager_id IN (SELECT manager_id FROM employees GROUP BY manager_id HAVING Count(employee_id) > 5)
    ORDER BY manager_id;

SELECT * from departments WHERE department_id IN (SELECT department_id FROM employees WHERE salary > 10000);



    -- ANY (Must have >, <, =, <>)
SELECT first_name, last_name, job_id, salary FROM employees 
    WHERE salary > ANY (SELECT salary from employees WHERE job_id = 'IT_PROG')
    AND job_id <> 'IT_PROG';


    -- ALL (Must have >, <, =, <>)
SELECT first_name, last_name, job_id, salary FROM employees 
    WHERE salary > ALL (SELECT salary from employees WHERE job_id = 'IT_PROG');



/* SYNC SUBQUERIES */
SELECT department_id, first_name, salary FROM employees e
    WHERE salary = (SELECT MAX(salary) FROM employees
        WHERE department_id = e.department_id);
        
        -- same result with IN
SELECT department_id, first_name, salary FROM employees
    WHERE (department_id, salary) IN (SELECT department_id, MAX(salary) FROM employees GROUP BY department_id);


    -- EXISTS
SELECT department_name FROM departments d 
    WHERE EXISTS (SELECT department_id FROM employees WHERE department_id =  d.department_id);

    -- NOT EXISTS
SELECT department_name FROM departments d 
    WHERE NOT EXISTS (SELECT department_id FROM employees WHERE department_id =  d.department_id);
SELECT city FROM locations l
    WHERE NOT EXISTS(SELECT location_id FROM departments WHERE location_id = l.location_id);


    -- Exercises
SELECT department_id, MAX(salary) FROM employees WHERE department_id IN(50, 60, 70) GROUP BY department_id;
SELECT first_name, last_name, salary FROM employees 
    WHERE salary = ANY (SELECT MAX(salary) FROM employees WHERE department_id IN(50, 60, 70) GROUP BY department_id);
SELECT first_name, last_name, salary FROM employees e 
    WHERE department_id IN(50, 60, 70) 
    AND salary = ANY (SELECT MAX(salary) FROM employees WHERE department_id = e.department_id);
    
SELECT department_id FROM employees GROUP BY department_id HAVING AVG(salary) > 9000 ORDER BY department_id;
SELECT department_id, department_name FROM departments 
    WHERE department_id IN (SELECT department_id FROM employees GROUP BY department_id HAVING AVG(salary) > 9000)
    ORDER BY department_id;

SELECT department_id, MAX(salary) FROM employees GROUP BY department_id ORDER BY 2 DESC;
SELECT department_name, first_name, last_name, salary FROM employees e JOIN departments d ON e.department_id = d.department_id
    WHERE (salary) IN (SELECT MAX(salary) FROM employees WHERE department_id = e.department_id)
    ORDER BY salary DESC;

SELECT * FROM employees WHERE salary > ALL(SELECT salary FROM employees WHERE department_id = 100);

SELECT MAX(salary) FROM employees GROUP BY department_id;
SELECT first_name, last_name, salary FROM employees e 
    WHERE salary = (SELECT MAX(salary) FROM employees WHERE department_id = e.department_id);




