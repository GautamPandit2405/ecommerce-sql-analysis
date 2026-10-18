
CREATE TABLE sales (
    product VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2)
);

INSERT INTO sales VALUES
('Laptop', 2, 50000),
('Mouse', 10, 500),
('Keyboard', 5, 1500),
('Monitor', 3, 12000),
('Laptop', 1, 50000);

SELECT
    product,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC;
SELECT SUM(quantity * price) AS total_revenue
FROM sales;
SELECT
    product,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY product
ORDER BY total_quantity DESC;
SELECT
    product,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY product
HAVING SUM(quantity * price) > 20000
ORDER BY total_revenue DESC;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2)
);

INSERT INTO customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Priya', 'Mumbai'),
(3, 'Rahul', 'Bengaluru'),
(4, 'Neha', 'Delhi');

INSERT INTO orders VALUES
(101, 1, 'Laptop', 1, 50000),
(102, 2, 'Mouse', 2, 500),
(103, 1, 'Keyboard', 1, 1500),
(104, 3, 'Monitor', 2, 12000),
(105, 4, 'Laptop', 1, 50000);

SELECT
    c.customer_name,
    c.city,
    o.product,
    o.quantity,
    o.price,
    o.quantity * o.price AS revenue
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id;
    
SELECT
    c.customer_name,
    SUM(o.quantity * o.price) AS total_revenue
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_revenue DESC;
