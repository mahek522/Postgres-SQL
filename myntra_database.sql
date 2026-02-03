create database myntra;
use myntra;
CREATE TABLE Users
(
    user_id INT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number char(15),
    [password] VARCHAR(100) NOT NULL
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(50),
    brand VARCHAR(50)
);

CREATE TABLE Orders
(
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATETIME2 DEFAULT SYSDATETIME(),
    total_amount FLOAT NOT NULL,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE OrderItem (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price FLOAT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Users VALUES 
(1, 'Vihaan','Rathod','vihaan@gmail.com', '9876543210','password123'),
(2, 'Arjun','Singh','arjun@gmail.com','876543210','password456'),
(3, 'Rohan','Singh','rohan@yahoo.com','+91-9876664531', 'password789'),
(4, 'Saanvi','Reddy','saanvi@gamil.com','7666453111', 'password101112'),
(5, 'Pranav','Sai','pranav@yahoo.com', '+91-7876664533','password131415'),
(6, 'Diya','Antony','diya@gmail.com', '7876664531','password161718'),
(7, 'Aadhya','Reddy','aadhya@gmail.com','+91-7776664531','password192021'),
(8, 'Siddharth','Shetty','siddharth@gmail.com', '776664531','password222324'),
(9, 'Nikhil','Sharma','nikhil@gmail.com','886664532','password252627'),
(10, 'Krishna','Reddy','krishna@gmail.com','+91-8886664535','password282930'),
(11, 'Viraj','Nair','viraj@gmail.com', '91-8766745345','password313233'),
(12, 'Neha','Nair','neha@gmail.com','91-976684539','password343536'),
(13, 'Sahana','Singh','sahana@gmail.com','91-976684566','password373839'),
(14, 'Kavya','Reddy','kavya@gmail.com', '26686539','password404142'),
(15, 'Ishanvi','Gowda','ishanvi.j@gmail.com', '9146684539','password434445'),
(16, 'Ravi','Gowda','ravi@gmail.com', NULL,'password1212');

select * from Users;

INSERT INTO Product (product_id, name, description, price, category, brand) VALUES
(1, 'Slim Fit Jeans', 'Blue slim fit jeans for men', 1500, 'Clothing', 'Levis'),
(2, 'Printed T-shirt', 'Cotton t-shirt with graphic print', 2000, 'Clothing', 'Nike'),
(3, 'Running Shoes', 'Lightweight running shoes for women', 1000, 'Footwear', 'Adidas'),
(4, 'Backpack', 'Waterproof backpack with multiple compartments', 3000, 'Accessories', 'Puma'),
(5, 'Sunglasses', 'Stylish sunglasses with UV protection', 2500, 'Accessories', 'Zara'),
(6, 'Floral Print Dress', 'Flowy dress with floral print', 400, 'Clothing', 'Zara'),
(7, 'Casual Sneakers', 'Canvas sneakers for casual wear', 300, 'Footwear', 'Levis'),
(8, 'Leather Wallet', 'Genuine leather wallet with card slots', 1500, 'Accessories', 'Puma'),
(9, 'T-shirt', 'T-shirt with graphic print', 5000, 'Clothing', 'Hrx'),
(10, 'Smartwatch', 'Fitness tracker with heart rate monitor', 10000, 'Electronics', 'Apple'),
 (11, 'Denim Jacket', 'Classic denim jacket for men', 450, 'Clothing', 'Arrow'),
(12, 'Ankle Boots', 'Leather ankle boots with buckle detail', 1400, 'Footwear', 'Arrow'),
(13, 'Crossbody Bag', 'Chic crossbody bag with chain strap', 1000, 'Accessories', 'Arrow'),
(14, 'Wireless Headphones', 'Bluetooth headphones with noise cancellation', 700, 'Electronics', 'Sony'),
(15, 'Printed Joggers', 'Stretchy Joggers with colorful print', 1200, 'Clothing', 'Hrx'),
(16, 'T-shirt', 'Cotton t-shirt', 2000, 'Clothing', 'Roadster');

select * from Product;

INSERT INTO Orders
(order_id, user_id, order_date, total_amount, status)
VALUES
(101, 1, '2021-01-10 10:47:20', 2000, 'Pending'), 
(201, 2, '2021-02-12 14:57:33', 1500, 'Shipped'),
(301, 2, '2023-05-14 14:22:33', 7000, 'Delivered'),
(401, 4, '2023-05-14 14:57:33', 1000, 'Pending'),
(501, 3, '2024-01-22 09:40:15', 1000, 'Shipped'),
(601, 6, '2024-02-26 01:34:26', 2000, 'Pending'),
(701, 7, '2024-02-14 19:26:01', 1500, 'Shipped'),
(801, 5, '2024-04-17 17:09:51', 8000, 'Delivered'),
(901, 8, '2024-03-14 14:55:32', 9000, 'Pending'),
(902, 1, '2024-03-14 12:44:30', 5000, 'Shipped'),
(903, 3, '2024-04-16 17:08:51', 1000, 'Pending'),
(904, 9, '2024-04-17 17:08:51', 3000, 'Shipped'),
(905, 9, '2024-04-17 17:09:51', 4000, NULL),
(906, 9, '2024-04-17 17:08:51', 3000, NULL);

select * from Orders;

INSERT INTO OrderItem (order_item_id, order_id, product_id, quantity, price) VALUES
(111, 101, 2, 2, 4000),
(222, 201, 2, 1, 2000),
(333, 101, 3, 1, 1000),
(444, 401, 1, 2, 3000),
(555, 501, 5, 1, 2500),
(666, 301, 2, 2, 4000),
(777, 201, 4, 1, 3000),
(888, 601, 8, 1, 1500),
(999, 801, 7, 2, 300),
(9990, 701, 6, 1, 400),
(9991, 901, 9, 2, 10000),
(9992, 101, 10, 1, 10000),
(9993, 601, 11, 1, 450),
(9994, 801, 12, 2, 2800),
(9995, 701, 16, 1, 2000);

select * from OrderItem;
