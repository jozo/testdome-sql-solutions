-- The following two tables are used to define users and their respective roles:
--
-- TABLE users
--   id INTEGER NOT NULL PRIMARY KEY,
--   userName VARCHAR(50) NOT NULL
--
-- TABLE roles
--   id INTEGER NOT NULL PRIMARY KEY,
--   role VARCHAR(20) NOT NULL
--
-- The users_roles table should contain the mapping between each user and their roles. Each user can have many roles, and each role can have many users.
--
-- Modify the provided SQLite create table statement so that:
--
--     Only users from the users table can exist within users_roles.
--     Only roles from the roles table can exist within users_roles.
--     A user can only have a specific role once.
--
--     See the example case for more details.
--
-- Suggested testing environment:
-- http://sqlite.online/
-- PRAGMA foreign_keys = ON; -- Enable foreign key support in SQLite.
--
-- -- Example case create statement:
-- CREATE TABLE users (
--   id INTEGER NOT NULL PRIMARY KEY,
--   userName VARCHAR(50) NOT NULL
-- );
--
-- CREATE TABLE roles (
--   id INTEGER NOT NULL PRIMARY KEY,
--   role VARCHAR(20) NOT NULL
-- );
--
-- INSERT INTO users(id, userName) VALUES(1, 'Steven Smith');
-- INSERT INTO users(id, userName) VALUES(2, 'Brian Burns');
--
-- INSERT INTO roles(id, role) VALUES(1, 'Project Manager');
-- INSERT INTO roles(id, role) VALUES(2, 'Solution Architect');
--
-- -- Improve the create table statement below:
-- CREATE TABLE users_roles (
--   userId INTEGER,
--   roleId INTEGER
-- );
--
-- -- The statements below should pass.
-- INSERT INTO users_roles(userId, roleId) VALUES(1, 1);
-- INSERT INTO users_roles(userId, roleId) VALUES(1, 2);
-- INSERT INTO users_roles(userId, roleId) VALUES(2, 2);
--
-- -- The statement below should fail.
-- INSERT INTO users_roles(userId, roleId) VALUES(2, NULL);

CREATE TABLE users_roles (
  userId INTEGER not null,
  roleId INTEGER not null,
  foreign key (userId) references users(id),
  foreign key (roleId) references roles(id),
  unique (userId, roleId)
);
