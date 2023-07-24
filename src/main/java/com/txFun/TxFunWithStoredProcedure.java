package com.txFun;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.ParameterMode;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;

import org.hibernate.procedure.ProcedureOutputs;

public class TxFunWithStoredProcedure {
	 public static void main(String[] args) {
		 
		  EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("YourPersistenceUnitName");
	        EntityManager entityManager = entityManagerFactory.createEntityManager();
		 
		 StoredProcedureQuery query = entityManager
				 .createStoredProcedureQuery("fn_example1")
				 .registerStoredProcedureParameter(
				     "p_count",
				     Long.class,
				     ParameterMode.OUT
				 );
				  
				 try {
				     query.execute();
				      
				     Long commentCount = (Long) query
				       .getOutputParameterValue("p_count");
				  
				     System.out.println(commentCount);
				     
				 } finally {
				     query.unwrap(ProcedureOutputs.class)
				     .release();
				 }
	    }
}
