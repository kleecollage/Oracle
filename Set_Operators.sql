/* SET OPERATOS */
SELECT * FROM regions1;
SELECT * FROM regions;

    -- UNION
SELECT region_id, region_name FROM regions
UNION
SELECT region_id, region_name FROM regions1;

SELECT * FROM coches1
UNION
SELECT * FROM coches2;


    -- UNION ALL
SELECT region_id, region_name FROM regions
UNION ALL
SELECT region_id, region_name FROM regions1;

SELECT * FROM coches1
UNION ALL
SELECT * FROM coches2;


    -- INTERSECT
SELECT region_id, region_name FROM regions
INTERSECT
SELECT region_id, region_name FROM regions1;

SELECT * FROM coches1
INTERSECT
SELECT * FROM coches2;

    
    -- MINUS
SELECT region_id, region_name FROM regions
MINUS
SELECT region_id, region_name FROM regions1;

SELECT region_id, region_name FROM regions1
MINUS
SELECT region_id, region_name FROM regions;


SELECT * FROM coches1
MINUS
SELECT * FROM coches2;

SELECT * FROM coches2
MINUS
SELECT * FROM coches1;



