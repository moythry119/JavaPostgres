CREATE OR REPLACE PROCEDURE sp_example_transaction3()
AS $$
BEGIN
    
        INSERT INTO example_table (value) VALUES ('Value 18');
  
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE sp_example_transaction4()
AS $$
BEGIN
    
        INSERT INTO example_table (value) VALUES ('Value 19');
  
END;
$$ LANGUAGE plpgsql;


select * from example_table 