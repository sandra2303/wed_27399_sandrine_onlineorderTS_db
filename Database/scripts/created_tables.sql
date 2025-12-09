CREATE TABLE customers (
    customer_id      NUMBER PRIMARY KEY,
    full_name        VARCHAR2(100) NOT NULL,
    email            VARCHAR2(100) UNIQUE NOT NULL,
    phone            VARCHAR2(30),
    district         VARCHAR2(100),
    address          VARCHAR2(200),
    registration_date DATE DEFAULT SYSDATE
);

CREATE TABLE products (
    product_id       NUMBER PRIMARY KEY,
    product_name     VARCHAR2(150) NOT NULL,
    description      VARCHAR2(300),
    price            NUMBER(10,2) NOT NULL CHECK (price >= 0),
    quantity_available NUMBER DEFAULT 0 CHECK (quantity_available >= 0)
);

CREATE TABLE orders (
    order_id         NUMBER PRIMARY KEY,
    customer_id      NUMBER NOT NULL,
    order_date       DATE DEFAULT SYSDATE,
    status           VARCHAR2(20) DEFAULT 'Pending' CHECK (status IN ('Pending','Processing','Shipped','Delivered','Cancelled')),
    total_amount     NUMBER(12,2) DEFAULT 0 CHECK (total_amount >= 0),
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id    NUMBER PRIMARY KEY,
    order_id         NUMBER NOT NULL,
    product_id       NUMBER NOT NULL,
    quantity         NUMBER NOT NULL CHECK (quantity > 0),
    price_each       NUMBER(10,2) NOT NULL CHECK (price_each >= 0),
    subtotal         NUMBER(12,2) NOT NULL CHECK (subtotal >= 0),
    CONSTRAINT fk_orderitems_order FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT fk_orderitems_product FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id       NUMBER PRIMARY KEY,
    order_id         NUMBER NOT NULL,
    payment_date     DATE DEFAULT SYSDATE,
    amount           NUMBER(12,2) NOT NULL CHECK (amount >= 0),
    payment_method   VARCHAR2(50) CHECK (payment_method IN ('MTN MoMo','Airtel Money','Cash','Card')),
    status           VARCHAR2(20) DEFAULT 'Pending' CHECK (status IN ('Pending','Completed','Failed')),
    CONSTRAINT fk_payment_order FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE delivery (
    delivery_id      NUMBER PRIMARY KEY,
    order_id         NUMBER NOT NULL,
    delivery_staff_name VARCHAR2(100),
    delivery_address VARCHAR2(200),
    delivery_status  VARCHAR2(30) DEFAULT 'Preparing' 
                       CHECK (delivery_status IN ('Preparing','On the way','Delivered','Failed','Returned')),
    expected_date    DATE,
    actual_date      DATE,
    CONSTRAINT fk_delivery_order FOREIGN KEY (order_id) REFERENCES orders(order_id)
);