CREATE OR REPLACE FUNCTION fn_example1( OUT p_count bigint)

RETURNS bigint AS
$$
BEGIN
    -- Perform operations within the transaction block
    --INSERT INTO example_table (value) VALUES ('Value 1');
	
	  SELECT COUNT(*) INTO p_count
        FROM example_table;
      
END;
$$ LANGUAGE plpgsql;

SELECT FROM fn_example1()
