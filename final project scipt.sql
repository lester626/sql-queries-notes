CREATE TABLE users(
user_id INT NOT NULL AUTO_INCREMENT,
email VARCHAR(55) NOT NULL,
user_password VARCHAR(150) NOT NULL,
user_first_name VARCHAR(20) NOT NULL,
user_last_name VARCHAR(20) NOT NULL,
user_image BLOB,
accept_email TINYINT NOT NULL,
user_role VARCHAR(6),
user_address_id INT NOT NULL,
PRIMARY KEY (user_id)
);

CREATE TABLE user_address(
user_address_id INT NOT NULL AUTO_INCREMENT,
country VARCHAR(20) NOT NULL,
city VARCHAR(20) NOT NULL,
street VARCHAR(55) NOT NULL,
zip_code INT NOT NULL,
PRIMARY KEY (user_address_id)
);

CREATE TABLE delivery_address(
del_address_id INT NOT NULL AUTO_INCREMENT,
country VARCHAR(20) NOT NULL,
city VARCHAR(20) NOT NULL,
street VARCHAR(55) NOT NULL,
zipcode INT NOT NULL,
user_id INT NOT NULL,
PRIMARY KEY (del_address_id)
);

CREATE TABLE role_type(
role_id INT NOT NULL AUTO_INCREMENT,
role_type VARCHAR(10) NOT NULL,
PRIMARY KEY (role_id)
);

CREATE TABLE products(
product_id INT NOT NULL AUTO_INCREMENT,
product_name VARCHAR(55) NOT NULL,
product_desc VARCHAR(5000) NOT NULL,
image_url VARCHAR(100) NOT NULL,
price FLOAT NOT NULL,
category_id INT NOT NULL,
subcategory_id INT NOT NULL,
role_id INT NOT NULL,
PRIMARY KEY (product_id)
);

CREATE TABLE category(
category_id INT NOT NULL AUTO_INCREMENT,
category_name VARCHAR(50) NOT NULL,
PRIMARY KEY (category_id)
);

CREATE TABLE subcategory(
subcategory_id INT NOT NULL AUTO_INCREMENT,
subcategory_name VARCHAR(50) NOT NULL,
category_id INT NOT NULL,
PRIMARY KEY (subcategory_id)
);

CREATE TABLE order_lines(
order_line_id INT NOT NULL AUTO_INCREMENT,
total_products INT NOT NULL,
product_price FLOAT,
product_id INT NOT NULL,
user_id INT NOT NULL,
PRIMARY KEY (order_line_id)
);

CREATE TABLE orders(
order_id INT NOT NULL AUTO_INCREMENT,
total_cost FLOAT NOT NULL,
order_date DATE NOT NULL,
order_status VARCHAR(15) NOT NULL,
order_line_id INT NOT NULL,
user_id INT NOT NULL,
del_address_id INT NOT NULL,
product_id INT NOT NULL,
PRIMARY KEY (order_id)
);

ALTER TABLE orders
ADD CONSTRAINT orders_order_line_id_fk 
FOREIGN KEY (order_line_id) REFERENCES order_lines(order_line_id);

ALTER TABLE orders
ADD CONSTRAINT orders_user_id_fk 
FOREIGN KEY (user_id) REFERENCES users(user_id);

ALTER TABLE orders
ADD CONSTRAINT orders_product_id_fk 
FOREIGN KEY (product_id) REFERENCES products(product_id);

ALTER TABLE orders
ADD CONSTRAINT orders_del_address_id_fk
FOREIGN KEY (del_address_id) REFERENCES delivery_address(del_address_id);

ALTER TABLE users
ADD CONSTRAINT users_user_address_id_fk 
FOREIGN KEY (user_address_id) REFERENCES user_address(user_address_id);

ALTER TABLE delivery_address
ADD CONSTRAINT delivery_address_user_id_fk 
FOREIGN KEY (user_id) REFERENCES users(user_id);

ALTER TABLE products
ADD CONSTRAINT products_category_id_fk
FOREIGN KEY (category_id) REFERENCES category(category_id);

ALTER TABLE products
ADD CONSTRAINT products_subcategory_id_fk
FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id);

ALTER TABLE subcategory
ADD CONSTRAINT subcategory_category_id_fk 
FOREIGN KEY (category_id) REFERENCES category(category_id);

ALTER TABLE order_lines
ADD CONSTRAINT order_lines_product_id_fk
FOREIGN KEY (product_id) REFERENCES products(product_id);

ALTER TABLE order_lines
ADD CONSTRAINT order_lines_user_id_fk
FOREIGN KEY (user_id) REFERENCES users(user_id);

INSERT INTO category(category_name) 
VALUES ("Beverages"),
("Bread/Bakery"),
("Canned/Jarred Goods"),
("Dairy"),
("Cleaners"),
("Paper Goods"),
("Personal Care"),
("Dry/Baking Goods"),
("Frozen Foods"),
("Meat"),
("Produce"),
("Other");

INSERT INTO subcategory(subcategory_name, category_id) 
VALUES ("Coffee/Tea", 1),
("Juice", 1),
("Soda", 1),
("Sandwich Loaves", 2),
("Dinner Rolls", 2),
("Tortillas", 2),
("Bagels", 2),
("Vegetables", 3),
("Spaghetti Sauce", 3),
("Ketchup", 3),
("Cheeses", 4),
("Eggs", 4),
("Milk", 4),
("Yogurt", 4),
("Butter", 4),
("All-Purpose", 5),
("Laundry Detergent", 5),
("Dishwashing Liquid/Detergent", 5),
("Paper Towels", 6),
("Toilet Paper", 6),
("Aluminum Foil", 6),
("Sandwich Bags", 6),
("Shampoo", 7),
("Conditioner", 7),
("Soap", 7),
("Shaving Cream", 7),
("Deodorant", 7),
("Flour", 8),
("Mixes", 8),
("Sugar", 8),
("Cereals", 8),
("Ice Cream", 9),
("Fruits & Vegetables", 9),
("Meals", 9),
("Bread", 9),
("Beef", 10),
("Pork", 10),
("Poultry", 10),
("Seafood", 10),
("Vegetable", 11),
("Fruits", 11),
("Baby Items", 12),
("Pet Items", 12),
("Batteries", 12),
("Greeting Cards", 12);

ALTER TABLE products
modify image_url varchar(10000);

INSERT INTO products(product_name, product_desc, image_url, price, category_id, subcategory_id) VALUES 
("Kalsada Coffee", "The source of the beans for Kalsada Coffee is grown in Belis, Benguet in the Cordillera mountain region.", "https://images.squarespace-cdn.com/content/v1/583c3e2d15d5db66120aff65/1531744382710-4L2XH5KI1RZVBMYNIXFT/Kalsada+Philippine+specialty+coffee", 57.25, 1, 1),
("Coffee for Peace", "The company is known for is the premium quality of its processed beans.", "https://www.sunstar.com.ph/uploads/images/2019/02/03/121698.JPG", 46.33, 1, 1),
("Kopiko", "Kopiko's take on the milky 'white cofee' phenomenon has bean - and continues to be a favorite among coffee lovers with a sweet tooth.", "https://cdn.shopify.com/s/files/1/2713/3026/products/kopikoastig_2048x.png?v=1616741944", 99.5, 1, 1),
("Lipton", "Made from the same leaf as black tea, but picked younger for a fresher, lighter flavor, classic greentea blend is a delicate balance of grassy notes.", "https://www.lipton.com/content/dam/unilever/lipton_international/united_states_of_america/pack_shot/041000002878.01-34278159-png.png", 48.77, 1, 1),
("Tiesta Tea", "Which is a loose-leaf tea sold in colorful pouches in tins. This hot new tea company based in Chicago really knows their tea leaves and blends!", "https://s3.us-east-1.amazonaws.com/co-assets/assets/image-transforms/images/53482/Tiesta-Tea-ColdBrew_d88e4f0344a8f3f0bf6d644a30195abc.jpg", 51.24, 1, 1),
("Yorkshire Tea", "Is a black tea blend produced by the Bettys & Taylors group since 1977. Yorkshire tea uses varieties  of tea grown, blended to form eight blends.", "https://m.media-amazon.com/images/I/91ohPaRXXSL._SL1500_.jpg", 68.63, 1, 1);

INSERT INTO user_address(country, city, street, zip_code) VALUES
("Philippines", "Makati", "9420 Magallanes", 1212);

INSERT INTO users(email, user_password, user_first_name, user_last_name, accept_email, user_address_id, user_role) VALUES
("vincenttogle626@gmail.com", "$2a$12$wGwrksg1qJH1j5TSeh.rD.CjYRPge7MSVen4cBIt9/LPTtOcv.MDm", "vincent", "togle", "1", "1", "ADMIN"),
("vincent.togle626@gmail.com", "$2a$12$wGwrksg1qJH1j5TSeh.rD.CjYRPge7MSVen4cBIt9/LPTtOcv.MDm", "vincent", "togle", "1", "1", "USER");

INSERT INTO role_type(role_type) VALUES
("ADMIN"),
("USER");

ALTER TABLE orders
DROP FOREIGN KEY orders_username_fk;

ALTER TABLE order_lines
DROP FOREIGN KEY order_lines_username_fk;

ALTER TABLE delivery_address
DROP FOREIGN KEY delivery_address_username_fk;

ALTER TABLE orders
ADD COLUMN user_id INT;

ALTER TABLE order_lines
ADD COLUMN user_id INT;

ALTER TABLE delivery_address
ADD COLUMN user_id INT;

ALTER TABLE orders
DROP COLUMN user_id;

ALTER TABLE order_lines
DROP COLUMN user_id;

ALTER TABLE delivery_address
DROP COLUMN user_id;

ALTER TABLE users
MODIFY COLUMN user_role VARCHAR(15);

ALTER TABLE products
MODIFY COLUMN product_name VARCHAR(500);

ALTER TABLE users
DROP FOREIGN KEY users_user_address_id_fk;

ALTER TABLE users
DROP COLUMN user_address_id;

-- Changes -- 
ALTER TABLE orders
DROP FOREIGN KEY orders_order_line_id_fk;

ALTER TABLE orders
DROP COLUMN order_line_id;

ALTER TABLE orders
DROP FOREIGN KEY orders_product_id_fk;

ALTER TABLE orders
DROP COLUMN product_id;

CREATE TABLE order_line_holder(
order_holder_id INT NOT NULL AUTO_INCREMENT,
total_products INT NOT NULL,
product_price FLOAT NOT NULL,
product_id INT NOT NULL,
order_id INT,
PRIMARY KEY (order_holder_id));

ALTER TABLE order_line_holder
ADD CONSTRAINT holder_order_line_fk FOREIGN KEY (order_line_id) REFERENCES order_lines(order_line_id);

ALTER TABLE order_line_holder
ADD CONSTRAINT holder_order_fk FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE order_line_holder
ADD CONSTRAINT holder_product_fk FOREIGN KEY (product_id) REFERENCES products(product_id);
-- --------------------------------------- --

ALTER TABLE users
ADD COLUMN (country VARCHAR(55) NOT NULL, city VARCHAR(55) NOT NULL, street VARCHAR(100) NOT NULL, zip_code INT NOT NULL);

-- 
ALTER TABLE order_line_holder
DROP FOREIGN KEY holder_order_fk;

ALTER TABLE order_line_holder
ADD CONSTRAINT holder_order_fk FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE order_line_holder
MODIFY COLUMN order_id INT(55) NOT NULL;

ALTER TABLE orders
MODIFY COLUMN order_id INT(55) NOT NULL AUTO_INCREMENT;

ALTER TABLE order_line_holder
DROP COLUMN order_line_id;
-- 

-- 
ALTER TABLE products
DROP FOREIGN KEY products_category_id_fk;

ALTER TABLE products
DROP COLUMN category_id;
-- 

ALTER TABLE products
ADD COLUMN availability tinyint;

ALTER TABLE category
ADD COLUMN image_url VARCHAR(10000) NOT NULL;

TRUNCATE TABLE users;

SELECT * FROM category;
SELECT * FROM subcategory;
SELECT c.category_name, s.subcategory_name FROM category c INNER JOIN subcategory s ON c.category_id = s.category_id;
SELECT * FROM orders;
SELECT * FROM order_lines;
SELECT * FROM order_line_holder;
SELECT * FROM delivery_address;
SELECT * FROM users;
SELECT * FROM products;

DROP TABLE users;


UPDATE users SET user_role="ROLE_ADMIN" WHERE user_id=1;
UPDATE users SET user_role="ROLE_USER" WHERE user_id=2;

DELETE FROM users WHERE user_id = 10;
DELETE FROM order_lines WHERE user_id = 5;
DELETE FROM order_line_holder WHERE order_id = 697302651;
DELETE FROM orders WHERE user_id = 11;

USE inventory;