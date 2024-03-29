DROP TABLE IF EXISTS rentals;
DROP TABLE IF EXISTS stocks;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
 id SERIAL8 PRIMARY KEY,
 name VARCHAR,
 age INT
);

CREATE TABLE stocks (
 id SERIAL8 PRIMARY KEY,
 name VARCHAR,
 amount INT,
 price INT,
 image TEXT,
 type VARCHAR
);

CREATE TABLE rentals (
 id SERIAL8 PRIMARY KEY,
 customer_id INT references customers(id) ON DELETE CASCADE,
 stock_id INT references stocks(id) ON DELETE CASCADE,
 rent_date VARCHAR
);
