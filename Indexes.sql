/* INDEX */
CREATE INDEX index1 ON employees (last_name);
SELECT * FROM employees WHERE last_name LIKE('S%');

CREATE INDEX index2 ON employees (first_name, last_name);
DROP INDEX index2;

CREATE INDEX index3 ON ciudades(nombre);
