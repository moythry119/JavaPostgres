package com.txsp;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.StoredProcedureQuery;

public class TxSPWithOutCommit {
    public static void main(String[] args) {
    	EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("YourPersistenceUnitName");
    	EntityManager entityManager = entityManagerFactory.createEntityManager();

    	try {
    	    // Explicitly start a transaction
    	    entityManager.getTransaction().begin();

    	    // Execute the stored procedure
    	    StoredProcedureQuery query = entityManager.createStoredProcedureQuery("sp_example_transaction3");
    	    query.execute();
    	    if (true) {
                throw new RuntimeException("Intentional Exception");
            }
    	    StoredProcedureQuery query1 = entityManager.createStoredProcedureQuery("sp_example_transaction4");
    	    query1.execute();
    	    // Commit the transaction
    	    entityManager.getTransaction().commit();
    	} catch (Exception e) {
    	    e.printStackTrace();
    	} finally {
    	    entityManager.close();
    	    entityManagerFactory.close();
    	}
    }
}
