
CREATE OR REPLACE PROCEDURE single_column_value_return(account VARCHAR, OUT accountName VARCHAR)
LANGUAGE plpgsql
AS $$
DECLARE
  result refcursor;
  row_data acc_chartofaccount%ROWTYPE;
BEGIN
  OPEN result FOR
    SELECT *
    FROM acc_chartofaccount
    WHERE coaaccountno = account;
  
  FETCH result INTO row_data;
  
  IF FOUND THEN
    accountName := row_data.coaaccountname;
  END IF;
  
  CLOSE result;
END;
$$;




--CALL single_column_value_return('00010010010034626', '');







