/* SYNONYMS */
CREATE SYNONYM departamentos FOR departments;
SELECT * FROM departamentos WHERE department_id = 10;

-- Useful when other users want to access without specifying where the table comes from
GRANT SELECT ON departments TO other_user;
    CREATE SYNONYM departamentos FOR hr.departments; --> (other user)
    SELECT * FROM departamentos --> WORKS OK!