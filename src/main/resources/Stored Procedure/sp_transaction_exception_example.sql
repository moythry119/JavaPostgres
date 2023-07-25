CREATE OR REPLACE PROCEDURE sp_transaction_exception_example()
AS $$
BEGIN
    -- Start the transaction
    BEGIN
        INSERT INTO acc_chartofaccount (coaaccountno, coaaccountname, coacurrencycode) VALUES ('113', 'helal', 'usd');
        
        -- If there's an error condition, raise an exception
        IF 1 != 0 THEN
            RAISE EXCEPTION 'Automatic exception raised: 1 is not equal to 0';
        END IF;
		
        INSERT INTO acc_chartofaccount (coaaccountno, coaaccountname, coacurrencycode) VALUES ('114', 'kkk', 'usd');
    END;
END;
$$ LANGUAGE plpgsql;



CALL sp_transaction_exception_example();

select * from acc_chartofaccount
