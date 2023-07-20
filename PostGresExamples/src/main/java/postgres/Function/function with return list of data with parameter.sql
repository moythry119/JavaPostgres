-- SELECT * FROM fun_sfs_getaccountinfodetails('00010010010034626')
--DROP FUNCTION fun_sfs_getaccountinfodetails(character varying)
CREATE OR REPLACE FUNCTION fun_sfs_getaccountinfodetails(account varchar)
RETURNS SETOF acc_chartofaccount
AS $$
BEGIN
  RETURN QUERY
    SELECT *
    FROM acc_chartofaccount
    WHERE coaaccountno = account;
END;
$$ LANGUAGE plpgsql;


