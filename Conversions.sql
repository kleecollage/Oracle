/* CONSERSIONS */
    -- TO CHAR (DATE, 'FORMAT')
SELECT SESSIONTIMEZONE FROM DUAL;
SELECT DBTIMEZONE FROM DUAL;
        --> YYYY  4 Digits year
        --> Year  Text Year in English
        --> MM    2 Digits Month 
        --> MONTH Text Moth
        --> MON   Text Moth Abbreviated
        --> DY    Text Day Abbreviated     
        --> DAY   Text Day
        --> DD    Day Number
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY')  FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'MONTH')  FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YEAR')  FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DAY')  FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DY')  FROM DUAL;
    
    -- AM / PM
    -- HH (12 hrs format)
SELECT SYSDATE, TO_CHAR(SYSDATE, 'HH')  FROM DUAL;
SELECT CURRENT_DATE, TO_CHAR(CURRENT_DATE, 'HH') FROM DUAL;
    -- HH24 (24 hrs format)
SELECT SYSDATE, TO_CHAR(SYSDATE, 'HH24')  FROM DUAL;
SELECT CURRENT_DATE, TO_CHAR(CURRENT_DATE, 'HH24') FROM DUAL;
    -- MI (Minuts)
SELECT SYSDATE, TO_CHAR(SYSDATE, 'MI') FROM DUAL;
    -- SS (Seconds)
SELECT SYSDATE, TO_CHAR(SYSDATE, 'SS') FROM DUAL;
    -- FORMATS COMBINE
SELECT SYSDATE, TO_CHAR(CURRENT_DATE, 'HH24:MI') FROM DUAL;
SELECT SYSDATE, TO_CHAR(CURRENT_DATE, 'HH24, MI, SS') FROM DUAL;
SELECT SYSDATE, TO_CHAR(CURRENT_DATE, '"It''s:" HH:MI "o''clock in the day" DD "of the month of" MONTH') FROM DUAL;    
    
    
    -- TO CHAR (Number, 'Format')
        --> 9 = NUMBER
        --> 0 = Visualize a Zero
        --> $ = Dollar Symbol
        --> L = Current Currency
        --> . = Decimal Point
        --> , = Thousands separator
SELECT salary, TO_CHAR(salary, '99999999'), 
    TO_CHAR(SALARY, '000009'), 
    TO_CHAR(SALARY, '$000009'), 
    TO_CHAR(SALARY, 'L000009'),
    TO_CHAR(SALARY, 'L99999.99') FROM employees ORDER BY salary DESC;
    
    
SELECT first_name, hire_date FROM employees WHERE TO_CHAR(hire_date, 'MON') = 'MAY';
SELECT first_name, hire_date FROM employees WHERE TO_CHAR(hire_date, 'YYYY') = 2007;
SELECT SUBSTR(TO_CHAR(TO_DATE('31/JUL/1996'), 'DAY'), 1, 1) FROM DUAL;
SELECT first_name, hire_date FROM employees WHERE TO_CHAR(hire_date, 'MON') = 'JUN';
SELECT salary, TO_CHAR(salary, 'L999,999.00') AS "USD", TO_CHAR(salary*21.23, 'L999,999.00') AS "MXN" FROM employees;

        
    -- TO_DATE (<String>, 'FORMAT')
SELECT TO_DATE('10-JAN-12') FROM DUAL;
SELECT TO_DATE('10-02-12', 'DD-MM-YY') FROM DUAL;
SELECT TO_DATE('10-05-2012', 'DD-MM-YYYY') FROM DUAL;
SELECT TO_DATE('12-22-12', 'MM-DD-YYYY') FROM DUAL;
SELECT TO_DATE('JAN-22-12', 'MM-DD-YYYY') FROM DUAL;
    -- RR
SELECT TO_CHAR(TO_DATE('10-01-89', 'DD-MM-YY'), 'DD-MM-YYYY') FROM DUAL;
    -- RR (50-99) = 1900's
SELECT TO_CHAR(TO_DATE('10-01-89', 'DD-MM-RR'), 'DD-MM-YYYY') FROM DUAL;
    --> RR (0-49)  = 2000's
SELECT TO_CHAR(TO_DATE('10-01-29', 'DD-MM-RR'), 'DD-MM-YYYY') FROM DUAL;


    
    -- TO_NUMBER(<String>, 'Format') --
SELECT TO_NUMBER('1000.52', '9999.99') FROM DUAL;
SELECT TO_NUMBER('$1000.25', 'L9999.99') FROM DUAL;



SELECT TO_NUMBER('1210.73', '9999.99'), TO_NUMBER('127.73', '999.99')  FROM DUAL;
SELECT phone_number,  SUBSTR(REPLACE(phone_number, '.', ''), 1, 3) FROM employees;
SELECT phone_number, TO_NUMBER(SUBSTR(phone_number,1, 3), '999')*2 FROM employees;
SELECT TO_DATE('10 "DE" FEBRUARY "DE" 2018', 'DD "DE" MONTH "DE" YYYY') FROM DUAL;
SELECT TO_DATE(REPLACE('10 DE FEBRUARY DE 2018', 'DE', ''), 'DD/MONTH/YYYY') AS "Date" FROM DUAL;
SELECT TO_DATE('FACTURA:MARCH0806', '"FACTURA:"MONTHDDYY') FROM DUAL;





