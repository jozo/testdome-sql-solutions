-- App usage data are kept in the following table:
--
-- TABLE sessions
--   id INTEGER PRIMARY KEY,
--   userId INTEGER NOT NULL,
--   duration DECIMAL NOT NULL
--
-- Write a query that selects userId and average session duration for each user who has more than one session.

-- Suggested testing environment:
-- http://sqlite.online/

-- Example case create statement:
-- CREATE TABLE sessions (
--   id INTEGER NOT NULL PRIMARY KEY,
--   userId INTEGER NOT NULL,
--   duration DECIMAL NOT NULL
-- );
--
-- INSERT INTO sessions(id, userId, duration) VALUES(1, 1, 10);
-- INSERT INTO sessions(id, userId, duration) VALUES(2, 2, 18);
-- INSERT INTO sessions(id, userId, duration) VALUES(3, 1, 14);
--
-- Expected output:
-- UserId  AverageDuration
-- -----------------------
-- 1       12

select userId, avg (duration) from sessions group by userId having count(userId) > 1;
