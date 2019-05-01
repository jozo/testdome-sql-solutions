-- Each item in a web shop belongs to a seller. To ensure service quality, each seller has a rating.
--
-- The data are kept in the following two tables:
--
-- TABLE sellers
--   id INTEGER PRIMARY KEY,
--   name VARCHAR(30) NOT NULL,
--   rating INTEGER NOT NULL
--
-- TABLE items
--   id INTEGER PRIMARY KEY,
--   name VARCHAR(30) NOT NULL,
--   sellerId INTEGER REFERENCES sellers(id)
--
-- Write a query that selects the item name and the name of its seller for each item that belongs to a seller with a rating greater than 4.
--
-- Suggested testing environment:
-- http://sqlite.online/

-- Example case create statement:
-- CREATE TABLE sellers (
--   id INTEGER NOT NULL PRIMARY KEY,
--   name VARCHAR(30) NOT NULL,
--   rating INTEGER NOT NULL
-- );
--
-- CREATE TABLE items (
--   id INTEGER NOT NULL PRIMARY KEY,
--   name VARCHAR(30) NOT NULL,
--   sellerId INTEGER REFERENCES sellers(id)
-- );
--
-- INSERT INTO sellers(id, name, rating) VALUES(1, 'Roger', 3);
-- INSERT INTO sellers(id, name, rating) VALUES(2, 'Penny', 5);
--
-- INSERT INTO items(id, name, sellerId) VALUES(1, 'Notebook', 2);
-- INSERT INTO items(id, name, sellerId) VALUES(2, 'Stapler', 1);
-- INSERT INTO items(id, name, sellerId) VALUES(3, 'Pencil', 2);
--
-- Expected output (in any order):
-- Item      Seller
-- ----------------
-- Notebook  Penny
-- Pencil    Penny

select items.name, sellers.name from items
join sellers on items.sellerId = sellers.id
where sellers.rating > 4;
