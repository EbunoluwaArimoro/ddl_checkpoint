-- DATA DEFINITION LANGUAGE (DDL) CHECKPOINT
DROP DATABASE IF EXISTS ddl_checkpoint;
CREATE DATABASE ddl_checkpoint;
USE ddl_checkpoint;

-- 1. Product Table
CREATE TABLE Product (
    Product_id VARCHAR(20) PRIMARY KEY,
    Product_name VARCHAR(20) NOT NULL,
    Price DECIMAL(10,2) CHECK (Price > 0)
);

-- 2. Customer Table
CREATE TABLE Customer (
    Customer_id VARCHAR(20) PRIMARY KEY,
    Customer_name VARCHAR(20) NOT NULL,
    Customer_Tel BIGINT NOT NULL
);

-- 3. Orders Table
CREATE TABLE Orders (
    Customer_id VARCHAR(20),
    Product_id VARCHAR(20),
    Quantity INT,
    Total_amount DECIMAL(10,2),
    CONSTRAINT fk_customer FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id),
    CONSTRAINT fk_product FOREIGN KEY (Product_id) REFERENCES Product(Product_id)
);

-- Insert into Product
INSERT INTO Product (Product_id, Product_name, Price) VALUES
('P001', 'Laptop', 1200),
('P002', 'Smartphone', 800),
('P003', 'Headphones', 150),
('P004', 'Tablet', 300),
('P005', 'Smartwatch', 200),
('P006', 'Monitor', 400),
('P007', 'Keyboard', 50),
('P008', 'Mouse', 30),
('P009', 'Printer', 250),
('P010', 'Speaker', 100);

-- Insert into Customer
INSERT INTO Customer (Customer_id, Customer_name, Customer_Tel) VALUES
('C001', 'John Doe', 1234567890),
('C002', 'Jane Smith', 9876543210),
('C003', 'Alice Johnson', 1122334455),
('C004', 'Bob Brown', 5566778899),
('C005', 'Charlie White', 9988776655),
('C006', 'Diana Prince', 1231231234),
('C007', 'Bruce Wayne', 4564564567),
('C008', 'Clark Kent', 7897897890),
('C009', 'Peter Parker', 3213213210),
('C010', 'Tony Stark', 6546546543),
('C011', 'Natasha Romanoff', 1112223333),
('C012', 'Steve Rogers', 4445556666),
('C013', 'Wanda Maximoff', 7778889999),
('C014', 'Thor Odinson', 111222333),
('C015', 'Loki Laufeyson', 3334445555),
('C016', 'Gamora Titan', 6667778888),
('C017', 'Rocket Raccoon', 9990001111),
('C018', 'Groot', 2223334444),
('C019', 'Drax', 5556667777),
('C020', 'Star-Lord', 8889990000);

-- Insert into Orders
INSERT INTO Orders (Customer_id, Product_id, Quantity, Total_amount) VALUES
('C001', 'P001', 1, 1200),
('C002', 'P002', 2, 1600),
('C003', 'P003', 3, 450),
('C004', 'P004', 1, 300),
('C005', 'P005', 2, 400),
('C006', 'P006', 1, 400),
('C007', 'P007', 5, 250),
('C008', 'P008', 10, 300),
('C009', 'P009', 1, 250),
('C010', 'P010', 4, 400);

-- SQL Query
-- Add Category column to Product table
ALTER TABLE Product ADD Category VARCHAR(20);

-- Add Order_date column to Orders table with default as today's date
ALTER TABLE Orders ADD Order_date DATETIME DEFAULT CURRENT_TIMESTAMP;
