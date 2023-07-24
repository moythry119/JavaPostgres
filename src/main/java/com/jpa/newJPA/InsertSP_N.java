package com.jpa.newJPA;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class InsertSP_N {
    public static void main(String[] args) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("YourPersistenceUnitName");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            entityManager.getTransaction().begin();

            Query nativeQuery = entityManager.createNativeQuery("CALL insert_customer(CAST(:p_customerno AS VARCHAR(20)),CAST(:p_customername AS VARCHAR(100)))");
            nativeQuery.setParameter("p_customerno", "223");
            nativeQuery.setParameter("p_customername", "Rahim");

            nativeQuery.executeUpdate();

            entityManager.getTransaction().commit();

            System.out.println("Stored procedure executed successfully.");
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            System.out.println("Failed to execute stored procedure: " + e.getMessage());
        } finally {
            entityManager.close();
            entityManagerFactory.close();
        }
    }
}
