-- Insert a new product into the 'products' table with the name "chair",
-- a price of 44.00, and can_be_returned set to false.
INSERT INTO products
  (name, price, can_be_returned)
VALUES
  ('chair', 44.00, 'f');

-- Insert a new product into the 'products' table with the name "stool",
-- a price of 25.99, and can_be_returned set to true.
INSERT INTO products
  (name, price, can_be_returned)
VALUES
  ('stool', 25.99, 't');

-- Insert a new product into the 'products' table with the name "table",
-- a price of 124.00, and can_be_returned set to false.
INSERT INTO products
  (name, price, can_be_returned)
VALUES
  ('table', 124.00, 'f');

-- Retrieve all rows and columns from the 'products' table.
SELECT * FROM products;

-- Retrieve only the names of all products from the 'products' table.
SELECT name FROM products;

-- Retrieve the names and prices of all products from the 'products' table.
SELECT name, price FROM products;

-- Insert a new product into the 'products' table. This example uses "hammock" as the name,
-- 99.00 as the price, and can_be_returned set to true.
INSERT INTO products
  (name, price, can_be_returned)
VALUES
  ('hammock', 99.00, 't');

-- Retrieve all products from the 'products' table where the product can be returned.
SELECT * FROM products WHERE can_be_returned;

-- Retrieve all products from the 'products' table where the price is less than 44.00.
SELECT * FROM products WHERE price < 44.00;

-- Retrieve all products from the 'products' table where the price is between 22.50 and 99.99.
SELECT * FROM products WHERE price BETWEEN 22.50 AND 99.99;

-- Update the prices of all products in the 'products' table, reducing each price by $20 to reflect a sale.
UPDATE products SET price = price - 20;

-- Delete all products from the 'products' table where the price is less than 25,
-- indicating these items have sold out due to the sale.
DELETE FROM products WHERE price < 25;

-- After the sale ends, increase the prices of all remaining products in the 'products' table by $20.
UPDATE products SET price = price + 20;

-- Update the 'products' table to set can_be_returned to true for all products,
-- reflecting a change in company policy making all products returnable.
UPDATE products SET can_be_returned = 't';

