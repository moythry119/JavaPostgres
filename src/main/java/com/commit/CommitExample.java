package com.commit;

import javax.persistence.EntityManager;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.StoredProcedureQuery;



///This class shows error as there is a commit statement inside the calling Stored Procedure.

public class CommitExample {

    public static void main(String[] args) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("YourPersistenceUnitName");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            // Explicitly start a transaction
  //      entityManager.getTransaction().begin();

            // Execute the stored procedure
            StoredProcedureQuery query = entityManager.createStoredProcedureQuery("call_from_java");
            query.execute();

            // Do not commit the transaction
            //entityManager.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            entityManager.close();
            entityManagerFactory.close();
        }
    }
}
