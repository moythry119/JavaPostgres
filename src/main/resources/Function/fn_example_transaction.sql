CREATE OR REPLACE FUNCTION fn_example_transaction()
RETURNS void AS
$$
BEGIN
    -- Perform operations within the transaction block
    INSERT INTO example_table (value) VALUES ('Value 1');
END;
$$ LANGUAGE plpgsql;
