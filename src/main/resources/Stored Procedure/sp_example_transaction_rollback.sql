CREATE OR REPLACE PROCEDURE sp_example_transaction_rollback(p_accno VARCHAR)
AS $$
BEGIN
    -- Start the transaction
    BEGIN
        INSERT INTO acc_chartofaccount (coaaccountno, coaaccountname, coacurrencycode) VALUES ('11', 'helal', 'usd');
        UPDATE acc_chartofaccount SET coaaccountname = 'Abdul' WHERE coaaccountno = p_accno;
		
        -- If there's an error condition, raise an exception
        IF NOT FOUND THEN
            -- Rollback to the savepoint to undo the changes
            ROLLBACK;
            RAISE EXCEPTION 'Record does not exist';
        END IF;
    END;
END;
$$ LANGUAGE plpgsql;


CALL sp_example_transaction_rollback('55');

select * from acc_chartofaccount
