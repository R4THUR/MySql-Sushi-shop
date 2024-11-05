CREATE DATABASE SushiEat;

USE SushiEat;

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    address VARCHAR(255),
    phone_number VARCHAR(20)
);

CREATE TABLE Ingredients (
    ingredient_id INT PRIMARY KEY,
    ingredient_price DECIMAL(10,2),
    ingredient_name VARCHAR(255)
);

CREATE TABLE Sushi (
    sushi_id INT PRIMARY KEY,
    ingredient_id INT,
    sushi_name VARCHAR(255),
    sushi_price DECIMAL(10,2),
    sushi_description TEXT,
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id)
);

CREATE TABLE Recipe (
    sushi_id INT,
    ingredient_id INT,
    PRIMARY KEY (sushi_id, ingredient_id),
    FOREIGN KEY (sushi_id) REFERENCES Sushi(sushi_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id)
);

CREATE TABLE `Order` (
    order_id INT PRIMARY KEY,
    sushi_id INT,
    customer_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (sushi_id) REFERENCES Sushi(sushi_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    order_id INT,
    job VARCHAR(255),
    employee_name VARCHAR(255),
    salary DECIMAL(10,2),
    hiring_date DATE,
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id)
);



INSERT INTO Customer (customer_id, customer_name, address, phone_number) VALUES
(1, 'John Doe', '123 Main Street', '555-1234'),
(2, 'Jane Smith', '456 Elm Street', '555-5678'),
(3, 'Alice Johnson', '789 Oak Street', '555-9012'),
(4, 'Bob Brown', '101 Pine Street', '555-3456'),
(5, 'Emma Davis', '202 Maple Street', '555-7890');

INSERT INTO Ingredients (ingredient_id, ingredient_price, ingredient_name) VALUES
(1, 1.50, 'Avocado'),
(2, 2.00, 'Crab meat'),
(3, 0.50, 'Cucumber'),
(4, 1.00, 'Salmon'),
(5, 1.00, 'Tuna'),
(6, 2.50, 'Shrimp'),
(7, 0.50, 'Tempura batter'),
(8, 1.00, 'Assorted vegetables');

INSERT INTO Sushi (sushi_id, sushi_name, sushi_price, sushi_description) VALUES
(1, 'California Roll', 8.99, 'Avocado, crab meat, cucumber rolled in seaweed and rice'),
(2, 'Salmon Nigiri', 2.50, 'Fresh salmon on a bed of sushi rice'),
(3, 'Tuna Sashimi', 3.50, 'Thinly sliced raw tuna served with soy sauce and wasabi'),
(4, 'Shrimp Tempura Roll', 10.99, 'Shrimp tempura, avocado, cucumber rolled in seaweed and rice'),
(5, 'Vegetable Maki', 6.99, 'Assorted vegetables rolled in seaweed and rice');

INSERT INTO Recipe (sushi_id, ingredient_id) VALUES
(1, 1),  
(1, 2),
(1, 3),
(2, 4),
(3, 5),
(4, 6),
(4, 1),
(4, 3),
(5, 8);

    
INSERT INTO `Order` (order_id, sushi_id, customer_id, order_date, quantity) VALUES
(1, 1, 1, '2024-05-01', 2),
(2, 2, 2, '2024-05-02', 3),
(3, 3, 3, '2024-05-03', 1),
(4, 4, 4, '2024-05-04', 2), 
(5, 5, 5, '2024-05-05', 3); 




INSERT INTO Employee (employee_id, order_id, job, employee_name, salary, hiring_date) VALUES
(1, 1, 'Chef', 'Michael Johnson', 2500.00, '2023-01-15'),
(2, 2, 'Waiter', 'Emily Parker', 1800.00, '2023-03-20'),
(3, 3, 'Sushi Chef', 'David Lee', 2800.00, '2023-05-10'),
(4, 4, 'Cashier', 'Sarah Wilson', 2000.00, '2023-07-05'),
(5, 5, 'Manager', 'Alex Turner', 3500.00, '2023-09-15');


INSERT INTO Customer (customer_id, customer_name, address, phone_number) VALUES
(6, 'Laura Johnson', '345 Pine Street', '555-6789'),
(7, 'Mark Wilson', '678 Cedar Street', '555-2345'),
(8, 'Sarah Miller', '901 Oak Street', '555-7890');

INSERT INTO Ingredients (ingredient_id, ingredient_price, ingredient_name) VALUES
(9, 3.50, 'Eel'),
(10, 0.75, 'Seaweed'),
(11, 1.25, 'Rice vinegar');

INSERT INTO Sushi (sushi_id, sushi_name, sushi_price, sushi_description) VALUES
(6, 'Dragon Roll', 11.99, 'Eel, avocado, cucumber rolled in rice and seaweed'),
(7, 'Salmon Roll', 9.50, 'Fresh salmon rolled in rice and seaweed'),
(8, 'California Nigiri', 3.99, 'Crab meat and avocado on a bed of sushi rice');

INSERT INTO Recipe (sushi_id, ingredient_id) VALUES
(6, 9),
(6, 10),
(7, 4),
(7, 10),
(8, 2),
(8, 10);

INSERT INTO `Order` (order_id, sushi_id, customer_id, order_date, quantity) VALUES
(6, 6, 6, '2024-05-06', 2),
(7, 7, 7, '2024-05-07', 3),
(8, 8, 8, '2024-05-08', 1);

INSERT INTO Employee (employee_id, order_id, job, employee_name, salary, hiring_date) VALUES
(6, 6, 'Chef', 'Sophia Turner', 2600.00, '2023-02-15'),
(7, 7, 'Waiter', 'Daniel Brown', 1900.00, '2023-04-20'),
(8, 8, 'Sushi Chef', 'Olivia Johnson', 3000.00, '2023-06-10');


-- INSERT INTO `Order`
INSERT INTO `Order` (order_id, sushi_id, customer_id, order_date, quantity) VALUES
(9, 1, 2, '2024-05-09', 2), -- Jane Smith
(10, 3, 3, '2024-05-10', 2), -- Alice Johnson
(11, 2, 1, '2024-05-11', 1), -- John Doe
(12, 4, 4, '2024-05-12', 3), -- Bob Brown
(13, 5, 5, '2024-05-13', 2), -- Emma Davis
(14, 6, 2, '2024-05-14', 1), -- Jane Smith
(15, 7, 3, '2024-05-15', 3), -- Alice Johnson
(16, 8, 4, '2024-05-16', 1), -- Bob Brown
(17, 1, 5, '2024-05-17', 2); -- Emma Davis


SELECT * 
FROM Customer;

SELECT * 
FROM Ingredients;

SELECT * 
FROM Sushi;

SELECT * 
FROM Recipe;

SELECT * 
FROM `Order`;

SELECT * 
FROM Employee;


-- 1. Type of sushi being order
SELECT DISTINCT Sushi.sushi_name AS sushi_type 
FROM `Order`
JOIN Sushi ON `Order`.sushi_id = Sushi.sushi_id;


-- 2. Orders placed by the customers
SELECT 
    C.customer_name,
    COUNT(O.order_id) AS total_orders_placed
FROM 
    Customer C
LEFT JOIN 
    `Order` O ON C.customer_id = O.customer_id
GROUP BY 
    C.customer_name;


-- 3. Average quantity ordered per sushi
SELECT 
    S.sushi_name,
    AVG(O.quantity) AS average_quantity_ordered
FROM 
    `Order` O
JOIN 
    Sushi S ON O.sushi_id = S.sushi_id
GROUP BY 
    S.sushi_name;


-- 4. margin for each sushi
SELECT 
    S.sushi_name,
    (S.sushi_price - SUM(I.ingredient_price)) AS margin
FROM 
    Sushi S
JOIN 
    Recipe R ON S.sushi_id = R.sushi_id
JOIN 
    Ingredients I ON R.ingredient_id = I.ingredient_id
GROUP BY 
    S.sushi_id, S.sushi_name, S.sushi_price;


-- 5. Ingredients for each sushi
SELECT 
    S.sushi_name,
    GROUP_CONCAT(I.ingredient_name SEPARATOR ', ') AS ingredients
FROM 
    Sushi S
JOIN 
    Recipe R ON S.sushi_id = R.sushi_id
JOIN 
    Ingredients I ON R.ingredient_id = I.ingredient_id
GROUP BY 
    S.sushi_name;


-- 6. Percentage of the ingredients price in the final price
SELECT 
    S.sushi_name,
    (SUM(I.ingredient_price) / S.sushi_price) * 100 AS ingredient_cost_percentage
FROM 
    Sushi S
JOIN 
    Recipe R ON S.sushi_id = R.sushi_id
JOIN 
    Ingredients I ON R.ingredient_id = I.ingredient_id
GROUP BY 
    S.sushi_id, S.sushi_name, S.sushi_price;