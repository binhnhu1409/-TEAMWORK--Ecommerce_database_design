-- CREATE TABLE categories(
--     id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
--     category_name VARCHAR(50) NOT NULL,
--     created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP ,
--     modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
-- );

-- CREATE TABLE products(
--     id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
--     product_name VARCHAR(50) NOT NULL,
--     in_stock INTEGER NOT NULL,
--     price DECIMAL NOT NULL,
--     description TEXT,
--     category_id UUID REFERENCES categories(id) ON DELETE SET NULL,
--     created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP ,
--     modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
-- );

-- CREATE TABLE images(
--     id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
--     product_id UUID REFERENCES products(id) ON DELETE SET NULL,
--     category_id UUID REFERENCES categories(id) ON DELETE SET NULL,
--     user_id UUID REFERENCES users(id) ON DELETE SET NULL,
--     location VARCHAR(150) NOT NULL,
--     created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP ,
--     modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
-- );


-- CREATE TABLE users(
--     id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
--     first_name VARCHAR(50) NOT NULL,
--     last_name VARCHAR(50) NOT NULL,
--     password VARCHAR(50) NOT NULL,
--     email VARCHAR(50) NOT NULL,
--     role VARCHAR(50),
--     address TEXT,
--     created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP ,
--     modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
-- );

-- CREATE TABLE cart(
--     id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
--     category_id UUID REFERENCES categories(id) ON DELETE SET NULL,
--     created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP ,
--     modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
-- );

-- ALTER TABLE cart DROP COLUMN category_id;
-- ALTER TABLE cart ADD user_id UUID REFERENCES users(id) ON DELETE SET NULL ;

-- CREATE TABLE cartItems(
--     id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
--     product_id UUID REFERENCES products(id) ON DELETE SET NULL,
--     quantity INTEGER,
--     cart_id UUID REFERENCES cart(id) ON DELETE SET NULL,
--     created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP ,
--     modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
-- );

-- COPY products (product_name, price, in_stock, description,category_id)
-- FROM 'C:/Users/Home/Downloads/dummyData/products.csv'
-- DELIMITER ';'
-- CSV HEADER;

-- COPY categories (category_name)
-- FROM 'C:/Users/Home/Downloads/dummyData/categories.csv'
-- DELIMITER ';'
-- CSV HEADER;

-- COPY users (first_name, last_name, password, email, role, address)
-- FROM 'C:/Users/Home/Downloads/dummyData/users (3).csv'
-- DELIMITER ';'
-- CSV HEADER;

-- COPY cart (user_id)
-- FROM 'C:/Users/Home/Downloads/dummyData/cart.csv'
-- DELIMITER ';'
-- CSV HEADER;

-- COPY images (product_id, category_id, user_id, location)
-- FROM 'C:/Users/Home/Downloads/dummyData/images.csv'
-- DELIMITER ';'
-- CSV HEADER;

-- COPY cartitems (product_id, quantity, cart_id)
-- FROM 'C:/Users/Home/Downloads/dummyData/cartItems.csv'
-- DELIMITER ';'
-- CSV HEADER;

-- SELECT * FROM categories;
-- SELECT * FROM products;
-- SELECT * from cart;
-- select * from users;
-- SELECT * from cartitems;
-- TRUNCATE TABLE cartitems;
-- select * from images;

-- INSERT INTO images(product_id, location) VALUES ('0d7e8096-2eda-48d7-b83d-b6fcf80264b0', 'https://api.lorem.space/image/face?w=640&h=480&r=867')
-- INSERT INTO images(category_id, location) VALUES ('0ac9a533-0b2a-4b1a-9dde-bbc8c4a89234', 'https://api.lorem.space/image/face?w=640&h=480&r=867');
-- INSERT INTO images(user_id, location) VALUES ('62c013be-e460-4abb-9bdd-63932dbfb61a', 'https://api.lorem.space/image/face?w=640&h=480&r=867');
-- INSERT INTO images(product_id, location) VALUES ('0d7e8096-2eda-48d7-b83d-b6fcf80264b0', 'https://api.lorem.space/image/face?w=640&h=480&r=868');

-- DELETE from images where id = 'dbb2c86c-86e8-48a2-b6b8-a79a740df0e4';
-- select * from images;

/*---------------------------------------------------------------------------- */

/* SQL Queries */

/*--------------------------------SELECT------------------------------------------ */

-- SELECT * FROM products; 

/* get certain number of products in sorted by price --pagination */
-- SELECT product_name, price, description from products ORDER BY price LIMIT 6;
-- SELECT product_name, price, description from products ORDER BY price LIMIT 7 OFFSET 2;

/* Sorting products by name ascending/ descending order */
-- SELECT * FROM products ORDER BY product_name;
-- SELECT * FROM products ORDER BY product_name DESC;


-- SELECT * FROM products where price > 10 AND price < 30 ;
-- SELECT category_id, count(id) as count from products group by category_id;

/*Searching all products that include the search input from user (implement search bar), for example, user is searching for the word "Head"*/
-- SELECT * FROM products WHERE product_name LIKE '%Head%';

/* Getting all products by category id, for example, getting all products of category id 1 */
-- SELECT * FROM products 
-- JOIN categories ON products.category_id = categories.id
-- WHERE category_id = '049b6719-7045-4826-bd1f-e4cb1d14acd6';

/*get product name with number of quantity in cartItem*/
-- SELECT products.product_name, quantity 
-- FROM cartitems
-- JOIN products
-- ON products.id = product_id;

-- SELECT product_id, cart_id
-- FROM cartitems
-- JOIN products
-- ON products.id = product_id;

/*get cart with cart id */
-- SELECT cart_id, products.product_name, quantity 
-- FROM cartitems 
-- JOIN products 
-- ON products.id = product_id;

/*get product name and its categories*/
-- SELECT products.product_name, categories.category_name 
-- FROM products 
-- JOIN categories 
-- ON categories.id = products.category_id;

/*get users and their respective cart */
-- SELECT cart_id, products.product_name, quantity, users.first_name, users.last_name 
-- FROM cartItems 
-- JOIN products 
-- ON products.id = product_id 
-- JOIN cart 
-- ON cart.id = cart_id 
-- JOIN users 
-- ON users.id = user_id ;

/*get product information with image */
-- select product_name, price, description, images.location 
-- from images
-- join products
-- on products.id = product_id WHERE product_id = '0d7e8096-2eda-48d7-b83d-b6fcf80264b0';

/*--------------------------------INSERT------------------------------------------ */

-- INSERT INTO products(product_name, price, in_stock, description, category_id) VALUES
-- ('Nintendo', 199, 5,'Designed to play at home or on-the-go.','9b1bd9c8-08c6-4a02-84c7-d4a5470d74c0');

/*--------------------------------UPDATE------------------------------------------ */

-- UPDATE products set description = 'This is a test description' where id ='68d73ed1-0a31-4e34-952a-c4f922308e21';
-- select * from products;

/*--------------------------------DELETE-------------------------------------------*/
-- DELETE FROM products where product_name = 'Nintendo';