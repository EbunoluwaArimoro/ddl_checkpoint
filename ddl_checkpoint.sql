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

-- SQL Query
-- Add Category column to Product table
ALTER TABLE Product ADD Category VARCHAR(20);

-- Add Order_date column to Orders table with default as today's date
ALTER TABLE Orders ADD Order_date DATETIME DEFAULT CURRENT_TIMESTAMP;
