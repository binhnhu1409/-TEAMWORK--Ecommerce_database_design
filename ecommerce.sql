-- CREATE TABLE users(
--     id uuid DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
--     first_name VARCHAR(50) NOT NULL,
--     last_name VARCHAR(50) NOT NULL,
--     avatar VARCHAR(150),
--     password VARCHAR(50) NOT NULL,
--     email VARCHAR(50) NOT NULL,
--     role VARCHAR(50),
--     created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP ,
--     modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
-- );

-- CREATE TABLE images(
--     id uuid DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
--     location VARCHAR(150) NOT NULL,
--     created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP ,
--     modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
-- );

-- CREATE TABLE categories(
--     id uuid DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
--     category_name VARCHAR(50) NOT NULL,
--     -- product_id INTEGER REFERENCES products(id),
--     created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP ,
--     modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
-- );

-- CREATE TABLE products(
--     id uuid DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
--     product_name VARCHAR(50) NOT NULL,
--     price DECIMAL NOT NULL,
--     description TEXT,
--     category_id UUID REFERENCES categories(id),
--     image_id UUID REFERENCES images(id),
--     created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP ,
--     modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
-- );

-- CREATE TABLE cart(
--     id uuid DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
--     user_id UUID REFERENCES users(id),
--     created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP ,
--     modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
-- );

-- CREATE TABLE cartItems(
--     id uuid DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
--     product_id UUID REFERENCES products(id),
--     quantity INTEGER,
--     cart_id UUID REFERENCES cart(id),
--     created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP ,
--     modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
-- );

/*---------------------------------------------------------------------------- */

-- COPY products (product_name, price, description,category_id, image_id)
-- FROM 'C:/Users/Home/Downloads/products.csv'
-- DELIMITER ';'
-- CSV HEADER;

-- COPY users (first_name, last_name, avatar, password, email, role)
-- FROM 'C:/Users/Home/Downloads/users (3).csv'
-- DELIMITER ';'
-- CSV HEADER;

-- COPY categories (category_name)
-- FROM 'C:/Users/Home/Downloads/categories.csv'
-- DELIMITER ';'
-- CSV HEADER;

-- COPY images (location)
-- FROM 'C:/Users/Home/Downloads/images.csv'
-- DELIMITER ';'
-- CSV HEADER;

-- COPY cart (user_id)
-- FROM 'C:/Users/Home/Downloads/cart.csv'
-- DELIMITER ';'
-- CSV HEADER;

-- COPY cartitems (product_id, quantity, cart_id)
-- FROM 'C:/Users/Home/Downloads/cartItems.csv'
-- DELIMITER ';'
-- CSV HEADER;

/*---------------------------------------------------------------------------- */

-- DROP TABLE users;
-- DROP TABLE images;
-- DROP TABLE categories;
-- DROP TABLE products;
-- DROP TABLE cart;
-- DROP TABLE cartItems;

/*---------------------------------------------------------------------------- */

-- SELECT * FROM users;
-- SELECT * FROM products;
-- SELECT * FROM categories;
-- SELECT * FROM cart;
-- SELECT * FROM cartItems
-- SELECT * FROM images;

/*---------------------------------------------------------------------------- */

/* SQL Queries */

/*--------------------------------SELECT------------------------------------------ */

-- SELECT * FROM products;
-- SELECT * FROM products where price > 10 AND price < 30 ;
-- SELECT category_id, count(id) as count from products group by category_id;

-- SELECT products.product_name, quantity 
-- FROM cartitems
-- JOIN products
-- ON products.id = product_id;

-- SELECT product_id, cart_id
-- FROM cartitems
-- JOIN products
-- ON products.id = product_id;

-- SELECT cart_id, products.product_name, quantity 
-- FROM cartitems 
-- JOIN products 
-- ON products.id = product_id;

/*--------------------------------INSERT------------------------------------------ */

-- INSERT INTO products(product_name, price, description, category_id, image_id) VALUES
-- ('Nintendo', 199,'Designed to play at home or on-the-go.','a4b57d7a-b86e-4e77-8c4e-3e34a8b5015b','c086319d-8d36-4480-85c2-2a2e8b3e4a02');

/*--------------------------------UPDATE------------------------------------------ */

-- UPDATE products set description = 'This is a test description' where id ='2c10038e-a740-455a-a265-1cd3d394f85a';

/*--------------------------------DELETE-------------------------------------------*/
-- DELETE FROM products where product_name = 'Nintendo';