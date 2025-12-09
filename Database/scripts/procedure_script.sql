-- Procedure: create_new_customer
-- Purpose  : Add a new customer to the system
-- Params   :
--    IN  p_full_name
--    IN  p_email
--    IN  p_phone
--    OUT p_customer_id  (auto-generated)
-- Exceptions: duplicate email, insertion errors
-----------------------------------------------------------

CREATE OR REPLACE PROCEDURE create_new_customer (
    p_full_name   IN  VARCHAR2,
    p_email       IN  VARCHAR2,
    p_phone       IN  VARCHAR2,
    p_district    IN  VARCHAR2,
    p_address     IN  VARCHAR2,
    p_customer_id OUT NUMBER
) AS
    v_exists NUMBER;
BEGIN
    -- Check for duplicate email
    SELECT COUNT(*) INTO v_exists 
    FROM customers 
    WHERE email = p_email;

    IF v_exists > 0 THEN
        RAISE_APPLICATION_ERROR(-20010, 'Email already registered.');
    END IF;

    -- Generate new ID
    SELECT NVL(MAX(customer_id),0) + 1 INTO p_customer_id 
    FROM customers;

    -- Insert
    INSERT INTO customers(customer_id, full_name, email, phone, district, address, registration_date)
    VALUES(p_customer_id, p_full_name, p_email, p_phone, p_district, p_address, SYSDATE);

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20011, 'Failed to create customer: ' || SQLERRM);
END create_new_customer;
/



-----------------------------------------------------------
-- Procedure: create_order_with_out_id
-- Purpose  : Create a new order for a customer
-----------------------------------------------------------

CREATE OR REPLACE PROCEDURE create_order_with_out_id (
    p_customer_id IN NUMBER,
    p_order_id    OUT NUMBER
) AS
    v_exists NUMBER;
BEGIN
    -- Validate customer exists
    SELECT COUNT(*) INTO v_exists
    FROM customers
    WHERE customer_id = p_customer_id;

    IF v_exists = 0 THEN
        RAISE_APPLICATION_ERROR(-20020, 'Customer does not exist.');
    END IF;

    -- Generate order ID
    SELECT NVL(MAX(order_id), 0) + 1 INTO p_order_id FROM orders;

    -- Insert
    INSERT INTO orders(order_id, customer_id, order_date, status, total_amount)
    VALUES(p_order_id, p_customer_id, SYSDATE, 'Pending', 0);

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20021, 'Order creation failed: ' || SQLERRM);
END;
/

-----------------------------------------------------------
-- Procedure: add_item_to_order
-- Purpose  : Add a product to an order (with stock validation)
-----------------------------------------------------------

CREATE OR REPLACE PROCEDURE add_item_to_order (
    p_order_id   IN NUMBER,
    p_product_id IN NUMBER,
    p_quantity   IN NUMBER
) AS
    v_price NUMBER;
    v_stock NUMBER;
    v_item_id NUMBER;
BEGIN
    -- Check product exists and get stock + price
    SELECT price, quantity_available INTO v_price, v_stock
    FROM products
    WHERE product_id = p_product_id;

    -- Stock validation
    IF v_stock < p_quantity THEN
        RAISE_APPLICATION_ERROR(-20030, 'Insufficient stock.');
    END IF;

    -- Generate new item ID
    SELECT NVL(MAX(order_item_id),0) + 1 INTO v_item_id FROM order_items;

    -- Insert into items
    INSERT INTO order_items(order_item_id, order_id, product_id, quantity, price_each, subtotal)
    VALUES(v_item_id, p_order_id, p_product_id, p_quantity, v_price, v_price * p_quantity);

    -- Reduce stock
    UPDATE products
    SET quantity_available = quantity_available - p_quantity
    WHERE product_id = p_product_id;

    COMMIT;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20031, 'Product does not exist.');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20032, 'Error adding item: ' || SQLERRM);
END;
/


-----------------------------------------------------------
-- Procedure: update_order_status
-- Purpose  : Update an order status
-----------------------------------------------------------

CREATE OR REPLACE PROCEDURE update_order_status (
    p_order_id   IN NUMBER,
    p_new_status IN VARCHAR2
) AS
    v_valid NUMBER;
BEGIN
    -- Validate status
    SELECT COUNT(*) INTO v_valid
    FROM (SELECT 'Pending' AS s FROM dual
          UNION SELECT 'Processing' FROM dual
          UNION SELECT 'Shipped' FROM dual
          UNION SELECT 'Delivered' FROM dual
          UNION SELECT 'Cancelled' FROM dual)
    WHERE s = p_new_status;

    IF v_valid = 0 THEN
        RAISE_APPLICATION_ERROR(-20040, 'Invalid status.');
    END IF;

    UPDATE orders
    SET status = p_new_status
    WHERE order_id = p_order_id;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20041, 'Order does not exist.');
    END IF;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20042, 'Failed to update status: ' || SQLERRM);
END;
/

-----------------------------------------------------------
-- Procedure: delete_order
-- Purpose  : Delete an order and its items
-----------------------------------------------------------

CREATE OR REPLACE PROCEDURE delete_order (
    p_order_id IN NUMBER
) AS
BEGIN
    -- Delete items first
    DELETE FROM order_items WHERE order_id = p_order_id;

    -- Delete payments
    DELETE FROM payments WHERE order_id = p_order_id;

    -- Delete delivery info
    DELETE FROM delivery WHERE order_id = p_order_id;

    -- Delete order itself
    DELETE FROM orders WHERE order_id = p_order_id;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20050, 'Order not found for deletion.');
    END IF;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20051, 'Error deleting order: ' || SQLERRM);
END;
/