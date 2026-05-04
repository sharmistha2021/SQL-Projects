# 🛒 UrbanCart Retail Analytics

> SQL-based business intelligence analysis on transactional retail data using PostgreSQL and Jupyter Notebook.

---

## 📌 Project Overview

**UrbanCart** is a growing online retail shop operating across multiple cities in Bangladesh. This project analyzes UrbanCart's transactional data to generate actionable insights that support:

- 📈 Revenue growth strategy
- 🛍️ Product bundling & recommendations
- 👤 Customer behavior understanding
- 📦 Inventory & payment optimization

---

## 🗂️ Repository Structure

```
urbancart-retail-analytics/
│
├── SQL_ANAlysis.ipynb       # Main analysis notebook (25 business questions)
├── README.md                # Project documentation
│
└── data/                    # Source CSV files (loaded into PostgreSQL)
    ├── FactOrders.csv
    ├── FactOrderItems.csv
    ├── FactPayment.csv
    ├── DimCustomers.csv
    └── DimProducts.csv
```

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| **PostgreSQL** | Database & SQL queries |
| **Jupyter Notebook** | Analysis environment |
| **ipython-sql** | Run SQL directly in notebook cells |
| **SQLAlchemy** | Database connection |
| **Pandas** | Data handling & DataFrame output |
| **Matplotlib** | Data visualizations |

---

## 🗄️ Database Schema

The database follows a **Star Schema** design:

```
DimCustomers ─────┐
                  ├──── FactOrders ────┬──── FactOrderItems ──── DimProducts
DimProducts  ─────┘                   │
                                      └──── FactPayment
```

| Table | Description |
|-------|-------------|
| `FactOrders` | All customer orders with status and date |
| `FactOrderItems` | Individual items within each order |
| `FactPayment` | Payment method per order |
| `DimCustomers` | Customer details (city, gender, email, signup date) |
| `DimProducts` | Product details (category, price, stock) |

---

## 📊 Analysis — 25 Business Questions

### 📦 Order Overview
- Q1 · Total orders received
- Q4 · Monthly order trend over time

### 🏙️ City & Revenue Analysis
- Q2 · Cities by orders & revenue
- Q6 · Total revenue generated
- Q7 · Revenue by product category
- Q8 · Top revenue-generating products

### 👥 Customer Analysis
- Q3 · Gmail usage among customers
- Q9 · Average Order Value (AOV) & Basket Size
- Q11 · Highest revenue customers
- Q12 · Cancellation rate by city & customer
- Q13 · Purchasing patterns by gender
- Q14 · Customer behavior since account creation
- Q15 · Customers who ordered in October but not December
- Q16 · Customers who ordered in both October & December

### 📦 Inventory
- Q10 · Products at risk of stock-out

### 💳 Payment Analysis
- Q17 · Most used payment methods
- Q18 · Payment method vs order status
- Q19 · City-wise payment preferences
- Q20 · High-value orders & payment methods
- Q21 · Average items per order by payment method

### 🏷️ Pricing
- Q22 · Product price vs category average

### 🤝 Product Bundling
- Q23 · Most frequently purchased product pairs
- Q24 · Highest revenue product pairs

### 📅 Reporting
- Q25 · Daily operations report

---

## 💡 Key Insights

| # | Finding |
|---|---------|
| 1 | 🏙️ **Barishal** leads in both total orders and revenue |
| 2 | 👗 **Fashion & Grocery** are the top revenue-generating categories |
| 3 | 🔋 **Power Bank 10000mAh** is the single highest revenue product |
| 4 | ⚠️ Several products face **stock-out risk** with high sales & low inventory |
| 5 | 💳 **Cash on Delivery (COD)** dominates payments; bKash leads in Dhaka |
| 6 | 👑 VIP customers should be targeted with **loyalty programs** |
| 7 | 🤝 **Powerbank + Earphone** is the highest revenue product bundle |
| 8 | 🗓️ October-only customers need **December win-back campaigns** |

---

## ⚙️ How to Run

### 1. Clone the repository
```bash
git clone https://github.com/your-username/urbancart-retail-analytics.git
cd urbancart-retail-analytics
```

### 2. Set up PostgreSQL database
```sql
CREATE DATABASE RetailAnalysis;
```

### 3. Install dependencies
```bash
pip install pandas sqlalchemy psycopg2 ipython-sql matplotlib jupyter
```

### 4. Load data into PostgreSQL

Run the data loading cells at the top of `SQL_ANAlysis.ipynb` — they will upload all CSV files into the database automatically.

### 5. Update your credentials

In the notebook, update these lines with your own PostgreSQL credentials:
```python
db_user     = "your_username"
db_password = "your_password"
db_host     = "localhost"
db_port     = "5432"
db_name     = "RetailAnalysis"
```

### 6. Run the notebook
```bash
jupyter notebook SQL_ANAlysis.ipynb
```

---

> *"Without data, you're just another person with an opinion."* — W. Edwards Deming
