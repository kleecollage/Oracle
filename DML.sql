/* DML DATA MANIPULATION LENGUAGE */
-- INSERT UPDATE DELETE
-- COMMIT ROLLBACK SAVEPOINT

-- INSERT INTO TABLE (C1, C2) VALUES (V1, V2)
INSERT INTO regions (region_id, region_name) VALUES (5, 'Test_1');

INSERT INTO regions VALUES(6, 'Test 2');

INSERT INTO regions (region_id) VALUES (7);

INSERT INTO departments (department_id, department_name, location_id) VALUES (900, 'Computing', 1800);

INSERT INTO departments VALUES (901, 'HHRR', NULL, 1800);


-- INSERT MULTIPLE FILES
CREATE TABLE DEPT2 (CODE NUMBER,NAME VARCHAR2 (100),MANAGER NUMBER);
INSERT INTO DEPT2 (SELECT department_id, department_name, manager_id FROM departments WHERE location_id = 1700);



-- UPDATE 
-- UPDATE TABLE SET COLUMN=VALUE, COLUMN2=VALUE2 WHERE CONDITION
UPDATE dept2 SET manager=100 WHERE code=120;

UPDATE dept2 SET manager=200 WHERE manager IS NULL;

UPDATE dept2 SET manager=(SELECT manager_id FROM departments WHERE department_id=30) WHERE code=100;



-- DELETE
-- DELETE FROM TABLE WHERE CONDITION
DELETE dept2 WHERE code = 1;

DELETE regions WHERE region_id IN (5,6,7);

DELETE regions1 WHERE region_id IN (SELECT region_id FROM regions WHERE region_id IN(1,3));

    -- TRUNCATE TABLE <TABLE_NAME>
TRUNCATE TABLE regions1;
    -- same result:
DELETE regions1;
/*
There is a difference between TRUNCATE and DELETE, 
with TRUNCATE the table is deleted immediately, 
with DELETE each record is saved in case you want to recover it before doing the COMMIT.
*/


-- Excercises
CREATE TABLE PRODUCTOS
(
CODIGO NUMBER NOT NULL
, NOMBRE VARCHAR2(100) NOT NULL
, PRECIO NUMBER NOT NULL
, UNIDADES NUMBER
, FECHA_ALTA DATE
);

INSERT INTO productos(codigo, nombre, precio, unidades, fecha_alta) VALUES (1, 'tornillos', 100, 10, '01-SEP-2017');
INSERT INTO productos VALUES(2, 'Tuercas', 50, 5, '01-OCT-2009');
INSERT INTO productos VALUES(3, 'Martillo', 90, NULL, NULL);

CREATE TABLE PRODUCTOS2
(CODE NUMBER,
NAME VARCHAR2(100));

INSERT INTO productos2 (SELECT codigo, nombre FROM productos WHERE unidades > 8);

UPDATE productos SET nombre = UPPER(nombre) WHERE precio > 50;
UPDATE productos SET precio = precio+5 WHERE SUBSTR(nombre, 1, 1) = 'T';

DELETE productos WHERE unidades < 10 OR unidades IS NULL;

TRUNCATE TABLE productos2;








