-- DROP PROCEDURE newGetAccountInfo()
-- DROP PROCEDURE newGetAccountInfo(character varying)
-- DROP PROCEDURE newGetAccountInfo()
-- DROP PROCEDURE newGetAccountInfo()
CREATE OR REPLACE PROCEDURE newGetAccountInfo(account VARCHAR, OUT accountName VARCHAR)
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



--CALL newGetAccountInfo('00010010010034626');
CALL newGetAccountInfo('00010010010034626', '');







