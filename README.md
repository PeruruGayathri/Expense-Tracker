# 💰 Expense Tracker (Excel + SQL)

This project demonstrates how to build a **Personal Budget & Expense Tracker** in **Excel**, and then extend it using **SQL** to showcase database and querying skills.

---

## 📊 Excel Project

### Features
- **Data Entry Table** (`tblExpenses`) with:
  - Date
  - Category
  - Description
  - Amount
  - Type (Income/Expense)
- **Dashboard** with:
  - Total Income
  - Total Expenses
  - Savings
  - Savings %
- **Visuals**:
  - Pie Chart → Expenses by Category
  - PivotChart → Monthly Expenses
- **Other Skills**:
  - Excel Tables
  - Data Validation (drop-downs)
  - SUMIFS for category totals
  - PivotTables for trends
  - Conditional Formatting

---

## 🗄️ SQL Project

### Database Design
- **Tables**:
  - `categories` → stores categories (Food, Rent, Transport, etc.)
  - `types` → stores Income / Expense
  - `transactions` → stores each transaction with date, description, amount

### Key Queries
- Total Income, Total Expenses, Savings
- Savings % (calculated dynamically)
- Expenses by Category (including categories with **0 spending**)
- Monthly Expenses Trend (grouped by `YYYY-MM`)

### Skills Demonstrated
- SQL Joins
- Aggregations (`SUM`, `GROUP BY`)
- Conditional sums with `CASE`
- Substring for monthly grouping
- `LEFT JOIN` + `COALESCE` to handle missing data

---

## 🚀 How to Use

1. **Excel Version**
   - Open `ExpenseTracker.xlsx`
   - Add new transactions in the table
   - Dashboard and charts update automatically
   - Refresh PivotTable for monthly updates

2. **SQL Version**
   - Open `expense_tracker.sql` in an SQL environment (SQLite / MySQL / PostgreSQL)
   - Run the script to create tables and insert sample data
   - Execute queries for insights

---

## 🎯 Purpose

- Practice **Excel skills** (dashboards, charts, formulas, PivotTables)  
- Practice **SQL skills** (database design, joins, queries)  
- Show recruiters a **realistic project** that connects Excel + SQL  

---

## 📌 Example Outputs

- **Excel Dashboard** → Income = 500, Expenses = 282, Savings = 218, Savings % = 43.6%  
- **SQL Query** → Returns the same results, but via database queries.

---
