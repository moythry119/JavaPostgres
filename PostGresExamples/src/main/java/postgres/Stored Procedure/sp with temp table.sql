CREATE OR REPLACE PROCEDURE insert_and_show_data_param(p_accountname VARCHAR,OUT result_text TEXT)
AS $$
DECLARE
  result_set refcursor;
  temp_row record;
  output_text TEXT := '';
BEGIN
  -- Drop the temporary table if it exists
  IF EXISTS (
    SELECT 1
    FROM pg_catalog.pg_tables
    WHERE tablename = 'temp_table' AND schemaname = 'pg_temp'
  ) THEN
    DROP TABLE temp_table;
  END IF;

  -- Create temporary table
  CREATE TEMPORARY TABLE temp_table (
    c_no VARCHAR(50),
    c_name VARCHAR(50)
  );

  -- Insert data into temporary table
  INSERT INTO temp_table (c_no, c_name)
  SELECT coaaccountno, coaaccountname FROM acc_chartofaccount
  WHERE coaaccountname=p_accountname;

  -- Open the refcursor and set the result set
  OPEN result_set FOR SELECT * FROM temp_table;

  -- Output the data
  LOOP
    FETCH result_set INTO temp_row;
    EXIT WHEN NOT FOUND;
    output_text := output_text || 'c_no: ' || temp_row.c_no || ', c_name: ' || temp_row.c_name || E'\n';
  END LOOP;

  -- Close the cursor
  CLOSE result_set;

  -- Set the result_text output variable
  result_text := output_text;
END;
$$ LANGUAGE plpgsql;


--DROP TABLE temp_table
--CALL insert_and_show_data_param('Karim','');
-- DROP Procedure insert_and_show_data()
