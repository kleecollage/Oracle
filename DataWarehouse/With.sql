/* WITH CLAUSE */
    -- SUBQUERY FACTORING CLAUSE
SELECT e.first_name AS name, dc.num_emp AS num_coworkers, e.department_id
    FROM employees e,
        (SELECT department_id, COUNT(*) AS num_emp FROM employees GROUP BY department_id) dc --> INLINE VIEW
    WHERE e.department_id = dc.department_id;

    -- with WITH the query is more readable
    -- WITH (<VIEW_NAME>) AS (INLINE_VIEW) SELECT <C1>, <C2>, ... , <Cn> FROM <TABLE_NAME>, <VIEW_NAME> WHERE <CONDITION_1> = <CONTIDION_2>
WITH view_num_emp AS
    (SELECT department_id, COUNT(*) AS num_emp FROM employees GROUP BY department_id)
SELECT e.first_name AS name, dc.num_emp AS num_coworkers, e.department_id
FROM employees e, view_num_emp dc
WHERE e.department_id = dc.department_id;


    -- WITH JOIN MULTIPLE VIEWS
WITH dep_salary AS (SELECT department_id, SUM(salary) AS salary_per_dep FROM employees GROUP BY department_id),
     dep_empls AS (SELECT department_id, COUNT(employee_id) AS empls_per_dep FROM employees GROUP BY department_id),
     total_empls AS (SELECT COUNT(employee_id) AS total_emps FROM employees)
SELECT department_name, salary_per_dep, empls_per_dep, total_emps
FROM departments NATURAL JOIN dep_salary NATURAL JOIN dep_empls, total_empls;
    













