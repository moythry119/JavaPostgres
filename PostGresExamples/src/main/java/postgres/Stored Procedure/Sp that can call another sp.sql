CREATE OR REPLACE PROCEDURE calling_sp_show_data()
AS $$
DECLARE
  accountNameResult VARCHAR;
BEGIN
  CALL single_column_value_return('00010010010034626', accountNameResult);

  -- Use the value returned by the called stored procedure as needed
  -- For example, you can print it or use it in further processing
  RAISE NOTICE 'Account Name: %', accountNameResult;
END;
$$ LANGUAGE plpgsql;

--call calling_sp_show_data();
