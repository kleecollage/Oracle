/* ROLLUP */
    -- Perform partial sums at the end of each group
SELECT department_id, job_id, SUM(salary) FROM employees WHERE department_id IS NOT NULL
    GROUP BY ROLLUP (department_id, job_id) -- sum all wages and for each department
    ORDER BY department_id, job_id;

/* CUBE */
    -- Perform multidimenational partial sums at the end of each group
SELECT department_id, job_id, SUM(salary) FROM employees WHERE department_id IS NOT NULL 
    GROUP BY CUBE (department_id, job_id) -- sum all wages, sum by each job_id and sum for each department
    ORDER BY department_id, job_id;

    /*
    sum all departments, for each city, for each city & job, for each city & department,
    sum for each department and job and for each job
    Basically it adds up all possible combinations without repetition.
    */
SELECT city, department_name, job_id, COUNT(*) FROM locations NATURAL JOIN departments JOIN employees USING (department_id)
    GROUP BY CUBE (city, department_name, job_id) 
    ORDER BY city, department_name, job_id;
    
SELECT COUNT(department_id) from employees;


/* GROUPING */
    -- partial sum rows = 1
SELECT department_id, job_id, SUM(salary), GROUPING(department_id), GROUPING(job_id)
    FROM employees WHERE department_id IS NOT NULL
    GROUP BY ROLLUP (department_id, job_id)
    ORDER BY department_id, job_id;

SELECT DECODE(GROUPING(job_id), 1, 'Total on dep: '||department_id) As "Department",
    DECODE(GROUPING(department_id), 1, 'Total: ', job_id) As "Job",
    SUM(salary) AS "Wages" 
    FROM employees WHERE department_id IS NOT NULL
    GROUP BY ROLLUP (department_id, job_id)
    ORDER BY department_id, job_id;



/* GROUPING SETS */
SELECT department_id, job_id, SUM(salary) AS salary
    FROM employees WHERE department_id IS NOT NULL
    GROUP BY department_id, job_id ORDER BY department_id, job_id;

SELECT department_id, job_id, SUM(salary) AS salary
    FROM employees WHERE department_id IS NOT NULL
    GROUP BY GROUPING SETS (department_id, job_id);
    
    -- Replace the use of UNION ALL
SELECT NULL, department_id, SUM(salary) FROM employees WHERE department_id IS NOT NULL GROUP BY (department_id)
UNION ALL
SELECT job_id, NULL, SUM(salary) FROM employees WHERE department_id IS NOT NULL GROUP BY (job_id);



    -- GROUPING SETS WITH MULTIPLE COLUMNS
SELECT department_id, job_id, manager_id, SUM(salary) AS salary
    FROM employees WHERE department_id IS NOT NULL
    GROUP BY GROUPING SETS ( (department_id, job_id), (department_id, manager_id) );
    
SELECT * FROM employees WHERE department_id = 90;





