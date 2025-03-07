USE sql_store;

SELECT * FROM customers
WHERE state='CA';

SELECT count(*) AS "Total count" FROM customers
WHERE state='CA';

EXPLAIN SELECT count(*) AS "Total count" FROM customers
WHERE state='CA';

CREATE INDEX idx_state
ON customers (state);

-- DROP INDEX idx_state
-- ON customers;

EXPLAIN SELECT count(*) AS "Total count" FROM customers
WHERE state='CA';

SHOW INDEXES IN customers;


SELECT * FROM customers
WHERE points>100;

EXPLAIN SELECT * FROM customers
WHERE points>100;

CREATE INDEX idx_points
ON customers(points);

-- DROP INDEX idx_points
-- ON customers;

EXPLAIN SELECT * FROM customers
WHERE points>100;

ANALYZE TABLE customers;


SHOW INDEXES IN orders;



CREATE INDEX idx_lastname ON customers(last_name(5)); --  prefix index(ieraksti cik simbolus nepieciešams)
-- DROP INDEX idx_lastname ON customers;

SELECT 
	COUNT(DISTINCT LEFT(last_name,1)),
    COUNT(DISTINCT LEFT(last_name,3)),
    COUNT(DISTINCT LEFT(last_name,4)),
    COUNT(DISTINCT LEFT(last_name,5)),
    COUNT(DISTINCT LEFT(last_name,10)),
    COUNT(DISTINCT LEFT(last_name,15)),
    COUNT(DISTINCT LEFT(last_name,20))
FROM customers;

-- SELECT MATCH (last_name) AGAINST ('aeist') FROM customers;



CREATE FULLTEXT INDEX id_title_body 
ON sql_blog.posts(title,body);
DROP INDEX id_title_body ON sql_blog.posts;

SELECT * FROM sql_blog.posts p
WHERE MATCH (p.title,p.body) AGAINST ('react redux');

SELECT MATCH(p.title,p.body) AGAINST('react redux') AS relevance_score, p.* FROM sql_blog.posts p
WHERE MATCH(p.title,p.body) AGAINST('react redux')
ORDER BY relevance_score DESC;


CREATE INDEX idx_points_state
ON customers(points,state); -- composite indexes  

CREATE INDEX idx_points_state
ON customers(points,state); -- covering index

SELECT points, state ...