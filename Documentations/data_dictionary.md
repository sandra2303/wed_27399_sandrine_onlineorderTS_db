# 📚 Data Dictionary
## Online Order Tracking System

---

### [cite_start]1. CUSTOMER [cite: 2]

| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `customer_id` | `NUMBER(10)` | [cite_start]PK, NOT NULL [cite: 3] | [cite_start]Unique ID for each customer [cite: 3] |
| `full_name` | `VARCHAR2(100)` | [cite_start]NOT NULL [cite: 3] | [cite_start]Customer's full name [cite: 3] |
| `email` | `VARCHAR2(100)` | [cite_start]UNIQUE, NOT NULL [cite: 3] | [cite_start]Customer email [cite: 3] |
| `phone` | `VARCHAR2(20)` | [cite_start]NOT NULL [cite: 3] | [cite_start]Customer phone [cite: 3] |
| `address` | `VARCHAR2(200)` | [cite_start]NOT NULL [cite: 3] | [cite_start]Customer address [cite: 3] |
| `date_registered` | `DATE` | [cite_start]DEFAULT SYSDATE [cite: 3] | [cite_start]Registration date [cite: 3] |

---

### [cite_start]2. PRODUCT [cite: 4]

| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `product_id` | `NUMBER(10)` | [cite_start]PK, NOT NULL [cite: 5] | [cite_start]Product ID [cite: 5] |
| `product_name` | `VARCHAR2(150)` | [cite_start]NOT NULL [cite: 5] | [cite_start]Product name [cite: 5] |
| `unit_price` | `NUMBER(10,2)` | [cite_start]NOT NULL [cite: 5] | [cite_start]Price per unit [cite: 5] |
| `stock_quantity` | `NUMBER(10)` | [cite_start]NOT NULL [cite: 5] | [cite_start]Stock available [cite: 5] |
| `category` | `VARCHAR2(100)` | [cite_start]NULL [cite: 5] | [cite_start]Category [cite: 5] |
| `date_added` | `DATE` | [cite_start]DEFAULT SYSDATE [cite: 5] | [cite_start]Date added [cite: 5] |

---

### [cite_start]3. ORDERS [cite: 6]

| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `order_id` | `NUMBER(10)` | [cite_start]PK, NOT NULL [cite: 7] | [cite_start]Order ID [cite: 7] |
| `customer_id` | `NUMBER(10)` | [cite_start]FK, NOT NULL [cite: 7] | [cite_start]Customer reference [cite: 7] |
| `order_date` | `DATE` | [cite_start]DEFAULT SYSDATE [cite: 7] | [cite_start]Order date [cite: 7] |
| `order_status` | `VARCHAR2(50)` | [cite_start]NOT NULL [cite: 7] | [cite_start]Status [cite: 7] |
| `total_amount` | `NUMBER(10,2)` | [cite_start]NOT NULL [cite: 7] | [cite_start]Total amount [cite: 7] |

---

### [cite_start]4. ORDER_ITEMS [cite: 8]

| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `order_item_id` | `NUMBER(10)` | [cite_start]PK, NOT NULL [cite: 9] | [cite_start]Order item ID [cite: 9] |
| `order_id` | `NUMBER(10)` | [cite_start]FK, NOT NULL [cite: 9] | [cite_start]Order reference [cite: 9] |
| `product_id` | `NUMBER(10)` | [cite_start]FK, NOT NULL [cite: 9] | [cite_start]Product reference [cite: 9] |
| `quantity` | `NUMBER(10)` | [cite_start]NOT NULL [cite: 9] | [cite_start]Quantity [cite: 9] |
| `price_per_unit` | `NUMBER(10,2)` | [cite_start]NOT NULL [cite: 9] | [cite_start]Unit price [cite: 9] |
| `subtotal` | `NUMBER(10,2)` | [cite_start]NOT NULL [cite: 9] | [cite_start]Subtotal [cite: 9] |

---

### [cite_start]5. PAYMENT [cite: 10]

| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `payment_id` | `NUMBER(10)` | [cite_start]PK, NOT NULL [cite: 11] | [cite_start]Payment ID [cite: 11] |
| `order_id` | `NUMBER(10)` | [cite_start]FK, NOT NULL [cite: 11] | [cite_start]Order reference [cite: 11] |
| `payment_date` | `DATE` | [cite_start]DEFAULT SYSDATE [cite: 11] | [cite_start]Payment date [cite: 11] |
| `payment_method` | `VARCHAR2(50)` | [cite_start]NOT NULL [cite: 11] | [cite_start]Method [cite: 11] |
| `payment_status` | `VARCHAR2(50)` | [cite_start]NOT NULL [cite: 11] | [cite_start]Status [cite: 11] |
| `amount_paid` | `NUMBER(10,2)` | [cite_start]NOT NULL [cite: 11] | [cite_start]Amount paid [cite: 11] |

---

### [cite_start]6. DELIVERY [cite: 12]

| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `delivery_id` | `NUMBER(10)` | [cite_start]PK, NOT NULL [cite: 13] | [cite_start]Delivery ID [cite: 13] |
| `order_id` | `NUMBER(10)` | [cite_start]FK, NOT NULL [cite: 13] | [cite_start]Order reference [cite: 13] |
| `delivery_staff_name` | `VARCHAR2(100)` | [cite_start]NOT NULL [cite: 13] | [cite_start]Staff name [cite: 13] |
| `delivery_date` | `DATE` | [cite_start]NULL [cite: 13] | [cite_start]Delivery date [cite: 13] |
| `delivery_status` | `VARCHAR2(50)` | [cite_start]NOT NULL [cite: 13] | [cite_start]Status [cite: 13] |
| `delivery_notes` | `VARCHAR2(200)` | [cite_start]NULL [cite: 13] | [cite_start]Notes [cite: 13] |

---

### [cite_start]7. STOCK_MOVEMENT [cite: 14]

| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `movement_id` | `NUMBER(10)` | [cite_start]PK, NOT NULL [cite: 15] | [cite_start]Movement ID [cite: 15] |
| `product_id` | `NUMBER(10)` | [cite_start]FK, NOT NULL [cite: 15] | [cite_start]Product reference [cite: 15] |
| `movement_date` | `DATE` | [cite_start]DEFAULT SYSDATE [cite: 15] | [cite_start]Movement date [cite: 15] |
| `movement_type` | `VARCHAR2(10)` | [cite_start]NOT NULL [cite: 15] | [cite_start]IN or OUT [cite: 15] |
| `quantity` | `NUMBER(10)` | [cite_start]NOT NULL [cite: 15] | [cite_start]Quantity moved [cite: 15] |
| `remarks` | `VARCHAR2(200)` | [cite_start]NULL [cite: 15] | [cite_start]Reason [cite: 15] |