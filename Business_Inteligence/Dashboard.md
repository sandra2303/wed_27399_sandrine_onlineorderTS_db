# 📈  Dashboard Mockups
Below are your BI dashboard mockups rewritten for the Online Order Tracking System.

---

## Dashboard 1: Executive Summary

### 🎯 Key Performance Indicators (KPIs)
| KPI | Value | Change |
| :--- | :--- | :--- |
| **Total Orders (Month)** | 1,250 | ▲ 8% |
| **Total Revenue** | $185,000 | ▲ 6.1% |
| **Delivery Success Rate** | 94% | ▲ 2% |
| **Refund/Failed Orders** | 3% | ▼ 1% |

### 📈 Trend Analysis – Orders per Month
| Month | Orders |
| :--- | :--- |
| Jan | 980 |
| Feb | 1,020 |
| Mar | 1,150 |
| Apr | 1,200 |
| May | 1,250 |

> ↗ 12% growth in last quarter

### 📊 Product Category Performance
| Category | Sales | Visual |
| :--- | :--- | :--- |
| Electronics | 45% | ████████████████████ |
| Clothing | 30% | ██████████████▌ |
| Home Appliances | 15% | ████████▌ |
| Accessories | 10% | ██████ |

### 🔴 Critical Alerts
* 42 orders delayed beyond expected delivery time
* 15 products low in stock
* 8 orders failed payment verification
* 2 couriers with frequent delays

---

## Dashboard 2: Audit & Compliance Dashboard

### 🔐 Compliance Summary
| Metric | Value | Notes |
| :--- | :--- | :--- |
| **Total Operations** | 3,800 | Includes all DML actions |
| **Successful Transactions** | 3,720 | (98%) |
| **Payment Errors** | 45 | (1.2%) |
| **Delivery Failures** | 35 | (0.8%) |

### ⚠️ Common Issues
| Issue Type | Count | Percentage |
| :--- | :--- | :--- |
| Payment Gateway Errors | 45 | 56% |
| Delivery Failures | 35 | 44% |
| Data Entry Issues | 0 | 0% |

### 👥 Top System Users (Admin + Couriers)
| User | Operations | Visual |
| :--- | :--- | :--- |
| ADMIN | 850 | ███████████████████████ |
| COURIER_01 | 600 | ███████████████████ |
| COURIER_02 | 550 | ██████████████████▌ |
| SALES_AGENT_01 | 420 | ███████████████ |
| OTHERS | 300 | ██████████ |

### 📅 Recent Issues (Last 7 Days)
| Date | User | Issue |
| :--- | :--- | :--- |
| 07/12 | COURIER_01 | Delivery delay |
| 06/12 | ADMIN | Payment rollback |
| 05/12 | COURIER_03 | Misrouted package |
| 04/12 | SALES_AGENT_02 | Incorrect item quantity |

---

## Dashboard 3: Performance & Resource Dashboard

### ⚡ System Performance
| Metric | Value | Status |
| :--- | :--- | :--- |
| **DB Response Time** | 0.9s | Good |
| **CPU Utilization** | 40% | Normal |
| **Memory Usage** | 70% | Slightly high |
| **Active Sessions** | 22 | Normal |

### 📈 Resource Trends – Active Orders
| Day | Active Orders | Visual |
| :--- | :--- | :--- |
| Mon | 180 | █████████████████ |
| Tue | 190 | ██████████████████ |
| Wed | 200 | ███████████████████ |
| Thu | 185 | █████████████████▌ |
| Fri | 175 | ████████████████▌ |
| Sat | 160 | ███████████████ |
| Sun | 150 | ██████████████ |

### 🏃 Procedure Performance
| Procedure | Execution Time | Visual |
| :--- | :--- | :--- |
| `process_order_payment` | 0.8s | ██████████████ |
| `assign_delivery_courier` | 1.1s | █████████████████ |
| `generate_sales_report` | 2.0s | █████████████████████ |
| `update_stock_levels` | 1.4s | ██████████████████ |

### 💾 Storage Utilization
| Table | Rows | Size | Growth |
| :--- | :--- | :--- | :--- |
| ORDERS | 2,500 | 20 MB | ▲ 10% |
| ORDER_ITEMS | 6,000 | 45 MB | ▲ 12% |
| PAYMENT | 2,500 | 15 MB | ▲ 8% |
| DELIVERY | 2,500 | 30 MB | ▲ 15% |
| CUSTOMERS | 1,000 | 12 MB | ▲ 6% |

### 🔔 Performance Alerts
* `generate_sales_report` approaching threshold
* DELIVERY table growing fast → recommend archiving completed deliveries
* Increase memory allocation for peak hours