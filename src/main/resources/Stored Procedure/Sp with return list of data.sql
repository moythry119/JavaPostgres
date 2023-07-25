CREATE OR REPLACE PROCEDURE all_column_value_return(account VARCHAR,OUT result_text TEXT)
AS $$
DECLARE
  result_set refcursor;
  temp_row record;
  output_text TEXT := '';
BEGIN

  -- Open the refcursor and set the result set
  OPEN result_set FOR SELECT * FROM acc_chartofaccount;

  -- Output the data
  LOOP
    FETCH result_set INTO temp_row;
    EXIT WHEN NOT FOUND;
    output_text := output_text || 'c_no: ' || temp_row.coaaccountname || ', c_name: ' || temp_row.coaaccountno || ', c_name: ' || temp_row.coacurrencycode || E'\n';
  END LOOP;

  -- Close the cursor
  CLOSE result_set;

  -- Set the result_text output variable
  result_text := output_text;
END;
$$ LANGUAGE plpgsql;


--DROP TABLE temp_table
--CALL all_column_value_return('00010010010034626','');
-- DROP Procedure insert_and_show_data()
