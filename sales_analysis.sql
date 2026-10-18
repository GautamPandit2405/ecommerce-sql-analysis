
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
