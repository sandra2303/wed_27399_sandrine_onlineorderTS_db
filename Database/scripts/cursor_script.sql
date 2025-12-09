---------------------------------------------------------------
-- Procedure: list_pending_orders
-- Type     : Explicit Cursor (OPEN → FETCH → CLOSE)
-- Purpose  : Loops through all orders with status = 'Pending'
---------------------------------------------------------------

CREATE OR REPLACE PROCEDURE list_pending_orders AS
    -- Cursor definition
    CURSOR cur_pending IS
        SELECT order_id, customer_id, status
        FROM orders
        WHERE status = 'Pending';

    -- Variables to hold fetched row data
    v_order_id     orders.order_id%TYPE;
    v_customer_id  orders.customer_id%TYPE;
    v_status       orders.status%TYPE;

BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Pending Orders ---');

    -- OPEN cursor
    OPEN cur_pending;

    LOOP
        -- FETCH one row at a time
        FETCH cur_pending INTO v_order_id, v_customer_id, v_status;

        -- EXIT when no more rows
        EXIT WHEN cur_pending%NOTFOUND;

        -- Display processed row
        DBMS_OUTPUT.PUT_LINE(
            'Order ID: ' || v_order_id ||
            ' | Customer: ' || v_customer_id ||
            ' | Status: '   || v_status
        );
    END LOOP;

    -- CLOSE cursor
    CLOSE cur_pending;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END list_pending_orders;
/
