-- Create tables
CREATE TYPE role AS ENUM ('admin', 'user');
CREATE TABLE users(
    id uuid DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    role role,
    address TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP ,
    modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE categories(
    id uuid DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP ,
    modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE products(
    id uuid DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    inventory INTEGER,
    price DECIMAL(8,2) NOT NULL,
    description TEXT,
    category_id UUID REFERENCES categories(id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP ,
    modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE carts(
    id uuid DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    user_id UUID REFERENCES users(id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP ,
    modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE cart_items(
    id uuid DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    product_id UUID REFERENCES products(id),
    quantity INTEGER,
    cart_id UUID REFERENCES cart(id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP ,
    modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE images(
    id uuid DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    product_id UUID REFERENCES products(id),
    category_id UUID REFERENCES categories(id),
    user_id UUID REFERENCES users(id),
    location TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP ,
    modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- checking list of tables that just created above
SELECT table_name FROM information_schema.tables WHERE table_schema='public' AND table_type='BASE TABLE';

-- adding values to users table
INSERT INTO users (first_name, last_name, password, email, role, address) VALUES ('Quan', 'Nguyen', 'changeme', 'quan.nguyen@gmail.com', 'admin', '123 ABC');
INSERT INTO users (first_name, last_name, password, email, role, address) VALUES ('John', 'Doe', 'changeme', 'john@mail.com', 'user', '123 ABXTZC');
INSERT INTO users (first_name, last_name, password, email, role, address) VALUES ('James', 'Bongs', 'changeme', 'james.bongs@gmail.com', 'user', '123 ABC');
INSERT INTO users (first_name, last_name, password, email, role, address) VALUES ('Harry', 'Potter', 'changeme', 'harry.potter@gmail.com', 'user', '123 XZG');
INSERT INTO users (first_name, last_name, password, email, role, address) VALUES ('William', 'Shakespear', 'changeme', 'william.shakespear@ancientmail.old', 'admin', '123 ABC');

-- adding values to categories table
INSERT INTO categories (category_name) VALUES ('Electronics');
INSERT INTO categories (category_name) VALUES ('Clotings');
INSERT INTO categories (category_name) VALUES ('Home and Kithchen');
INSERT INTO categories (category_name) VALUES ('Sports');
INSERT INTO categories (category_name) VALUES ('Toys and Games');
INSERT INTO categories (category_name) VALUES ('Health');

-- adding values to categories table
INSERT INTO products (product_name, inventory, price, description,category_id) VALUES
('TShirt',150,19.99,'A comfortable and stylish T-shirt made from 100% cotton. Comes in various colors and sizes','739dfea1-4383-4fd1-b9c0-c7a033340c37'),
('Jeans',200,29.99,'High-quality denim jeans that are durable and stylish. Available in various styles and sizes','739dfea1-4383-4fd1-b9c0-c7a033340c37'),
('Sneakers',220,29.99,'Comfortable and fashionable sneakers for men and women. Available in various colors and size','739dfea1-4383-4fd1-b9c0-c7a033340c37'),
('Dishwashing tablet',320,39.99,'A warm and cozy hoodie made from soft cotton. Comes in various colors and sizes','d7df6e7c-4603-45d1-865e-044dd56baef0'),
('Backpack',120,49.99,'A sturdy and spacious backpack for daily use. Comes with multiple pockets and compartments','739dfea1-4383-4fd1-b9c0-c7a033340c37'),
('Watch',100,149.99,'A high-quality watch with a stylish design. Comes with a leather or metal strap','a788deae-736b-4ef0-aad9-aa895821e56b'),
('Sunglasses',80,129.99,'A high-quality watch with a stylish design. Comes with a leather or metal strap','2252b6c8-4eae-4e95-b37c-ad479fe3310b'),
('Phone case',189,19.99,'A sleek helps you monitor your health and fitness','a788deae-736b-4ef0-aad9-aa895821e56b'),
('Fitness Tracker',289,199.99,'A sleek and stylish case made from high-quality materials. Comes with multiple compartments','5ceeeb8a-670a-4a79-a218-7941d2e96f7a'),
('Gaming Chair',89,149.99,'A sleek and stylish chair made from high-quality materials.','a7002631-afc1-4535-b26d-964adaae4159');

-- adding values to carts table
INSERT INTO carts(user_id) VALUES 
('9b6ac5fb-d9b3-4197-b51e-2b97e168d6d2'),
('7ac0f03c-82bd-48f3-8e44-8d7fdc40b1b0'),
('a21658e7-3cc4-4181-a4ed-10fe556634cc');

-- adding values to cart_item table
INSERT INTO cart_items(product_id, quantity, cart_id) VALUES
('63e7bbc9-09ea-4079-97ad-0b4b42934a91', 3,'d847e779-b7ff-4779-9668-d3b8dce8a8f5'),
('3fc349a3-0578-499a-9e5d-cf5da8fd8d33', 1,'d847e779-b7ff-4779-9668-d3b8dce8a8f5'),
('cba862be-2e2a-4ff3-b198-42853fb61b38', 3,'d847e779-b7ff-4779-9668-d3b8dce8a8f5'),
('4987be55-b6af-42cc-99d8-b720fc9dd658', 2,'fcaff2da-09ab-4ce7-aefb-34ef046388e8'),
('efb59995-7a22-4e75-aa18-a5b69c0897d5', 1,'f698e637-0637-40b3-9c98-305ae7d527f2'),
('63e7bbc9-09ea-4079-97ad-0b4b42934a91', 1,'f698e637-0637-40b3-9c98-305ae7d527f2');

-- adding values to images table
INSERT INTO images(product_id, category_id, user_id, location) VALUES 
('3fc349a3-0578-499a-9e5d-cf5da8fd8d33','a788deae-736b-4ef0-aad9-aa895821e56b',NULL,'https://api.lorem.space/image/face?w=640&h=480&r=867'),
(NULL,NULL,'9b6ac5fb-d9b3-4197-b51e-2b97e168d6d2','https://api.lorem.space/image/face?w=640&h=480&r=867'),
(NULL,NULL,'7ac0f03c-82bd-48f3-8e44-8d7fdc40b1b0','https://api.lorem.space/image/face?w=640&h=480&r=867'),
('63e7bbc9-09ea-4079-97ad-0b4b42934a91','739dfea1-4383-4fd1-b9c0-c7a033340c37',NULL,'https://api.lorem.space/image/face?w=640&h=480&r=867'),
('4987be55-b6af-42cc-99d8-b720fc9dd658','739dfea1-4383-4fd1-b9c0-c7a033340c37',NULL,'https://api.lorem.space/image/face?w=640&h=480&r=867'),
('b460e19c-0ab2-49aa-8c75-817c455488d4','a7002631-afc1-4535-b26d-964adaae4159',NULL,'https://api.lorem.space/image/face?w=640&h=480&r=867');

-- checking all the tables with added values
SELECT * FROM carts;
SELECT * FROM products;
SELECT * FROM categories;
SELECT * FROM users;
SELECT * FROM cart_items;
SELECT * FROM images;

-- backup data
COPY users TO 'C:/Users/Home/Desktop/test_data/users.csv' DELIMITER ',' CSV HEADER;
COPY categories TO 'C:/Users/Home/Desktop/test_data/categories.csv' DELIMITER ',' CSV HEADER;
COPY products TO 'C:/Users/Home/Desktop/test_data/products.csv' DELIMITER ',' CSV HEADER;
COPY cart TO 'C:/Users/Home/Desktop/test_data/cart.csv' DELIMITER ',' CSV HEADER;
COPY cartitem TO 'C:/Users/Home/Desktop/test_data/cartitem.csv' DELIMITER ',' CSV HEADER;
COPY images TO 'C:/Users/Home/Desktop/test_data/images.csv' DELIMITER ',' CSV HEADER;

/* Get a single product */
SELECT product_name, price, description 
FROM products WHERE id = '63e7bbc9-09ea-4079-97ad-0b4b42934a91';

/* Get all products with params: */

-- get all products
SELECT product_name, price, description FROM products;

-- offset and limit 
SELECT product_name, price, description FROM products ORDER BY price LIMIT 6;
SELECT product_name, price, description FROM products ORDER BY price LIMIT 7 OFFSET 2;

-- sortBy and sort asc/desc ATTRIBUTE 
SELECT product_name, inventory, price FROM products ORDER BY product_name ASC;
SELECT product_name, inventory, price FROM products ORDER By price DESC;

-- Getting all products by category id, for example, getting all products of category id 1
SELECT product_name, inventory, price, description, categories.category_name 
FROM products 
JOIN categories ON products.category_id = categories.id
WHERE categories.id = '998471e6-0c78-4134-a38b-c11c2e9a258c';

-- Sorting products by name ascending/ descending order
SELECT product_name, inventory, price, description, categories.category_name 
FROM products 
JOIN categories ON products.category_id = categories.id
ORDER BY product_name;

SELECT product_name, inventory, price, description, categories.category_name 
FROM products 
JOIN categories ON products.category_id = categories.id
ORDER BY product_name DESC;

-- Sorting products by price ascending/ descending order
SELECT product_name, inventory, price, description, categories.category_name 
FROM products 
JOIN categories ON products.category_id = categories.id
ORDER BY price;

SELECT product_name, inventory, price, description, categories.category_name 
FROM products 
JOIN categories ON products.category_id = categories.id
ORDER BY price DESC;

-- Searching all products that include the search input from user (implement search bar), for example, user is searching for the word "ea"
SELECT product_name, inventory, price, description, categories.category_name 
FROM products 
JOIN categories ON products.category_id = categories.id
WHERE product_name LIKE '%ea%';

-- get response for this endpoint: 
-- /api/v1/products?limit=5&sortBy=price&sortOrder=asc&fromRange=10&toRange=30
SELECT products.*, categories.category_name
from products  
JOIN categories
on products.category_id = categories.id
WHERE price BETWEEN 10 AND 30 ORDER BY price ASC LIMIT 5; 

/* Create a product */
INSERT INTO products(product_name, inventory, price, description, category_id) VALUES
('Nintendo', 5, 195,'Designed to play at home or on-the-go.','a788deae-736b-4ef0-aad9-aa895821e56b');

/* Update products */
UPDATE products SET description = 'This is a test description' WHERE product_name = 'Nintendo';

-- Update a single product
UPDATE products SET description = 'This is a test description' WHERE id = 'a788deae-736b-4ef0-aad9-aa895821e56b';

/*Delete products*/
DELETE FROM products WHERE product_name = 'Nintendo';

-- Delete a single product
DELETE FROM products WHERE id = 'a788deae-736b-4ef0-aad9-aa895821e56b';

/* Get all users */
SELECT first_name, last_name, email, address FROM users ORDER BY first_name;

/* Get a single user and their avatar */
-- here actually we should use id instead of first_name, but for running purpose, we used first_name here as the id might different for each member
SELECT first_name, last_name, email, location AS avatar, role, address 
FROM images 
JOIN users
ON users.id = user_id
WHERE first_name = 'John';

-- get all users who has avatar
SELECT first_name, last_name, location as avatar
FROM images 
JOIN users
ON users.id = user_id

/* Create a user */
INSERT INTO users (first_name, last_name, password, email, role, address) 
VALUES ('Nhu', 'Nguyen', 'nhu123', 'nhu.nguyen@mail.com', 'user', '12 address');

/* Update a single user */
UPDATE users SET address= 'Helsinki' WHERE id = 'f830af04-4891-4740-8553-01017e662c95';

/*Delete a single users*/
DELETE FROM users WHERE id = 'f830af04-4891-4740-8553-01017e662c95'; 

