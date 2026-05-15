# 🛒 Amazon Sales Analysis

A SQL-based analysis of Amazon India sales data (~128,000 orders) covering fashion categories — with insights on revenue, cancellations, geographic demand, and category performance. Results are summarised in Excel.

---

## 📌 Project Overview

This project analyses a real-world Amazon.in sales dataset to uncover trends in order volume, revenue by category, state-wise demand, and cancellation behaviour. The analysis is done entirely in SQL, with findings consolidated in an Excel summary.

---

## 🎯 Objectives

- Calculate total orders and revenue across the dataset
- Identify top-performing product categories by orders and revenue
- Analyse monthly sales and revenue trends
- Measure the overall cancellation rate
- Rank top 10 states by order volume and revenue
- Compare average order value across product categories

---

## 🗂️ Data Source

- **Dataset:** Amazon Sale Report (`Amazon_Sale_Report.csv`)
- **Records:** ~128,975 orders
- **Source:** Amazon India (Amazon.in) — fashion category sales
- **Currency:** INR

**Key Fields:**

| Field | Description |
|---|---|
| `Order ID` | Unique order identifier |
| `Date` | Order date (MM-DD-YY format) |
| `Status` | Order status (Shipped, Cancelled, Delivered, etc.) |
| `Category` | Product category (Kurta, Set, Western Dress, Top, etc.) |
| `Size` | Item size |
| `Amount` | Order value in INR |
| `Fulfilment` | Fulfilled by Amazon or Merchant |
| `ship-service-level` | Standard or Expedited shipping |
| `ship-state` | Delivery state |
| `B2B` | Whether the order is a business-to-business order |

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **MySQL** | Database creation, table design, all analysis queries |
| **Microsoft Excel** | Insight summary and presentation |

---

## 🗄️ Database Setup

```sql
CREATE DATABASE Amazon_sales;
USE Amazon_sales;

CREATE TABLE Amazon_sales_data (
    idx               VARCHAR(20),
    order_id          VARCHAR(50),
    date              VARCHAR(20),
    Status            VARCHAR(50),
    fulfilment        VARCHAR(50),
    Sales_Channel     VARCHAR(50),
    ship_service_level VARCHAR(50),
    Style             VARCHAR(50),
    SKU               VARCHAR(50),
    Category          VARCHAR(50),
    Item_Size         VARCHAR(50),
    ASIN              VARCHAR(50),
    Courier_Status    VARCHAR(50),
    Qty               VARCHAR(50),
    currency          VARCHAR(10),
    Amount            VARCHAR(50),
    ship_city         VARCHAR(50),
    ship_state        VARCHAR(50),
    ship_postal_code  VARCHAR(50),
    ship_country      VARCHAR(50),
    promotion_ids     VARCHAR(50),
    B2B               VARCHAR(50),
    fulfilled_by      VARCHAR(50)
);
```

---

## 🔍 SQL Queries & Analysis

### 1. Total Orders & Revenue
```sql
SELECT COUNT(*) AS total_orders FROM amazon_sales_data;

SELECT SUM(amount) AS total_revenue FROM amazon_sales_data;
```

### 2. Orders by Category
```sql
SELECT category, COUNT(*) AS total_orders
FROM amazon_sales_data
GROUP BY category
ORDER BY total_orders DESC;
```

### 3. Top 5 Categories by Revenue
```sql
SELECT category, SUM(amount) AS total_revenue
FROM amazon_sales_data
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 5;
```

### 4. Monthly Sales & Revenue Trend
```sql
SELECT SUBSTRING(date, 1, 2) AS month,
       SUM(amount) AS total_revenue,
       COUNT(*) AS total_orders
FROM amazon_sales_data
GROUP BY month
ORDER BY month;
```

### 5. Cancellation Rate
```sql
SELECT COUNT(*) AS total_orders,
       SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
       ROUND(SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS cancellation_rate
FROM amazon_sales_data;
```

### 6. Top 10 States by Orders & Revenue
```sql
SELECT ship_state, COUNT(*) AS total_orders, SUM(amount) AS total_revenue
FROM amazon_sales_data
GROUP BY ship_state
ORDER BY total_orders DESC
LIMIT 10;
```

### 7. Average Order Value by Category
```sql
SELECT category,
       COUNT(*) AS total_orders,
       ROUND(AVG(amount), 2) AS avg_order_value,
       SUM(amount) AS total_revenue
FROM amazon_sales_data
GROUP BY category
ORDER BY avg_order_value DESC;
```

---

## 💡 Key Insights

- **~128,975 orders** recorded across fashion categories on Amazon India
- **Kurta and Set** are the highest volume categories by order count
- **Maharashtra, Karnataka, and Telangana** are the top 3 states by order volume — reflecting urban fashion demand
- Order values range from ₹0 to ₹2,224, with a median around ₹568
- **Standard shipping** dominates over Expedited, indicating price-sensitive buyers
- Both **B2B and B2C** orders are present; majority are B2C (individual buyers)
- The dataset covers Amazon.in orders fulfilled by both Amazon and Merchant sellers

---


## 🔗 Back to Portfolio

[← View all projects](https://github.com/aashimasanduja72234-spec/Data-Analytics-portfolio)
