/* TRANSACTIONS */
    -- COMMIT
    /*
    IMPORTANT: Automatic COMMIT's with DDL and DCL.
    Also, automatic COMMITS can be ennabled in the DBMS, so be caerefull.
    */
INSERT INTO regions1 VALUES(100, 'Australia');
INSERT INTO regions1 VALUES(200, 'Europe');
DELETE regions1 WHERE region_id = 8;
COMMIT;

    -- ROLLBACK
INSERT INTO regions1 VALUES(300, 'America');
INSERT INTO regions1 VALUES(400, 'Asia');
ROLLBACK;


    -- SAVEPOINT X
INSERT INTO regions1 VALUES(500, 'Antartida');
SAVEPOINT A;
INSERT INTO regions1 VALUES(600, 'Africa');
ROLLBACK TO SAVEPOINT A;



/* DML LOCKS*/ 
/* 
If other session is working with the same records, 
Oracle remains on stand by until the other session finish with a COMMIT or with  ROLLBACK
*/
UPDATE regions1 SET region_name='XXXXX' WHERE region_id=100;
COMMIT;
SELECT * FROM regions1;




