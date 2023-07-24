package com.txFun;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class TxFun {
    public static void main(String[] args) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("YourPersistenceUnitName");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            entityManager.getTransaction().begin();

            // Call the first function (fn_example_transaction1)
            Query query1 = entityManager.createNativeQuery("SELECT fn_example_transaction1()");
            query1.executeUpdate();

            // Call the second function (fn_example_transaction2)
            Query query2 = entityManager.createNativeQuery("SELECT fn_example_transaction2()");
            query2.executeUpdate();

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
