package com.nestedtransaction;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.StoredProcedureQuery;
import com.entity.Account;

public class NestedTransaction {
	 public static void main(String[] args) {
	        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("YourPersistenceUnitName");
	        EntityManager entityManager = entityManagerFactory.createEntityManager();

	        try {
	            // Explicitly start a transaction
	            entityManager.getTransaction().begin();

	            StoredProcedureQuery query = entityManager.createStoredProcedureQuery("sp_example_transaction4");
	    	    query.execute();

	            
	            
	            
	            
	            // Create and persist the entity to insert data into the table
	            Account account = new Account();
	            account.setCoaaccountno("12345");
	            account.setCoaaccountname("Sample Account1");
	            account.setCoacurrencycode("USD");
	            entityManager.persist(account);

	            // Execute the stored procedure with the inserted data as a parameter
	           

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
