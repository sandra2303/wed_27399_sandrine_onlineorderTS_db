CREATE OR REPLACE FUNCTION fn_audit_log_message (
    p_action_type IN AUDIT_LOG.ACTION_TYPE%TYPE, -- 'ATTEMPT', 'DENIED', 'ALLOWED'
    p_entity_name IN AUDIT_LOG.ENTITY_NAME%TYPE, -- Table name
    p_message     IN AUDIT_LOG.MESSAGE%TYPE,
    p_error_code  IN AUDIT_LOG.ERROR_CODE%TYPE DEFAULT NULL
)
RETURN NUMBER
IS
    PRAGMA AUTONOMOUS_TRANSACTION; -- Allows the log to commit independently of the main transaction
BEGIN
    INSERT INTO AUDIT_LOG (ACTION_TYPE, ENTITY_NAME, MESSAGE, ERROR_CODE)
    VALUES (p_action_type, p_entity_name, p_message, p_error_code);
    
    COMMIT; -- Commit the log record immediately
    RETURN 1; -- Success
EXCEPTION
    WHEN OTHERS THEN
        RETURN 0; -- Failure to log (should not happen, but defensive programming)
END fn_audit_log_message;
/