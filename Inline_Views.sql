/* INLINE VIEWS */
CREATE VIEW empl_view AS SELECT* FROM employees ORDER BY salary DESC; --> Declared View
SELECT * FROM empl_view WHERE salary > 5000;

SELECT first_name, salary FROM (SELECT * FROM employees ORDER BY salary) WHERE salary > 5000; --> INLINE VIEW

CREATE VIEW reg_view AS SELECT * FROM regions1; --> Declared View
INSERT INTO reg_view VALUES(5, 'Antartica');

INSERT INTO (SELECT * FROM regions1) VALUES(6, 'Austrailia'); --> INLINE VIEW

UPDATE (SELECT * FROM regions1 WHERE region_id > 100) SET region_name = LOWER(region_name); --> INLINE VIEW

