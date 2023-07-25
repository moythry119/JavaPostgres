CREATE OR REPLACE FUNCTION fn_example_transaction_with_internal_exception()
RETURNS void AS
$$
BEGIN
    -- Perform operations within the transaction block
    INSERT INTO example_table (value) VALUES ('Value 214');
	  IF 1 != 0 THEN
            RAISE EXCEPTION 'Automatic exception raised: 1 is not equal to 0';
        END IF;
	INSERT INTO example_table (value) VALUES ('Value 2214');
END;
$$ LANGUAGE plpgsql;

select * from example_table
select fn_example_transaction_with_internal_exception()