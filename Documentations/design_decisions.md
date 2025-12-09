# 📘 Design Decisions – Online Order Tracking System

This document explains the technical and architectural decisions made while implementing the Online Order Tracking System throughout all project phases. Each decision was made to ensure reliability, security, PL/SQL performance, and Oracle best practices.

---

### 1. Choice of System Architecture

The system uses a **modular relational architecture** separating customers, products, orders, payments, and deliveries into independent but related tables.

**Oracle** was selected because it supports:
* Strong PL/SQL programming (procedures, functions, packages)
* Referential integrity through constraints
* High scalability for large order volumes
* Analytical SQL functions for BI dashboards

The structure allows future expansion into inventory management, real-time tracking, and automated e-commerce flows.

---

### 2. Table Design Decisions

#### a. Normalized Schema (3NF)
* Each core entity has its own table: `customers`, `products`, `orders`, `order_items`, `payment`, `delivery`.
* **No repeated data or duplicated fields.**
* Foreign keys enforce relationships, ensuring consistent order and payment data.

#### b. Column & Constraint Design
* Primary keys use either manually generated IDs or sequences.
* `status` fields for orders and delivery include **CHECK constraints** (e.g., Pending, Processing, Delivered).
* `method` in payment supports predefined methods (MobileMoney, CreditCard, Cash).
* **Numeric types** chosen for product prices, order totals, and quantities.
* `VARCHAR2` used for flexible input fields (addresses, names).

---

### 3. Indexing Strategy

Indexes were added on all foreign keys for performance:
* `idx_orders_customer` → speeds customer–order lookups
* `idx_orderitems_order` → improves order-to-items queries
* `idx_orderitems_product` → speeds product usage reports
* `idx_delivery_order` → speeds delivery tracking

**Reason:** Order tracking systems frequently JOIN multiple tables (`customers` → `orders` → `order_items` → `delivery`). Indexes reduce full table scans and improve response time.

---

### 4. Referential Integrity Decisions

* All foreign keys use default **ON DELETE RESTRICT** to avoid accidental data loss.
* Prevents removing customers with existing orders.
* Ensures historical tracking for payments and deliveries.

---

### 5. PL/SQL Logic Decisions

#### a. Procedures & Functions
* **Parameterized procedures** created for: creating orders, inserting order items, updating delivery status, processing payments.
* **Functions** created for: order total calculation, product price lookup, validating customer existence.
* **Reason:** Improves reusability, reduces repeated SQL, and centralizes business rules.

#### b. Packages
* Related operations grouped into a **package** (e.g., `ORDER_MANAGEMENT_PKG`) for: modularity, easier debugging, and cleaner program structure.

#### c. Exception Handling
* Custom exceptions handle: missing products, invalid order references, insufficient quantity.
* All errors are logged for traceability.

---

### 6. Trigger Design Decisions

Triggers used for:
* Automatic calculation of order totals.
* Automatic timestamp filling.
* Validation of product quantity before inserting order items.

**Reason:** Triggers enforce rules even if operations bypass the PL/SQL procedures.

---

### 7. Business Intelligence (BI) Decisions

* **KPI Selection:** KPIs support managerial decision-making (Total orders per day, Revenue per product, Average delivery time, etc.).
* **Analytical SQL Usage:** Uses `ROW_NUMBER()`, `DENSE_RANK()`, `LAG()`, `LEAD()`, `AVG()`, `SUM()`, `COUNT()`, and `PARTITION BY` for advanced analytics and reporting.

---

### 8. Security & Auditing Decisions

* Dedicated **admin user** created for database operations.
* Input validation enforced by: **NOT NULL** constraints, **CHECK** constraints, and **PL/SQL validation**.
* **Reason:** Prevents incorrect or malicious data entry.

---

### 9. Scalability & Extensibility

System was designed to support:
* Real-time courier tracking
* Automated SMS/email notifications
* Integrated payment gateway
* Inventory management and order returns/refunds modules
* **Order ID** becomes the universal link for all future extensions.

---

### 10. Data Quality & Validation Rules

* Required fields enforce complete data.
* CHECK constraints keep statuses valid.
* Default values: `order_date` → `SYSDATE`, `payment_date` → `SYSDATE`.
* Numeric validation ensures quantities and price values are correct.

---

### 11. Naming Conventions

* All tables use **singular nouns** (customer, product, order).
* Constraints follow: `pk_` for primary keys, `fk_` for foreign keys, `chk_` for check constraints, and `idx_` for indexes.
* **Reason:** Professional, readable, and consistent with Oracle standards.