/* PIVOT */
    -- It is used for matrix reports
SELECT * FROM pivot_tbl;

SELECT * 
    FROM (SELECT producto, cantidad FROM pivot_tbl) --> INLINE VIEW
    PIVOT ( COUNT(cantidad) FOR (producto) IN ('AGUACATES', 'BANANAS', 'MANZANA', 'NARANJA') );
    
SELECT * 
    FROM (SELECT producto, cantidad FROM pivot_tbl) --> INLINE VIEW
    PIVOT ( SUM(cantidad) FOR (producto) IN ('AGUACATES', 'BANANAS', 'MANZANA', 'NARANJA') );

SELECT * 
    FROM (SELECT cliente, producto, cantidad FROM pivot_tbl) --> INLINE VIEW
    PIVOT ( COUNT(cantidad) FOR (producto) IN ('AGUACATES', 'BANANAS', 'MANZANA', 'NARANJA') );


/* UNPIVOT */
    -- Transform a cross-table to a relational model
DROP TABLE unpivot_tbl;
CREATE TABLE unpivot_tbl AS 
    SELECT * FROM (SELECT cliente, producto, cantidad FROM pivot_tbl) --> INLINE VIEW
    PIVOT ( SUM(cantidad) FOR (producto) IN ('AGUACATES' AS AGUACATES, 'BANANAS' AS BANANAS, 'MANZANA' AS MANZANA, 'NARANJA' AS NARANJA) );
SELECT * FROM unpivot_tbl;

SELECT * FROM unpivot_tbl
    UNPIVOT (cantidad FOR producto IN (AGUACATES, BANANAS, MANZANA, NARANJA))
    ORDER BY cliente, producto;







