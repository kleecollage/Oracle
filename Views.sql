/* VIEWS */
CREATE VIEW empl_view AS SELECT * FROM employees;
CREATE VIEW empl50_view AS SELECT * FROM employees WHERE DEPARTMENT_ID = 50;

SELECT * from empl50_view WHERE salary > 5000;
SELECT job_id, AVG(salary) FROM empl50_view GROUP BY job_id HAVING AVG(salary) > 5000;

CREATE VIEW empl_salary_view AS SELECT first_name || ' ' || last_name AS name, salary, salary*12 AS "Anual Incomes"  FROM employees;
SELECT * FROM empl_salary_view;

    -- DROP VIEW
DROP VIEW empl_view;

    -- INSERTS
CREATE VIEW regions_v AS SELECT * FROM regions;
INSERT INTO regions_v VALUES(5, 'XXXXX');

    -- UPDATES
UPDATE regions_v SET region_name='YYYY' WHERE region_id = 5;

    -- VIEWS WITH JOINS
CREATE VIEW region_country_view AS SELECT * FROM regions NATURAL JOIN countries;
SELECT * FROM region_country_view ;
        --** INSERTS NOT SUPPORTED ON VIEWS WITH JOINS



-- Exercises
CREATE VIEW CIUDADES_GRANDES_VIEW AS SELECT * FROM ciudades WHERE poblacion > 3000000;
SELECT * FROM CIUDADES_GRANDES_VIEW ;
DROP VIEW CIUDADES_GRANDES_VIEW;

CREATE VIEW CIUDADES_USA_VIEW AS SELECT * FROM ciudades WHERE cod_pais = 28;
SELECT * FROM CIUDADES_USA_VIEW;



