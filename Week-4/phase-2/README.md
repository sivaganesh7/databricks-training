# 📊 Week 4 – Phase 2: SQL & PySpark Data Analysis

A mini data engineering project that performs customer and sales analysis using **SQL** and **PySpark**. The project demonstrates how common analytical queries can be implemented using both SQL and Spark DataFrame APIs to generate meaningful business insights.

---

## 🛠️ Tech Stack

| Technology | Purpose |
|------------|---------|
| 🐍 Python | Programming Language |
| ⚡ Apache Spark (PySpark) | Distributed Data Processing |
| 🗄️ SQL | Data Analysis |
| 📄 CSV | Input Dataset |

---

## 📁 Project Structure

```text
├── etl_pipeline.py          # PySpark implementation
├── queries.sql              # SQL queries
├── README.md                # Project documentation
└── screenshots/
    ├── average_order_amount.png
    ├── city_wise_total_revenue.png
    ├── customer_total_spend.png
    ├── customers_sorted_by_total_spend.png
    ├── customers_with_more_than_one_order.png
    ├── customers_with_no_orders.png
    └── top_3_customers.png
```

---

## 📂 Dataset

### 👥 `customers.csv`

Contains customer information.

| Column |
|--------|
| customer_id |
| first_name |
| last_name |
| email |
| city |
| state |

### 💰 `sales.csv`

Contains sales transaction details.

| Column |
|--------|
| sale_id |
| customer_id |
| product_id |
| sale_date |
| quantity |
| total_amount |

---

## 🎯 Project Objectives

- 📊 Analyze customer purchasing behavior.
- 🔄 Compare SQL queries with equivalent PySpark DataFrame operations.
- 📈 Perform aggregations, joins, filtering, and sorting.
- ⚡ Practice ETL transformations using structured datasets.

---

## 📈 Analysis Performed

| Task | Description |
|------|-------------|
| ✅ Task 1 | Calculate total order amount for each customer |
| ✅ Task 2 | Find the top 3 customers by total spending |
| ✅ Task 3 | Identify customers with no orders |
| ✅ Task 4 | Calculate city-wise total revenue |
| ✅ Task 5 | Compute average order amount per customer |
| ✅ Task 6 | Find customers with more than one order |
| ✅ Task 7 | Sort customers by total spending |

---

## 🔄 ETL Workflow

```text
Load CSV Files
        │
        ▼
Clean Missing Values
        │
        ▼
Convert Data Types
        │
        ▼
Perform SQL & PySpark Analysis
        │
        ▼
Generate Business Insights
```

---

## ▶️ Running the Project

### Clone the Repository

```bash
git clone https://github.com/your-username/Week4.git
```

### Navigate to Phase 2

```bash
cd phase-2
```

### Run the PySpark Script

```bash
spark-submit etl_pipeline.py
```

or

```bash
python etl_pipeline.py
```

> **Note:** Ensure **PySpark** is installed and configured before running the project.

---

## 📷 Output Screenshots

The `screenshots/` folder contains outputs for all analytical tasks.

- 💰 Customer Total Spend
- 🏆 Top 3 Customers by Total Spend
- 🚫 Customers With No Orders
- 🌆 City-wise Total Revenue
- 📊 Average Order Amount per Customer
- 👥 Customers With More Than One Order
- 📈 Customers Sorted by Total Spend

---

## 🎯 Learning Outcomes

Through this project, I gained hands-on experience with:

- SQL Aggregations
- GROUP BY & HAVING
- JOIN Operations
- Sorting & Ranking
- Spark DataFrame API
- SQL to PySpark Translation
- Data Cleaning & Type Casting
- ETL Pipeline Development
- Business Data Analysis

---

## 👩‍💻 Author

**CHINTAKULA DURGA SRUJANA**

🎓 B.Tech – Computer Science Engineering

**Skills:** SQL • Python • PySpark • Apache Spark • Data Engineering
