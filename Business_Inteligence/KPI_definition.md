# 📊 Key Performance Indicators (KPIs) – Online Order Tracking System

This document defines the Key Performance Indicators (KPIs) used for analyzing performance, customer behavior, product trends, delivery efficiency, and overall system health for the Online Order Tracking System.

---

### 1. Sales & Customer KPIs

| KPI | Formula | Target | Frequency |
| :--- | :--- | :--- | :--- |
| **Order Conversion Rate** | (Successful orders / Orders initiated) × 100 | > 65% | Monthly |
| **Customer Retention Rate** | (Returning customers / Total customers) × 100 | > 40% | Quarterly |
| **Average Order Value (AOV)** | Total revenue / Number of orders | Increasing | Monthly |
| **Cart Abandonment Rate** | (Unpaid orders / Orders created) × 100 | < 15% | Monthly |
| **Customer Satisfaction Score** | From customer feedback | > 4/5 | Quarterly |

---

### 2. Product & Inventory KPIs

| KPI | Formula | Target | Frequency |
| :--- | :--- | :--- | :--- |
| **Top-Selling Product** | Highest total quantity sold | — | Monthly |
| **Product Return Rate** | (Returned items / Sold items) × 100 | < 5% | Monthly |
| **Stock Availability** | (Products in stock / Total products) × 100 | > 95% | Weekly |
| **Low-Stock Items** | Products with quantity < threshold | None | Weekly |

---

### 3. Order Processing KPIs

| KPI | Formula | Target | Frequency |
| :--- | :--- | :--- | :--- |
| **Order Processing Time** | Time from order creation → confirmation | < 10 min | Daily |
| **Order Fulfillment Time** | Time from order confirmation → delivery | < 48 hrs | Weekly |
| **Payment Success Rate** | (Successful payments / Total payments) × 100 | > 98% | Monthly |
| **Order Error Rate** | (Failed orders / Total orders) × 100 | < 1% | Monthly |

---

### 4. Delivery & Logistics KPIs

| KPI | Formula | Target | Frequency |
| :--- | :--- | :--- | :--- |
| **On-Time Delivery Rate** | (Deliveries on time / Total deliveries) × 100 | > 90% | Monthly |
| **Failed Delivery Rate** | (Failed deliveries / Total deliveries) × 100 | < 3% | Monthly |
| **Average Delivery Time** | AVG(delivery_date – order_date) | < 2 days | Weekly |

---

### 5. System & Performance KPIs

| KPI | Description | Target | Frequency |
| :--- | :--- | :--- | :--- |
| **System Uptime** | % time system is available | > 99% | Monthly |
| **Database Response Time** | Average SQL execution time | < 1 sec | Daily |
| **Error Log Rate** | Logged errors per day | < 3 | Daily |
| **Resource Usage** | CPU, memory, tablespace | Stable | Weekly |

---

### 6. Compliance KPIs

| KPI | Description | Target | Frequency |
| :--- | :--- | :--- | :--- |
| **Payment Audit Compliance** | % of payment operations logged | 100% | Monthly |
| **Data Integrity** | FK/PK violations | 0 | Daily |
| **Security Violations** | Unauthorized access attempts | 0 | Monthly |
