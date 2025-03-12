/* CONDITIONAL EXPRESSIONS */
    -- CASE()
    SELECT first_name, job_id FROM employees WHERE department_id = 50;
    SELECT first_name, job_id,
        CASE job_id 
            WHEN 'ST_CLERK' THEN 'Type 1' 
            WHEN 'ST_MAN' THEN 'Type 2'
            WHEN 'SH_CLERK' THEN 'Type 3'
            ELSE 'No Type'
        END
        FROM employees WHERE department_id = 50;
        
    
    -- CASE SEARCHED
SELECT first_name, salary,
    CASE
        WHEN salary BETWEEN 0 AND 3000 THEN 'You have low incomes'
        WHEN salary BETWEEN 3001 AND 5000 THEN 'You have normal incomes'
        WHEN salary > 5000 THEN 'You have height incomes'
        ELSE 'No incomes :('
    END    
    FROM employees;
    
    
    -- DECODE(FIRST_VALUE, CONDITION_1, VALUE_1, CONDITION_2, VALUE_2, ... , CONDITION_n, VALUE_n, ELSE_VALUE)
SELECT first_name, department_id,
    DECODE(department_id, 50, 'Computing', 10, 'Sells', 'Other Job')
    FROM employees;


SELECT first_name, department_id,
    CASE department_id
        WHEN 50 THEN 'Transport'
        WHEN 90 THEN 'Direction'
        ELSE 'Other'
    END
    FROM employees;
    
SELECT first_name, department_id, DECODE(department_id, 50, 'Transport', 90, 'Direction', 'Other') FROM employees;
    
SELECT city, country_id,
    CASE
        WHEN country_id IN ('US', 'CA') THEN 'North America'
        WHEN country_id IN ('CH', 'UK', 'DE', 'IT') THEN 'Europe'
        WHEN country_id = 'BR' THEN 'South America'
        ELSE 'Other'
    END AS "Region"
    FROM locations;

/*
• Realizar el primer ejercicio con DECODE en vez de con CASE
*/







