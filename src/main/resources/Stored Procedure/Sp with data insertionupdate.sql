CREATE OR REPLACE PROCEDURE no_param_insert(
) AS $$
BEGIN
    INSERT INTO customerinfo (customerno, customername)
    VALUES ('333', 'abc');
END;
$$ LANGUAGE plpgsql;

--CALL no_param_insert();
--select * from customerinfo


