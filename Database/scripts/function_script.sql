-----------------------------------------------------------
-- Function: calculate_order_total
-- Type    : Calculation Function
-- Purpose : Returns the total cost of all items in an order
-----------------------------------------------------------

CREATE OR REPLACE FUNCTION calculate_order_total(
    p_order_id IN NUMBER
) RETURN NUMBER AS
    v_total NUMBER;
BEGIN
    SELECT NVL(SUM(subtotal), 0)
    INTO v_total
    FROM order_items
    WHERE order_id = p_order_id;

    RETURN v_total;

EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(
            -20301,
            'Error calculating order total: ' || SQLERRM
        );
END calculate_order_total;
/


-----------------------------------------------------------
-- Function: check_stock_available
-- Type    : Validation Function
-- Purpose : Checks if enough stock exists for a product
-----------------------------------------------------------

CREATE OR REPLACE FUNCTION check_stock_available(
    p_product_id IN NUMBER,
    p_quantity   IN NUMBER
) RETURN NUMBER AS
    v_stock NUMBER;
BEGIN
    SELECT quantity_available
    INTO v_stock
    FROM products
    WHERE product_id = p_product_id;

    IF v_stock >= p_quantity THEN
        RETURN 1; -- Enough stock
    ELSE
        RETURN 0; -- Not enough stock
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20302,
            'Product does not exist.'
        );

    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(
            -20303,
            'Error checking stock: ' || SQLERRM
        );
END check_stock_available;
/

-----------------------------------------------------------
-- Function: get_customer_name
-- Type    : Lookup Function
-- Purpose : Returns a customer's full name
-----------------------------------------------------------

CREATE OR REPLACE FUNCTION get_customer_name(
    p_customer_id IN NUMBER
) RETURN VARCHAR2 AS
    v_name VARCHAR2(200);
BEGIN
    SELECT full_name
    INTO v_name
    FROM customers
    WHERE customer_id = p_customer_id;

    RETURN v_name;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Customer Not Found';

    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(
            -20304,
            'Error retrieving customer name: ' || SQLERRM
        );
END get_customer_name;
/