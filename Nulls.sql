/* NULLS */
    -- NVL (<EXPRESION>, <VALUE>)
    -- NVL = Null Value
SELECT NVL('HELLO', 'BYE') FROM DUAL;
SELECT NVL('', 'BYE') FROM DUAL;

SELECT first_name, commission_pct*salary, NVL(commission_pct, 0)*salary FROM employees;
SELECT first_name, commission_pct, salary, commission_pct*salary, NVL(commission_pct, 0)*salary FROM employees;

    
    -- NVL2(<EXPRESION>, <VALUE_1>, <VALUE_2>)
SELECT first_name, commission_pct, salary, NVL2(commission_pct, salary*commission_pct, salary*0.1) FROM employees;


    -- NULLIF(<VALUE_1>,<VALUE_2>)
        -- NULLIF(TRUE, TRUE) = NULL
        -- NULLIF(FALSE) = VALUE_1
SELECT NULLIF(1,1) FROM DUAL;
SELECT NULLIF(1,10) FROM DUAL;

SELECT country_id, UPPER(SUBSTR(country_name, 1, 2)), 
    NULLIF(country_id, UPPER(SUBSTR(country_name, 1, 2))) AS "NULLIF Function",
    NVL2(NULLIF(country_id, UPPER(SUBSTR(country_name, 1, 2))), 'ARE EQUALS', 'ARE DIFFERENT') AS "NVL2 Function" FROM countries;

    
    -- COALESCE(V1, V2, V3, ... , Vn)
SELECT COALESCE(NULL, 'VALUE_1', 'VALUE_2', 'VALUE_3') FROM DUAL;
SELECT COALESCE(NULL, NULL, 'VALUE_2', 'VALUE_3') FROM DUAL;
SELECT COALESCE('VALUE_0', NULL, 'VALUE_2', 'VALUE_3') FROM DUAL;
SELECT first_name, commission_pct, manager_id FROM employees;
    -- IMPORTANT: All values must be the same data type
SELECT first_name, COALESCE(TO_CHAR(commission_pct), TO_CHAR(manager_id), 'Without mannager or commission') FROM employees;


SELECT city, COALESCE(TO_CHAR(state_province), 'Not province') FROM locations;
SELECT first_name, salary, commission_pct, NVL(commission_pct, salary) FROM employees;
SELECT job_id, manager_id, NVL(manager_id, -1) FROM employees;
SELECT city, state_province, NULLIF(city, state_province) FROM locations;




