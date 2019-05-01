-- A table containing the students enrolled in a yearly course has incorrect data in records with ids between 20 and 100 (inclusive).
--
-- TABLE enrollments
--   id INTEGER NOT NULL PRIMARY KEY
--   year INTEGER NOT NULL
--   studentId INTEGER NOT NULL
--
-- Write a query that updates the field 'year' of every faulty record to 2015.

update  enrollments set year = 2015 where id >= 20 and id <= 100;
