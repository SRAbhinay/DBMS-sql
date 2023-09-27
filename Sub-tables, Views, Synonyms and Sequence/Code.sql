-- 1. Create any new table from existing table (MOVIE) with all attributes
CREATE TABLE NewMovie AS SELECT * FROM Movie;

-- 2. Create any new table from existing table (MOVIE) with two attributes
CREATE TABLE NewMovieTwoAttrs AS SELECT mID, title FROM Movie;

-- 3. Create any new table from existing table (MOVIE) with all attributes and the director's name starts with 'M'
CREATE TABLE NewMovieDirectorM AS SELECT * FROM Movie WHERE director LIKE 'M%';

-- 4. Create a View HighRating which contains movies with rating above 3 stars. The view contains the movie ID and movie title.
CREATE VIEW HighRating AS SELECT mID, title FROM Movie WHERE mID IN (SELECT mID FROM Rating WHERE stars > 3);

-- 5. Create a View NoRating which contains movies with no ratings. The view contains the movie ID and movie title.
CREATE VIEW NoRating AS SELECT mID, title FROM Movie WHERE mID NOT IN (SELECT DISTINCT mID FROM Rating);

-- 6. Create a View called LateRating which contains movie ratings after January 20, 2011. The view contains the movie ID, movie title, number of stars, and rating date.
CREATE VIEW LateRating AS SELECT R.mID, M.title, R.stars, R.rDate FROM Rating R JOIN Movie M ON R.mID = M.mID WHERE R.rDate > '2011-01-20';

-- 7. Display all the views generated.
SELECT table_name FROM information_schema.views;

-- 8. Execute UPDATE/DELETE commands on the view created.

-- 9. Drop any view.
DROP VIEW HighRating;

-- C. Exercises on Synonyms

-- 10. Create a synonym for any table
CREATE SYNONYM MovieSynonym FOR Movie;

-- 11. Drop the synonym
DROP SYNONYM MovieSynonym;

-- D. Exercises on Sequences

-- 12. Create a table to store product details (pid, pname, price)
CREATE TABLE Product (pid INT PRIMARY KEY, pname VARCHAR(255), price DECIMAL(10, 2));

-- 13. Create a sequence named seq1 start with min value 1 and max value 100
CREATE SEQUENCE seq1 START WITH 1 MINVALUE 1 MAXVALUE 100;

-- 14. Consider pid to be generated automatically while inserting the details in the table. Insert at least 3 records and show the details of the table.
INSERT INTO Product (pid, pname, price) VALUES (NEXTVAL('seq1'), 'Product1', 10.99);
INSERT INTO Product (pid, pname, price) VALUES (NEXTVAL('seq1'), 'Product2', 19.99);
INSERT INTO Product (pid, pname, price) VALUES (NEXTVAL('seq1'), 'Product3', 5.99);

SELECT * FROM Product;

-- 15. Consider the same sequence and renumber the sl_no from 101. Insert at least 3 records and show the details of the table.
SELECT SETVAL('seq1', 101);

INSERT INTO Product (pid, pname, price) VALUES (NEXTVAL('seq1'), 'Product4', 14.99);
INSERT INTO Product (pid, pname, price) VALUES (NEXTVAL('seq1'), 'Product5', 29.99);
INSERT INTO Product (pid, pname, price) VALUES (NEXTVAL('seq1'), 'Product6', 7.99);

SELECT * FROM Product;

-- 16. Drop the sequence seq1
DROP SEQUENCE seq1;