package com.jpa.newJPA;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class UpdateSP_N {
    public static void main(String[] args) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("YourPersistenceUnitName");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            entityManager.getTransaction().begin();

            Query nativeQuery = entityManager.createNativeQuery("CALL update_customer(CAST(:newcustomerno AS VARCHAR(20)),CAST(:newcustomername AS VARCHAR(100)))");
            nativeQuery.setParameter("newcustomerno", "223");
            nativeQuery.setParameter("newcustomername", "Abdul");

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
