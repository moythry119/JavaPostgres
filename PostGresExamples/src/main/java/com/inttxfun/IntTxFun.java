package com.inttxfun;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class IntTxFun {
	  public static void main(String[] args) {
	        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("YourPersistenceUnitName");
	        EntityManager entityManager = entityManagerFactory.createEntityManager();

	        try {
	            entityManager.getTransaction().begin();

	            entityManager.createNativeQuery("DO $$ BEGIN PERFORM fn_example_transaction_with_internal_exception(); END $$").executeUpdate();
	            
	         

	            entityManager.getTransaction().commit();
	        } catch (Exception e) {
	            entityManager.getTransaction().rollback();
	            e.printStackTrace();
	        } finally {
	            entityManager.close();
	            entityManagerFactory.close();
	        }
	    }
}
