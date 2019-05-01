-- The following data definition defines an organization's employee hierarchy.
--
-- An employee is a manager if any other employee has their managerId set to the first employees id. An employee who is a manager may or may not also have a manager.
--
-- TABLE employees
--   id INTEGER NOT NULL PRIMARY KEY
--   managerId INTEGER REFERENCES employees(id)
--   name VARCHAR(30) NOT NULL
--
-- Write a query that selects the names of employees who are not managers.
--
-- Suggested testing environment:
-- http://sqlite.online/

-- Example case create statement:
-- CREATE TABLE employees (
--   id INTEGER NOT NULL PRIMARY KEY,
--   managerId INTEGER REFERENCES employees(id),
--   name VARCHAR(30) NOT NULL
-- );
--
-- INSERT INTO employees(id, managerId, name) VALUES(1, NULL, 'John');
-- INSERT INTO employees(id, managerId, name) VALUES(2, 1, 'Mike');
--
-- Expected output (in any order):
-- name
-- ----
-- Mike

-- Explanation:
-- In this example.
-- John is Mike's manager. Mike does not manage anyone.
-- Mike is the only employee who does not manage anyone.

select name from employees
where id not in (
    select e1.id from employees as e1 join employees as e2 on e1.id = e2.managerId
);
