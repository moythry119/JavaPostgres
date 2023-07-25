CREATE OR REPLACE FUNCTION fn_example_transaction1()
RETURNS void AS
$$
BEGIN
    -- Perform operations within the transaction block
    INSERT INTO example_table (value) VALUES ('Value 14');
END;
$$ LANGUAGE plpgsql;


select * from example_table


CREATE OR REPLACE FUNCTION fn_example_transaction2()
RETURNS void AS
$$
BEGIN
    -- Perform operations within the transaction block
    INSERT INTO example_table (value) VALUES ('Value 15');
END;
$$ LANGUAGE plpgsql;
