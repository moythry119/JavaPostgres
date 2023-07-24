package com.inttxsp;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.StoredProcedureQuery;

public class IntTxSp {
	public static void main(String[] args) {
    	EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("YourPersistenceUnitName");
    	EntityManager entityManager = entityManagerFactory.createEntityManager();

    	try {
    	    // Explicitly start a transaction
    	    entityManager.getTransaction().begin();

    	    // Execute the stored procedure
    	    StoredProcedureQuery query = entityManager.createStoredProcedureQuery("sp_transaction_exception_example");
    	    query.execute();
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
