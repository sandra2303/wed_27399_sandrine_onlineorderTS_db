
CREATE OR REPLACE PACKAGE ORDER_PKG AS
    -- Requirement: Calculation Function (Minimum 3-5 Functions) [cite: 169]
    -- Calculates the total amount for a given order, summing up all order items.
    FUNCTION fn_calculate_order_total (
        p_order_id IN ORDERS.ORDER_ID%TYPE
    )
    RETURN NUMBER;

    -- Requirement: Parameterized Procedure (Minimum 3-5 Procedures) [cite: 160, 161]
    -- Finalizes an order by updating its total amount and status.
    PROCEDURE pr_finalize_order (
        p_order_id IN ORDERS.ORDER_ID%TYPE
    );

    -- Custom Exception for exception handling requirement [cite: 190]
    e_order_not_found EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_order_not_found, -20001);

END ORDER_PKG;
/

CREATE OR REPLACE PACKAGE BODY ORDER_PKG AS

    -- Function to calculate total amount
    FUNCTION fn_calculate_order_total (
        p_order_id IN ORDERS.ORDER_ID%TYPE
    )
    RETURN NUMBER
    IS
        v_total_amount NUMBER(10, 2);
    BEGIN
        -- Use an aggregation query to sum up the cost of all order items
        SELECT SUM(oi.QUANTITY * oi.ITEM_PRICE)
        INTO v_total_amount
        FROM ORDER_ITEMS oi
        WHERE oi.ORDER_ID = p_order_id;

        -- Check if the order items exist (exception handling)
        IF v_total_amount IS NULL THEN
            RAISE e_order_not_found;
        END IF;

        RETURN v_total_amount;

    -- Exception Handling (Requirement: Predefined exceptions caught) [cite: 189]
    EXCEPTION
        WHEN e_order_not_found THEN
            -- In a real application, this would log the error
            RETURN 0;
        WHEN OTHERS THEN
            RAISE;
    END fn_calculate_order_total;


    -- Procedure to finalize the order total and status
    PROCEDURE pr_finalize_order (
        p_order_id IN ORDERS.ORDER_ID%TYPE
    )
    IS
        v_calculated_total NUMBER(10, 2);
    BEGIN
        -- 1. Use the function we just created
        v_calculated_total := fn_calculate_order_total(p_order_id);

        -- 2. Check if calculation was successful
        IF v_calculated_total > 0 THEN
            -- Requirement: DML operations (UPDATE) [cite: 162]
            UPDATE ORDERS
            SET TOTAL_AMOUNT = v_calculated_total,
                STATUS = 'Processing' -- Update status from 'Pending'
            WHERE ORDER_ID = p_order_id;
        ELSE
            -- Raise the custom exception
            RAISE_APPLICATION_ERROR(-20001, 'ORDER_PKG.pr_finalize_order: Order ID ' || p_order_id || ' not found or has no items.');
        END IF;

        COMMIT;

    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            -- Log the error here (for a more complete project)
            RAISE;
    END pr_finalize_order;

END ORDER_PKG;
/