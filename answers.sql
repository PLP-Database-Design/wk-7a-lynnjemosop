Question 1
-- Drop table if it exists to avoid conflicts
DROP TABLE IF EXISTS ProductDetail;

-- Create 1NF-compliant ProductDetail table
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Insert atomic (1NF-compliant) data
INSERT INTO ProductDetail(OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');


Question 2

-- Drop tables if they exist to avoid conflicts
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS orders;

-- Create orders table (no partial dependency)
CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert data into orders table
INSERT INTO orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Create product table with foreign key to orders
CREATE TABLE product (
    product_id INT PRIMARY KEY,
    productName VARCHAR(100),
    quantity INT,
    order_id INT,
    FOREIGN KEY (order_id) REFERENCES orders(OrderID)
);

-- Insert data into product table (2NF-compliant)
INSERT INTO product(product_id, productName, quantity, order_id)
VALUES 
(1, 'Laptop', 2, 101),
(2, 'Mouse', 1, 101),
(3, 'Tablet', 3, 102),
(4, 'Keyboard', 1, 102),  -- Corrected quantity to 1
(5, 'Mouse', 2, 102),
(6, 'Phone', 1, 103);
