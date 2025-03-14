/* DATE FUNCTIONS */
SELECT SYSDATE FROM DUAL;
    -- Add a number
SELECT SYSDATE+2 FROM DUAL;
    -- Substract a number
SELECT SYSDATE-2 FROM DUAL;
    -- Substract Dates
SELECT SYSDATE  - hire_date FROM employees;
SELECT hire_Date, (SYSDATE - hire_date)/7 FROM employees;


-- MONTHS BETWEEEN --
SELECT hire_date, MONTHS_BETWEEN(SYSDATE, hire_date) FROM employees;

-- ADD MONTHS --
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3) FROM DUAL;

-- NEXT_DAY --
SELECT NEXT_DAY(SYSDATE,'WED') FROM DUAL;

-- LAST DAY --
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;

-- ROUND / TRUNC --
SELECT SYSDATE, ROUND(SYSDATE, 'MONTH'),  ROUND(SYSDATE, 'YEAR') FROM DUAL;
SELECT SYSDATE, TRUNC(SYSDATE, 'MONTH'), TRUNC(SYSDATE, 'YEAR') FROM DUAL;


SELECT hire_date, MONTHS_BETWEEN(SYSDATE, hire_date)*7 AS "Days Working" FROM employees;
SELECT SYSDATE, SYSDATE+15 FROM DUAL;
SELECT SYSDATE,  TRUNC(MONTHS_BETWEEN('01/DEC/2025', SYSDATE), 1) FROM DUAL;
SELECT hire_date, LAST_DAY(hire_date) FROM employees WHERE first_name LIKE 'Ka%';
SELECT hire_date FROM employees WHERE hire_date >= LAST_DAY(hire_date)-15 ;






