DO $$
DECLARE
    branchcode varchar(50);
    processid varchar(50);
	var int;
BEGIN
    IF EXISTS (SELECT * FROM customerinfo WHERE customerno = '223') THEN
        branchcode := '0001';
        processid := '0022';
        RAISE NOTICE 'branchcode: %, Process ID: %', branchcode, processid;

        CALL sp_example_transaction4();

        UPDATE customerinfo
        SET customername = 'Karim'
       WHERE customerno = '123';
	   
	   COMMIT;
	   
        IF 1 != 0 THEN
            RAISE EXCEPTION 'Automatic exception raised: 1 is not equal to 0';
        END IF;
        UPDATE customerinfo
        SET customername = 'kona'
        WHERE customerno = '23456';
        var=1/0;
      IF branchcode = '0001' THEN
            UPDATE customerinfo
            SET customername = 'cdf'
           WHERE customerno = '333';
        END IF;

        INSERT INTO acc_chartofaccount (coaaccountno, coaaccountname, coacurrencycode)
        VALUES ('4', 'Rahim', 'BDT');

    ELSE
        INSERT INTO acc_chartofaccount (coaaccountno, coaaccountname, coacurrencycode)
        VALUES ('2', 'hena', 'BDT');

        UPDATE customerinfo
        SET customername = 'xyz'
        WHERE customerno = '333';
    END IF;

 -- COMMIT;

--EXCEPTION
  -- WHEN OTHERS THEN
    --   RAISE NOTICE 'An error occurred: %', SQLERRM;
	--   ROLLBACK;
    --   INSERT INTO acc_chartofaccount (coaaccountno, coaaccountname, coacurrencycode)
     --  VALUES ('5', 'ttt', 'BDT');
   
   --     UPDATE customerinfo
     --   SET customername = 'xyz'
     --   WHERE customerno = '333';
--COMMIT;
END $$;


--ROLLBACK

--SELECT * FROM acc_chartofaccount
--SELECT * FROM customerinfo
--SELECT * FROM example_table
