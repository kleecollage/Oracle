/* JSON */
    -- In older versions (>19c)
CREATE TABLE products
(
    code INT,
    name VARCHAR2(100),
    data VARCHAR2(4000)
    CONSTRAINT x1 CHECK (data IS JSON)
);
DESC products;

INSERT INTO products VALUES (1, 'test_1', '
    {
        "country": "germany",
        "city": "berlin",
        "population": 5600000
    }
');
SELECT * FROM products;


    -- In latest versions ( 21c or >)
CREATE TABLE products2
(
    code INT,
    name VARCHAR2(100),
    data JSON
);
DESC products2;

INSERT INTO products2 VALUES (3, 'test_3', '
    {
        "country": "germany",
        "city": "berlin",
        "population": 5600000
    }
');
SELECT * FROM products2;


    -- Data access using dot notation
SELECT data FROM products2;
SELECT prod2.data.country FROM products2 prod2;

INSERT INTO products2 VALUES (3, 'test_3', '
    {
        "country": "spain",
        "city": "barcelona",
        "population": 458000,
        "address":
        {
            "street": "nuevo puente 32",
            "postal_code": 4800,
        }
    }
');
SELECT prod2.data.address FROM products2 prod2;
SELECT prod2.data.address.street FROM products2 prod2;

INSERT INTO products2 VALUES (5, 'test_5', '
    {
        "country": "italy",
        "city": "rome",
        "population": 1234560,
        "address":
        {
            "street": "st 123",
            "postal_code": ""
        },
        "phones": 
        [
            "12-55-78-85",
            "11-88-36-89"
        ]
    }
');

SELECT prod2.data.phones FROM products2 prod2;
SELECT prod2.data.phones[0] FROM products2 prod2;



/* IS JSON IS NOT JSON*/
CREATE TABLE example
(
    code INT,
    x_file CLOB
);
INSERT INTO example VALUES(1, '{"col1":"test"}');
INSERT INTO example VALUES(2, 'This is a text');
INSERT INTO example VALUES(3, '<doc><col1>test</col1></doc>');

SELECT * FROM example WHERE x_file IS JSON;
SELECT * FROM example WHERE x_file IS NOT JSON;


/* JSON EXISTS */
    -- JSON_EXISTS (<JSON_file>,<JSON_expression>,<ON_ERROR>)
    -- Return a unique value, type: scalar
SELECT prod2.data  from products2 prod2 WHERE JSON_EXISTS(prod2.data, '$.city');
SELECT prod2.data  from products2 prod2 WHERE JSON_EXISTS(prod2.data, '$.address');
SELECT prod2.data  from products2 prod2 WHERE JSON_EXISTS(prod2.data, '$.address.street');
SELECT prod2.data  from products2 prod2 WHERE JSON_EXISTS(prod2.data, '$.phones[1]');


/* JSON VALUE */
    -- JSON_VALUE (<JSON_file>,<JSON_expression>)
    -- Return a unique value, type: scalar
SELECT JSON_VALUE (prod2.data, '$.country') FROM products2 prod2;
SELECT JSON_VALUE (prod2.data, '$.address') FROM products2 prod2;
SELECT JSON_VALUE (prod2.data, '$.address.street') FROM products2 prod2;
SELECT JSON_VALUE (prod2.data, '$.phones') FROM products2 prod2;
SELECT JSON_VALUE (prod2.data, '$.phones[0]') FROM products2 prod2;


/* JSON QUERY */
    -- JSON_QUERY(<JSON_field>, <JSON_expresion>, <ON_ERROR>)
    -- Allows the return of a value, array or nested sub-document
SELECT JSON_QUERY(prod2.data, '$.country')FROM products2 prod2;
SELECT JSON_QUERY(prod2.data, '$.address')FROM products2 prod2;
SELECT JSON_QUERY(prod2.data, '$.address.street')FROM products2 prod2;
SELECT JSON_QUERY(prod2.data, '$.phones')FROM products2 prod2;



/* JSON TABLE */
    -- JSON_TABLE(JSON_field, column_mapping)
    -- Allows the conversion from JSON to relational model
SELECT j_country FROM products2 prod2, JSON_TABLE(prod2.data, '$' COLUMNS (j_country PATH '$.country'));

SELECT j_country, j_city FROM products2 prod2, JSON_TABLE(prod2.data, '$' COLUMNS (j_country PATH '$.country', j_city PATH '$.city'));

SELECT j_country, j_city, j_address FROM products2 prod2, 
    JSON_TABLE( prod2.data, 
        '$' COLUMNS 
        (
            j_country PATH '$.country', 
            j_city PATH '$.city',
            j_address PATH '$.address.street' 
        ));

CREATE VIEW address_data_view AS SELECT j_country, j_city, j_address FROM products2 prod2, 
    JSON_TABLE( prod2.data, 
        '$' COLUMNS 
        (
            j_country PATH '$.country', 
            j_city PATH '$.city',
            j_address PATH '$.address.street' 
        ));
SELECT * FROM address_data_view;



/* JSON MODIFY */
    /*
    Prior to version 19c, all fields had to be modified.
    In version 19c, JSON_MERGEPATCH was created, and fragments can be modified.
    Since version 21c, JSON_TRANSFORM has been created, which is slightly more powerful than its predecessor.
    */
SELECT data FROM products2;
    -- UPDATES AFTER 19c
        -- Modify
UPDATE products2 SET data =
    '{
        "country":"canada",
        "city":"toronto",
        "population":120887
    }' 
    WHERE code = 2;
        
        -- Add elements
UPDATE products2 SET data =
    '{
        "country":"canada",
        "city":"toronto",
        "population":120887,
        "status": true
    }' 
    WHERE code = 1;


    -- UPDATES ON 19c
    -- JSON MERGE PATCH
UPDATE products2 SET data = JSON_MERGEPATCH( data, '{ "status": false }' ) WHERE code = 1;

UPDATE products2 SET data = JSON_MERGEPATCH( data, '
    {
        "status": true,
        "new_col": 10
    }' ) WHERE code = 1;


    -- UPDATES SINCE 21c
    -- JSON TRANSFORM
    /*
    Allows to perform complex operations on JSON content.
        ==========
        OPERATIONS
        ==========
        SET ------> Updates an element. If it doesn't exist, it's created.
        INSERT ----> Inserts a non-existent element.
        APPEND ----> Adds an element to the end of the array.
        REMOVE ----> Deletes an element (included in the array).
        RENAME ----> Renames an element.
        REPLACE ----> Same as SET, but if the element doesn't exist, it's not created.
        KEEP ------> Deletes all elements except those in the list.
    */
SELECT data FROM products2;
        -- SET
UPDATE products2 SET data = JSON_TRANSFORM(data, set '$.population'=19000) WHERE code = 1;
SELECT JSON_TRANSFORM(data, SET '$.population' = 1000) FROM products2;

        -- INSERT
SELECT JSON_TRANSFORM(data, INSERT '$.type' = 'type_1') FROM products2 WHERE CODE = 1;
            --> NOT ALLOWED ON EXISTING ELEMENTS
SELECT JSON_TRANSFORM(data, INSERT '$.population' = 5000) FROM products2 WHERE CODE = 1; 
            --> INSERTS IN ARRAYS ARE ALLOWED
SELECT JSON_TRANSFORM(data, INSERT '$.phones[2]' = '44-87-99-19') FROM products2 WHERE CODE = 4;
            --> VALUES CAN BE REPLACED IN ARRAYS WITH INSERTS
SELECT JSON_TRANSFORM(data, INSERT '$.phones[0]' = '800-999-8080') FROM products2 WHERE CODE = 4;         
        
        
        -- APPEND
SELECT JSON_TRANSFORM(data, APPEND '$.phones' = '55-77-99-22-78') FROM products2 WHERE CODE = 4;

        -- RENAME
SELECT JSON_TRANSFORM(data, RENAME '$.phones' = 'contact') FROM products2 WHERE CODE = 4;

        -- REPLACE
SELECT JSON_TRANSFORM(data, REPLACE '$.population' = '557700') FROM products2 WHERE CODE = 1;
            --> IF ELEMENT DOESN'T EXIST IT'S NOT CREATED
SELECT JSON_TRANSFORM(data, REPLACE '$.population2' = '557700') FROM products2 WHERE CODE = 1;

        -- REMOVE
SELECT JSON_TRANSFORM(data, REMOVE '$.population') FROM products2 WHERE CODE = 1;
SELECT JSON_TRANSFORM(data, REMOVE '$.address') FROM products2 WHERE CODE = 4;
SELECT JSON_TRANSFORM(data, REMOVE '$.address.street') FROM products2 WHERE CODE = 3;

        -- KEEP
            --> The opposite of remove
SELECT JSON_TRANSFORM(data, KEEP '$.address.street') FROM products2 WHERE CODE = 3;

        -- MULTIPLE OPERATIONS
SELECT JSON_TRANSFORM(data, 
    SET '$.address.street' = 'Rodeo Viejo', 
    INSERT '$.address.zip_code' = 78888,
    RENAME '$.population' = 'poblation'
    ) FROM products2 WHERE CODE = 3;












