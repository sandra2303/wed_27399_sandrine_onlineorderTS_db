# wed_27399_sandrine_onlineorderTS_db

---

# Online Order Tracking System

#### **Student Name:** UWIMBABAZI Sandrine  
#### **Student ID:** 27399  
#### **Course:** Database Development with PL/SQL (INSY 8311)  
#### **Institution:** Adventist University of Central Africa (AUCA)  
#### **Lecturer:** Eric Maniraguha  

---

## 📌 Project Overview
The **Online Order Tracking System (OOTS)** is a PL/SQL-based Oracle database system designed to help customers place orders, make payments, and track their order status in real time. It automates order processing, stock verification, payment validation, and system notifications using stored procedures, triggers, and packages.

---

## 🚨 Problem Statement
Businesses relying on manual order processing face delays, inconsistent updates, and poor customer communication. Customers often cannot track their orders, leading to confusion and inefficiency.  
This system solves these issues by providing automated order tracking, reliable data storage, and real-time status updates.

---

## 🎯 Key Objectives
- Automate the online ordering and tracking process  
- Ensure accurate stock validation and payment verification  
- Maintain complete order history for reporting  
- Provide real-time tracking updates to customers  
- Reduce errors through triggers, constraints, and stored procedures  

---

## ⚡ Quick Start Instructions

### 1. Create Pluggable Database (PDB)
Create the PDB in Oracle 21c using SQL Developer or SQL*Plus.  
Example:
```sql
CREATE PLUGGABLE DATABASE WED_27399_ONLINEORDER_DB
ADMIN USER sandrine IDENTIFIED BY sandrine
FILE_NAME_CONVERT = (
    'C:/app/Administrator/product/21c/oradata/XE/pdbseed/',
    'C:/app/Administrator/product/21c/oradata/XE/WED_27399_ONLINEORDER_DB/'
);
```

---

### 2. Connect to Your PDB
```sql
ALTER SESSION SET CONTAINER = WED_27399_ONLINEORDER_DB;
```

---

### 3. Run SQL Scripts  
Inside the **database/scripts** folder, run the files:

1️⃣  [created_tables.sql](https://github.com/sandra2303/wed_27399_sandrine_onlineorderTS_db/blob/main/Database/scripts/created_tables.sql) 
2️⃣  [insertion.sql](https://github.com/sandra2303/wed_27399_sandrine_onlineorderTS_db/blob/main/Database/scripts/insertion.sql) 
3️⃣  [functions_script.sql](https://github.com/sandra2303/wed_27399_sandrine_onlineorderTS_db/blob/main/Database/scripts/function_script.sql) 
4️⃣  [cursor_script.sql](https://github.com/sandra2303/wed_27399_sandrine_onlineorderTS_db/blob/main/Database/scripts/cursor_script.sql) 
5️⃣  [package_script.sql](https://github.com/sandra2303/wed_27399_sandrine_onlineorderTS_db/blob/main/Database/scripts/package_script.sql) 
6️⃣  [simple_trigger.sql](https://github.com/sandra2303/wed_27399_sandrine_onlineorderTS_db/blob/main/Database/scripts/simple_trigger.sql) 

> These create all system tables (CUSTOMERS, PRODUCTS, ORDERS, ORDER_ITEMS, PAYMENTS), business logic, and audit functionality.

---

## 📚 Links to Documentation

- [Data Dictionary](https://github.com/sandra2303/wed_27399_sandrine_onlineorderTS_db/blob/main/Documentations/data_dictionary.md) – Details of all tables, columns, types, and constraints.
- [Architecture](https://github.com/sandra2303/wed_27399_sandrine_onlineorderTS_db/blob/main/Documentations/architecture.md) – Overview of the system design and database structure.
- [Design Decisions](https://github.com/sandra2303/wed_27399_sandrine_onlineorderTS_db/blob/main/Documentations/design_decisions.md) – Explanation of key design choices made during development.
- [BI Requirements](https://github.com/sandra2303/wed_27399_sandrine_onlineorderTS_db/blob/main/Business_Inteligence/BI_requirements.md) – KPIs, dashboards, and analytical queries.
- [Dashboards](https://github.com/sandra2303/wed_27399_sandrine_onlineorderTS_db/blob/main/Business_Inteligence/Dashboard.md) – Mockups of BI dashboards.
- [KPI Definitions](https://github.com/sandra2303/wed_27399_sandrine_onlineorderTS_db/blob/main/Business_Inteligence/KPI_definition.md) – Detailed description of KPIs used in the system.  
- `screenshots/` – Contains all system screenshots (OEM, SQL Developer, tables, results)

---


