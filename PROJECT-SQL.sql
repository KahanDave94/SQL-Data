
CREATE TABLE transactions_new (
customer_id INT,
transaction_date DATE,
product_category VARCHAR(50),
revenue DECIMAL(10,2)
);


INSERT INTO transactions_new VALUES
(101, '2025-01-05', 'Electronics', 200),
(101, '2025-01-10', 'Clothing', 150),
(101, '2025-01-15', 'Groceries', 100),

(102, '2025-01-07', 'Electronics', 300),
(102, '2025-01-12', 'Electronics', 200),
(102, '2025-01-20', 'Clothing', 100),

(103, '2025-01-08', 'Electronics', 400),
(103, '2025-01-18', 'Clothing', 250),
(103, '2025-01-25', 'Groceries', 200),

(104, '2025-01-09', 'Groceries', 50),

(101, '2025-02-05', 'Electronics', 300),
(101, '2025-02-10', 'Clothing', 200),
(101, '2025-02-15', 'Groceries', 150),

(102, '2025-02-07', 'Electronics', 500),
(102, '2025-02-12', 'Clothing', 300),
(102, '2025-02-20', 'Groceries', 200),

(103, '2025-02-08', 'Electronics', 100);



QUESTION 1 Find users active for 3 consecutive days.
ANSWER-

WITH ranked_dates AS 
(SELECT customer_id, transaction_date, 
ROW_NUMBER() OVER (PARTITION BY customer_id
ORDER BY transaction_date
) AS rn
FROM transactions_new
GROUP BY customer_id, transaction_date
),
grouped_dates AS (SELECT customer_id, transaction_date,
DATE_SUB(transaction_date, INTERVAL rn DAY) AS grp
FROM ranked_dates)
SELECT customer_id
FROM grouped_dates
GROUP BY customer_id, grp
HAVING COUNT(*) >= 3;


QUESTION Top 3 customers by revenue per month
ANSWER-

SELECT customer_id, month, total_revenue, rnk
FROM (SELECT customer_id, DATE_FORMAT(transaction_date,'%b-%y') AS month,
SUM(revenue) AS total_revenue,
RANK() OVER (PARTITION BY DATE_FORMAT(transaction_date,'%b-%y')
ORDER BY SUM(revenue) DESC) AS rnk
FROM transactions_new
WHERE customer_id IN (
SELECT customer_id
FROM transactions_new
GROUP BY customer_id
HAVING COUNT(DISTINCT product_category) >= 3)
GROUP BY customer_id, month) t
WHERE rnk <= 3;


QUESTION Your query is slow. What will you check?

If my SQL query is slow, I would first check the execution plan using EXPLAIN to identify bottlenecks. 
Then I would verify proper indexing on columns used in WHERE, JOIN, and GROUP BY. I would avoid using SELECT * and 
apply filters early to reduce data scanning. I would also review joins and aggregations to ensure they are optimized
and not causing full table scans




