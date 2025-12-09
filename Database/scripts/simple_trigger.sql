CREATE OR REPLACE TRIGGER trg_orders_restrict_insert
BEFORE INSERT ON ORDERS
DECLARE
    -- Custom error message number
    v_error_number CONSTANT NUMBER := -20003; 
    v_audit_result NUMBER;
BEGIN
    -- Check if the restriction applies (TRUE = DENIED)
    IF fn_check_restriction = TRUE THEN
        -- 1. Log the DENIAL (Audit log captures all attempts [cite: 221])
        v_audit_result := fn_audit_log_message(
            p_action_type => 'DENIED', 
            p_entity_name => 'ORDERS', 
            p_message     => 'INSERT blocked: Attempted DML on a restricted weekday/holiday.',
            p_error_code  => v_error_number
        );
        
        -- 2. Block the DML and provide a clear error message (Error messages are clear )
        RAISE_APPLICATION_ERROR(v_error_number, 
            'CRITICAL RULE VIOLATION: Employees cannot insert orders during weekdays or public holidays.');
    ELSE
        -- Log the ALLOWED action
        v_audit_result := fn_audit_log_message(
            p_action_type => 'ALLOWED', 
            p_entity_name => 'ORDERS', 
            p_message     => 'INSERT allowed: DML executed during weekend/permitted time.'
        );
    END IF;
END;
/