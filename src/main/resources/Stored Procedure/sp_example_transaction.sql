
CREATE OR REPLACE PROCEDURE sp_example_transaction()
AS $$
BEGIN
    BEGIN
        INSERT INTO example_table (value) VALUES ('Value 2');
        COMMIT;
    END;
END;
$$ LANGUAGE plpgsql;


-- Begin a transaction manually
BEGIN;

-- Call the stored procedure
CALL sp_example_transaction();


commit;
-- At this point, the transaction inside the stored procedure has started and will be managed explicitly within the procedure.

-- Commit the outer transaction
--COMMIT;

select * from example_table

