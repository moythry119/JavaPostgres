CREATE OR REPLACE PROCEDURE insert_customer(
    p_customerno VARCHAR(20),
    p_customername VARCHAR(100)
) AS $$
BEGIN
    INSERT INTO customerinfo (customerno, customername)
    VALUES (p_customerno, p_customername);
END;
$$ LANGUAGE plpgsql;

--CALL insert_customer('123', 'John Doe');
--select * from customerinfo


