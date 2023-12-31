package com.jpa.newJPA;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.ParameterMode;
import javax.persistence.Persistence;
import javax.persistence.StoredProcedureQuery;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TempTableSp {
	public static void main(String[] args) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("YourPersistenceUnitName");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            entityManager.getTransaction().begin();

            StoredProcedureQuery query = entityManager.createStoredProcedureQuery("insert_and_show_data");
            query.registerStoredProcedureParameter("result_text", String.class, ParameterMode.OUT);

            query.execute();

            String result_text = (String) query.getOutputParameterValue("result_text");

            System.out.println("result_text: " + result_text);

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
