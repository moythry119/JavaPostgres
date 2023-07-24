package com.txsp;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.StoredProcedureQuery;

public class MultipleSPWithException {
	 public static void main(String[] args) {
	    	EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("YourPersistenceUnitName");
	    	EntityManager entityManager = entityManagerFactory.createEntityManager();

	    	try {
	    	    // Explicitly start a transaction
	    	    entityManager.getTransaction().begin();

	    	    // Execute the stored procedure
	    	    StoredProcedureQuery query = entityManager.createStoredProcedureQuery("sp_example_1");
	    	    query.execute();
	    	    
	    	    StoredProcedureQuery query1 = entityManager.createStoredProcedureQuery("sp_example_2");
	    	    query1.execute();
	    	    
	    	    StoredProcedureQuery query2 = entityManager.createStoredProcedureQuery("sp_example_3");
	    	    query2.execute();
	    	    
	    	   
	    	    
	    	    
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
