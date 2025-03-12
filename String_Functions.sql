/* UPPER, LOWER, INIT CAP */
SELECT * FROM employees;
SELECT email, LOWER(email) FROM employees;
SELECT first_name, UPPER(first_name) FROM employees;
SELECT INITCAP('THIS IS A TEST') FROM DUAL;


/* FUNCTIONS WITH WHERE CLAUSE */
SELECT first_name, last_name FROM employees WHERE UPPER(first_name)='DAVID';


/* CONCATENATIONS AND NESTSTINGS*/
SELECT CONCAT(first_name, CONCAT(' ', last_name)) FROM employees;


/* LENGHT */
SELECT first_name, LENGTH(first_name) FROM employees;
SELECT first_name FROM employees WHERE LENGTH(first_name)=6;


/* SUBSTR */
    -- SUBSTR(<STRING>, <POSITION>, <LENGTH>)
SELECT first_name, SUBSTR(first_name, 1, 4) FROM employees;
SELECT first_name, SUBSTR(first_name, 1, 4) FROM employees;
SELECT first_name, SUBSTR(first_name, LENGTH(first_name),1) FROM employees;


/* INSTR */
SELECT first_name, INSTR(first_name, 'a') FROM employees;
SELECT first_name, INSTR(first_name, 'a') FROM employees WHERE INSTR(first_name, 'a') <> 0;
SELECT first_name, INSTR(LOWER(first_name), 'a') FROM employees WHERE INSTR(LOWER(first_name), 'a') <> 0;
SELECT first_name, INSTR(first_name, 'a', 4) FROM employees  WHERE INSTR(first_name, 'a', 4) <> 0;


/* LPAD / RPAD */
SELECT RPAD(first_name, 20, '*') FROM employees;
SELECT LPAD(first_name, 20, '*') FROM employees;


/* REPLACE */
SELECT REPLACE(first_name, 'a', '*') FROM employees;



/* LTRIM / RTRIM */
SELECT 'HELLO      ' || '         WORLD' FROM DUAL;
SELECT RTRIM('HELLO      ') || ' WORLD' FROM DUAL;
SELECT 'HELLO '|| LTRIM('        WORLD') FROM DUAL;
SELECT FIRST_NAME, RTRIM(first_name, 'n') FROM employees;


-- Exercises --
SELECT city FROM locations WHERE country_id IN('CA','US') AND LENGTH(street_address) > 15;
SELECT last_name, LENGTH(first_name), salary*14 FROM employees WHERE INSTR(last_name, 'b', 3) > 0 ;
SELECT * FROM employees WHERE salary BETWEEN 4000 AND 7000 AND INSTR(LOWER(first_name), 'a') > 0 AND commission_pct IS NOT NULL;
SELECT first_name, last_name, SUBSTR(first_name, 1, 1) || '.' || SUBSTR(last_name, 1, 1) AS "Initials" FROM employees;
SELECT first_name, last_name FROM employees WHERE SUBSTR(first_name, 1, 1) = 'S' OR SUBSTR(last_name, 1, 1) = 'S';
SELECT first_name, last_name FROM employees WHERE first_name LIKE 'S%' OR last_name LIKE 'S%';
SELECT first_name, last_name, salary, RPAD('*', salary/1000,'*') AS "Rank" FROM employees ORDER BY salary DESC;




