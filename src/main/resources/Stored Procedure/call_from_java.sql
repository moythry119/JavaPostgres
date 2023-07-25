CREATE OR REPLACE PROCEDURE call_from_java()
AS $$
Declare
branchcode varchar(50);
    processid varchar(50);
	var int;
BEGIN
    IF EXISTS (SELECT * FROM customerinfo WHERE customerno = '223') THEN
        branchcode := '0001';
        processid := '0022';
        RAISE NOTICE 'branchcode: %, Process ID: %', branchcode, processid;

        CALL sp_example_transaction4();
        COMMIT;
        UPDATE customerinfo
        SET customername = 'Karim'
       WHERE customerno = '123';

        UPDATE customerinfo
        SET customername = 'kona'
        WHERE customerno = '23456';

      IF branchcode = '0001' THEN
            UPDATE customerinfo
            SET customername = 'cdf'
           WHERE customerno = '333';
        END IF;

        INSERT INTO acc_chartofaccount (coaaccountno, coaaccountname, coacurrencycode)
        VALUES ('1', 'Rahim', 'BDT');

    ELSE
        INSERT INTO acc_chartofaccount (coaaccountno, coaaccountname, coacurrencycode)
        VALUES ('2', 'hena', 'BDT');

        UPDATE customerinfo
        SET customername = 'xyz'
        WHERE customerno = '333';
    END IF;

COMMIT;
 
END;
$$ LANGUAGE plpgsql;


call caal_from_java()