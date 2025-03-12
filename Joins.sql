/* JOINS */
    -- SQL 1999: ANSI
SELECT e.salary FROM employees e;

    -- NATURAL JOIN
SELECT region_id, region_name, country_id, country_name FROM regions r NATURAL JOIN countries c;
SELECT region_name, country_name FROM regions NATURAL JOIN countries;
SELECT department_name, first_name FROM employees NATURAL JOIN departments;
SELECT country_name, region_name FROM countries NATURAL JOIN regions;
SELECT country_name, region_name, city FROM countries NATURAL JOIN regions NATURAL JOIN locations;


    -- USING
SELECT department_id, department_name, first_name FROM employees JOIN departments USING(department_id);
SELECT department_name, ROUND(AVG(salary), 2) FROM employees JOIN departments USING(department_id) GROUP BY department_name;
SELECT department_name, manager_id, city FROM departments JOIN locations USING(location_id);
SELECT job_title, department_name, last_name, hire_date FROM employees 
    JOIN jobs USING(job_id) 
    JOIN departments USING(department_id)
    WHERE TO_CHAR(hire_date, 'YYYY') BETWEEN '2000' AND '2004'
    ORDER BY hire_date; 
SELECT job_title, ROUND(AVG(salary), 2) FROM employees 
    JOIN jobs USING(job_id)
    GROUP BY job_title
    HAVING AVG(salary) > 7000
    ORDER BY 2;
SELECT region_name, COUNT(department_id) FROM regions
    JOIN countries USING(region_id)
    JOIN locations USING(country_id)
    JOIN departments USING(location_id)
    GROUP BY region_name;
SELECT first_name, department_name, country_name FROM employees 
    JOIN departments USING(department_id)
    JOIN locations USING(location_id)
    JOIN countries USING(country_id);


    -- ON
SELECT e.department_id, d.department_name, e.first_name FROM employees e 
    JOIN departments d ON(e.department_id = d.DEPARTMENT_ID) WHERE salary > 5000;
SELECT e.department_id, d.department_name, e.first_name, l.city FROM employees e 
    JOIN departments d ON(e.department_id = d.DEPARTMENT_ID)
    JOIN locations l ON (d.location_id = l.location_id) AND salary > 5000 ;



    -- WHERE
SELECT department_name, first_name FROM departments d, employees e WHERE d.department_id = e.department_id;
SELECT department_name, first_name, city FROM departments d, employees e, locations l
    WHERE d.department_id = e.department_id AND l.location_id = d.location_id;


    -- SELF JOINS
SELECT worker.first_name AS "Worker", boss.first_name AS "Boss" FROM employees worker 
    JOIN employees boss ON (worker.manager_id = boss.employee_id);
SELECT employee.first_name AS "Employee", manager.first_name AS "Manager" 
    FROM employees employee JOIN employees manager 
    ON(manager.employee_id = employee.manager_id);
    
    
    -- NON EQUIJOINS
SELECT department_name 
    FROM departments d  JOIN locations l
    ON (d.location_id <> l.location_id) 
    AND l.city = 'Seattle';
    
    
    -- OUTER JOINS --
SELECT department_name, first_name
    FROM departments d  JOIN employees e
    ON (d.department_id = e.department_id);
        
        ---> RIGHT OUTER JOIN
SELECT department_name, first_name
    FROM departments d  RIGHT OUTER JOIN employees e
    ON (d.department_id = e.department_id);
SELECT city, department_name FROM departments
    RIGHT OUTER JOIN locations USING (location_id);

        ---> LEFT OUTER JOIN
SELECT department_name, first_name
    FROM departments d  LEFT OUTER JOIN employees e
    ON (d.department_id = e.department_id);
SELECT department_name, SUM(salary) FROM departments
    LEFT OUTER JOIN employees USING(department_id) 
    GROUP BY department_name
    ORDER BY 2,1 ASC;
        
        ---> FULL OUTER JOIN
SELECT department_name, first_name
    FROM departments d  FULL OUTER JOIN employees e
    ON (d.department_id = e.department_id);
    
    
    
    -- CROSS JOINS
SELECT first_name, department_name FROM employees, departments;
SELECT first_name, department_name FROM employees CROSS JOIN departments;



    
    -- WITH
SELECT department_id, department_name, SUM(salary) AS "Balance" FROM employees 
    JOIN departments USING (department_id)
    GROUP BY department_id, department_name
    HAVING SUM(salary) > 20000;
    
WITH sum_salary AS 
    (SELECT department_id, SUM(salary) AS "Balance" FROM employees GROUP BY department_id)
    SELECT department_id, department_name, "Balance"  FROM sum_salary NATURAL JOIN departments WHERE "Balance" > 2000;
    
WITH
    sum_salaries AS (SELECT department_id, SUM(salary) AS "Balance" FROM employees GROUP BY department_id),
    num_employees AS (SELECT department_id, COUNT(*) AS "Workers" FROM employees GROUP BY department_id)
    SELECT
        department_name, "Balance", "Workers"
    FROM
        departments,
        sum_salaries,
        num_employees
    WHERE
        departments.department_id = sum_salaries.department_id
        AND departments.department_id = num_employees.department_id;





