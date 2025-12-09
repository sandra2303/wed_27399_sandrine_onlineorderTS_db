# 📊 Business Intelligence Requirements – Online Order Tracking System

---

### 1. Stakeholders

* **Executive Management:** Needs business insights, revenue trends, and performance KPIs.
* **Sales & Marketing Team:** Needs product performance, customer behavior, and order statistics.
* **Operations / Logistics Team:** Needs delivery tracking, courier performance, and delay alerts.
* **System Administrator:** Needs system usage reports, error logs, and performance metrics.
* **Customers (optional future BI):** View purchase history and delivery status.

---

### 2. Decision Support Needs

#### A. For Management
* Monitor monthly sales, profitability, and product performance.
* Identify top-selling products and low-performing items.
* Forecast future demand using trends.

#### B. For Sales/Marketing
* Analyze customer purchase patterns.
* Track repeat customers vs new buyers.
* Identify seasonal sales spikes.

#### C. For Operations (Delivery Team)
* Track delivery time performance.
* Monitor courier efficiency.
* Identify delayed or failed deliveries.
* Optimize delivery routes (future BI expansion).

#### D. For Technical/System Admin
* Monitor system usage patterns.
* View DML audit logs.
* Detect failures or slow operations.

---

### 3. Reporting Frequency

| Frequency | Reports Covered |
| :--- | :--- |
| **Daily Reports** | New orders placed, Orders awaiting delivery, Delivered vs pending orders, Payment confirmations. |
| **Weekly Reports** | Delivery performance summary, Top products of the week, Number of cancelled or returned orders. |
| **Monthly Reports** | Sales analytics, Revenue per product category, Customer order frequency, Payment method usage. |
| **Quarterly Reports** | Trend charts for revenue, customers, products, Long-term performance forecasts, Strategic planning insights. |

---

### 4. Data Sources

| Table Name | Data Contained |
| :--- | :--- |
| **CUSTOMERS** | Demographics, contact information. |
| **PRODUCTS** | Price, availability, category. |
| **ORDERS** | Order dates, status, total amounts. |
| **ORDER_ITEMS** | Quantity ordered, product subtotals. |
| **PAYMENT** | Payment amounts, methods, date. |
| **DELIVERY** | Courier used, delivery date, status. |
| **Audit & Logs** | Tracked through PL/SQL triggers (optional). |

---

### 5. BI Outputs (Dashboards & KPIs)
* Total orders placed
* Daily revenue
* Conversion rate (orders vs cancellations)
* Top 10 best-selling products
* Total deliveries completed
* Average delivery time
* Payment method distribution (Momo, Cash, Card)

---

### 6. BI Tools Recommended
* Excel / Power BI (simple version for students)
* Oracle SQL Developer reports
* Tableau (optional)
* Python/SQL visualizations (optional future work)