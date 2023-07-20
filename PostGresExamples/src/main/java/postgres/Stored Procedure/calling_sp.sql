CREATE OR REPLACE PROCEDURE calling_sp()
AS $$
BEGIN
    CALL no_param_insert(); -- Calling the 'no_param_insert' stored procedure
END;
$$ LANGUAGE plpgsql;

call calling_sp()

select * from customerinfo
