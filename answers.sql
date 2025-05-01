Question 1
SELECT 
    OrderID,
    CustomerName,
    TRIM(product) AS Product
FROM ProductDetail,
JSON_TABLE(
    CONCAT('["', REPLACE(Products, ',', '","'), '"]'),
    '$[*]' COLUMNS (product VARCHAR(255) PATH '$')
) AS jt;

Question 2
INSERT INTO OrderDetailsNew (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
