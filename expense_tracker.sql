DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS types;

-- Categories table
CREATE TABLE categories (
  category_id INTEGER PRIMARY KEY,
  category_name TEXT NOT NULL
);

-- Types table
CREATE TABLE types (
  type_id INTEGER PRIMARY KEY,
  type_name TEXT NOT NULL
);

-- Transactions table
CREATE TABLE transactions (
  transaction_id INTEGER PRIMARY KEY,
  txn_date TEXT NOT NULL,       
  category_id INTEGER,
  description TEXT,
  amount REAL NOT NULL,
  type_id INTEGER
);

-- Insert categories
INSERT INTO categories (category_id, category_name) VALUES
(1,'Food'),
(2,'Transport'),
(3,'Rent'),
(4,'Utilities'),
(5,'Entertainment'),
(6,'Education'),
(7,'Misc'),
(8,'Salary');

-- Insert types
INSERT INTO types (type_id, type_name) VALUES
(1,'income'),
(2,'expense');

-- Insert sample transactions
INSERT INTO transactions (transaction_id, txn_date, category_id, description, amount, type_id) VALUES
(1,'2025-09-01',8,'Sept salary',500,1),
(2,'2025-09-02',1,'Pizza',15,2),
(3,'2025-09-04',2,'Bus ticket',5,2),
(4,'2025-09-05',3,'Apartment',200,2),
(5,'2025-09-10',5,'Movie ticket',12,2),
(6,'2025-09-12',6,'Course fee',50,2);

-- View all transactions
SELECT * FROM transactions;

-- Total Income, Expenses, Savings
SELECT
  SUM(CASE WHEN t.type_name='income'  THEN tr.amount ELSE 0 END) AS total_income,
  SUM(CASE WHEN t.type_name='expense' THEN tr.amount ELSE 0 END) AS total_expenses,
  SUM(CASE WHEN t.type_name='income'  THEN tr.amount ELSE 0 END) -
  SUM(CASE WHEN t.type_name='expense' THEN tr.amount ELSE 0 END) AS savings
FROM transactions tr
JOIN types t ON tr.type_id = t.type_id;

SELECT
  SUM(CASE WHEN t.type_name='income'  THEN tr.amount ELSE 0 END) AS total_income,
  SUM(CASE WHEN t.type_name='expense' THEN tr.amount ELSE 0 END) AS total_expenses,
  ROUND(
    (
      (SUM(CASE WHEN t.type_name='income'  THEN tr.amount ELSE 0 END) -
       SUM(CASE WHEN t.type_name='expense' THEN tr.amount ELSE 0 END)
      ) * 100.0 / 
      SUM(CASE WHEN t.type_name='income'  THEN tr.amount ELSE 0 END)
    ), 2
  ) AS savings_percentage
FROM transactions tr
JOIN types t ON tr.type_id = t.type_id;

SELECT c.category_name,
       SUM(tr.amount) AS total_spent
FROM transactions tr
JOIN categories c ON tr.category_id = c.category_id
JOIN types t ON tr.type_id = t.type_id
WHERE t.type_name = 'expense'
GROUP BY c.category_name
ORDER BY total_spent DESC;

SELECT c.category_name,
       COALESCE(SUM(tr.amount),0) AS total_spent
FROM categories c
LEFT JOIN transactions tr ON tr.category_id = c.category_id
LEFT JOIN types t ON tr.type_id = t.type_id AND t.type_name = 'expense'
GROUP BY c.category_name
ORDER BY total_spent DESC;

SELECT substr(txn_date, 1, 7) AS month,
       SUM(amount) AS total_expense
FROM transactions
WHERE type_id = 2
GROUP BY month
ORDER BY month;
