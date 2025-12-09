# 📈  Dashboard Mockups
Below are your BI dashboard mockups rewritten for the Online Order Tracking System.

---

## 1. 📊 Executive Financial Summary Dashboard
*Focus: Revenue Trends, Growth, and High-Level Metrics (Driven by LAG() query)*

| KPI | Value | Trend | Status |
| :--- | :--- | :--- | :--- |
| **Total Lifetime Revenue** | **RWF 145,500,000** | ▲ 12% YTD | **ON TRACK** |
| **Orders Processed** | 3,500 | ▲ 450 This Month | **HIGH VOLUME** |
| **Average Order Value (AOV)** | RWF 41,571 | ▼ -1.5% MoM | **ATTENTION** |

### Month-over-Month Revenue Growth
| Month | Monthly Revenue (RWF) | Previous Month Revenue (RWF) | MoM Growth (%) |
| :--- | :--- | :--- | :--- |
| **Dec 2025** | **18,500,000** | 15,200,000 | **+21.71%** |
| **Nov 2025** | 15,200,000 | 12,900,000 | +17.83% |
| **Oct 2025** | 12,900,000 | 14,100,000 | -8.51% |
| **Sep 2025** | 14,100,000 | 10,500,000 | +34.28% |

---

## 2. 📦 Product & Inventory Health Dashboard
*Focus: Sales Performance and Stocking Priorities (Driven by RANK() query)*

| KPI | Value | Status | Action |
| :--- | :--- | :--- | :--- |
| **Stock-Out Events (Last 30 Days)** | **4** | 🔴 **HIGH** | Review Safety Stock |
| **Total Inventory Value** | RWF 25,000,000 | Stable | N/A |
| **Low Stock Count (QTY < 10)** | 7 Products | 🟡 **MODERATE** | Reorder Required |

### Top 5 Bestsellers by Revenue
| Rank | Product Name | Category | Total Revenue (RWF) | Total Quantity Sold |
| :--- | :--- | :--- | :--- | :--- |
| **1** | **Laptop** | Electronics | **55,000,000** | 110 |
| **2** | **Smartphone** | Electronics | 42,000,000 | 140 |
| **3** | Coffee Grinder | Home Goods | 15,000,000 | 60 |
| **4** | Polo Shirt | Apparel | 8,500,000 | 250 |
| **5** | Backpack (Large) | Accessories | 6,200,000 | 85 |

---

## 3. 🔒 Audit & Security Compliance Dashboard
*Focus: Verification of Phase VII Triggers and Rules*

| Audit Metric | Value | Compliance | Status |
| :--- | :--- | :--- | :--- |
| **Security Rule Violations** | **3** | 100% Blocked | **SECURE** |
| **Audit Log Size** | 15,400 Entries | Normal | N/A |
| **Audit Logging Uptime** | 100% | Full Coverage | **CRITICAL** |

### Recent Trigger/Restriction Events
| Log Date | User Name | Action Type | Entity Name | Message |
| :--- | :--- | :--- | :--- | :--- |
| **2025-12-25** | SANDRINE | **DENIED** | ORDERS | INSERT blocked: Testing Holiday Restriction. |
| **2025-12-08** | SANDRINE | **DENIED** | CUSTOMERS | DML attempted on restricted day (STATEMENT BLOCKED). |
| **2025-12-07** | SANDRINE | **ALLOWED** | ORDERS | INSERT allowed: DML executed during weekend/permitted time. |
| **2025-12-07** | SYSTEM | EXECUTE | CUSTOMERS | UPDATED by SANDRINE. Old Email: old@mail.com. |
