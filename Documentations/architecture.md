# ✅ SYSTEM ARCHITECTURE DOCUMENT
## Online Order Tracking System

### 1. Overview
The **Online Order Tracking System (OOTS)** is designed to manage online purchases, payment processing, and delivery tracking for customers.

It uses a structured **Oracle architecture** with clear separation between:
* **Presentation Layer** (UI, user interaction)
* **Application / Logic Layer** (PL/SQL business logic)
* **Data Layer** (Oracle tables storing transactional data)

This modular design ensures reliability, scalability, and performance.

---

### 2. Architectural Layers

#### 2.1 Presentation Layer
This is the user-facing part of the system.
* **Tools / Interfaces:** Oracle SQL Developer (admin), Web dashboard/UI, Customer interface (future)
* **Responsibilities:** Viewing products, placing customer orders, checking order status, admin operations, delivery staff updates.

#### 2.2 Application / Logic Layer (PL/SQL)
This layer contains all **business rules** and automated processes.
* **Core Responsibilities:** Validate inserted data, process orders and items, recalculate totals, ensure valid payments, update delivery info, handle errors.
* **Components:** Procedures (`insert_order`, `update_delivery_status`), Functions (`calculate_order_total`), Packages (`ORDER_MANAGEMENT`), Triggers.

#### 2.3 Data Layer (Oracle Database)
The database stores all operational information securely.
* **Main Tables:**
    * `CUSTOMERS`: Customer details
    * `PRODUCTS`: Product catalog
    * `ORDERS`: Order headers
    * `ORDER_ITEMS`: Individual items within an order
    * `PAYMENT`: Payments for orders
    * `DELIVERY`: Courier and delivery status tracking
* **Constraints Used:** Primary Keys (PK), Foreign Keys (FK), NOT NULL, CHECK, UNIQUE.

---

### 3. System Workflow Architecture
* **Workflow Steps:** Customer selects product → Order created in `ORDERS` → `ORDER_ITEMS` added → Total calculated → Payment inserted → Delivery details assigned → Status changes until delivery is completed.
* **Data Flow:** User Action → PL/SQL Logic → Database → Confirmation returned.

---

### 4. Security Architecture
* **Security Features:** User **ME** owns all tables, **Admin role** for modification, Constraints enforce data correctness, PL/SQL exception handling.
* **Protections:** Prevents invalid product quantities, negative payment amounts, and incorrect foreign keys.

---

### 5. BI & Reporting Architecture
The database supports analytical reporting:
* **Operational Reports:** Daily orders, Total revenue, Payments by method, Deliveries pending vs delivered.
* **Analytical KPIs:** Most purchased products, Order volume per day, Delivery time trends.
* **Visualization:** Dashboards (optional) can visualize these metrics.

---

### 6. Scalability & Future Expansion
The system is designed to grow into:
* Mobile application, Online customer portal
* Momo/credit card API integration
* SMS/email notifications
* Multi-vendor platform, Automatic delivery assignment
This forward-compatible design supports new modules without restructuring the database.

---

### 7. Conceptual Architecture Diagram

```mermaid
flowchart TD
  subgraph USERS
    A[Admin]
    B[Customer]
    C[Delivery Staff]
  end

  subgraph PRESENTATION
    P1[SQL Developer / Web UI / Customers]
  end

  subgraph LOGIC
    L1[PL/SQL Procedures]
    L2[Functions]
    L3[Packages]
  end

  subgraph DATA
    D1[Tables - PKs, FKs, Indexes]
  end

  A --> P1
  B --> P1
  C --> P1

  P1 --> L1
  P1 --> L2
  P1 --> L3

  L1 --> D1
  L2 --> D1
  L3 --> D1