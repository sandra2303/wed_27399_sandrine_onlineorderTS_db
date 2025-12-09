CREATE OR REPLACE TRIGGER ctg_customers_audit
FOR INSERT OR UPDATE OR DELETE ON CUSTOMERS
COMPOUND TRIGGER

    TYPE t_audit_data IS RECORD (
        log_message VARCHAR2(4000)
    );
    TYPE t_audit_collection IS TABLE OF t_audit_data INDEX BY PLS_INTEGER;
    v_audit_buffer t_audit_collection;

    v_error_number CONSTANT NUMBER := -20005;

BEFORE STATEMENT IS
BEGIN
    -- Explicitly call the function using the schema name (SANDRINE.)
    IF SANDRINE.fn_check_restriction = TRUE THEN
        SANDRINE.fn_audit_log_message(  -- Use SANDRINE. prefix here
            p_action_type => 'DENIED', 
            p_entity_name => 'CUSTOMERS', 
            p_message     => SYS_CONTEXT('USERENV', 'OS_USER') || ' attempted DML on restricted day (STATEMENT BLOCKED).',
            p_error_code  => v_error_number
        );
        RAISE_APPLICATION_ERROR(v_error_number, 
            'CRITICAL RULE VIOLATION: Customer records cannot be modified on weekdays or public holidays.');
    END IF;
END BEFORE STATEMENT;

AFTER EACH ROW IS
    v_msg VARCHAR2(4000);
BEGIN
    IF INSERTING THEN
        v_msg := 'INSERTED by ' || USER || '. New ID: ' || :NEW.CUSTOMER_ID || '. Name: ' || :NEW.FIRST_NAME || ' ' || :NEW.LAST_NAME;
    ELSIF UPDATING THEN
        v_msg := 'UPDATED by ' || USER || '. Customer ID: ' || :OLD.CUSTOMER_ID || 
                 '. Old Email: ' || :OLD.CUST_EMAIL || '. New Email: ' || :NEW.CUST_EMAIL;
    ELSIF DELETING THEN
        v_msg := 'DELETED by ' || USER || '. Customer ID: ' || :OLD.CUSTOMER_ID || '. Name: ' || :OLD.FIRST_NAME || ' ' || :OLD.LAST_NAME;
    END IF;
    
    v_audit_buffer(v_audit_buffer.COUNT + 1).log_message := v_msg;

END AFTER EACH ROW;

AFTER STATEMENT IS
    v_audit_result NUMBER;
BEGIN
    IF v_audit_buffer.COUNT > 0 THEN 
        FOR i IN v_audit_buffer.FIRST..v_audit_buffer.LAST LOOP
            SANDRINE.fn_audit_log_message( -- Use SANDRINE. prefix here
                p_action_type => 'EXECUTE', 
                p_entity_name => 'CUSTOMERS', 
                p_message     => v_audit_buffer(i).log_message
            );
        END LOOP;
    ELSE
        SANDRINE.fn_audit_log_message( -- Use SANDRINE. prefix here
            p_action_type => 'ALLOWED', 
            p_entity_name => 'CUSTOMERS', 
            p_message     => 'DML executed but affected zero rows.'
        );
    END IF;
END AFTER STATEMENT;

END ctg_customers_audit;
/