package uz.pdp.carenestclinic.repo;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import uz.pdp.carenestclinic.entity.Role;
import uz.pdp.carenestclinic.entity.Users;

import java.util.List;

import static uz.pdp.carenestclinic.config.MyListener.EMF;

public class UserRepo {

    public static List<Users> getPatient(String search) {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            Query selectFromUsers;
            selectFromUsers = entityManager.createQuery("select u from Users u where (:search IS NULL OR u.phone = :search ) and " +
                                                        "u.role = :role", Users.class)
                    .setParameter("search", search)
                    .setParameter("role", Role.PATIENT);
            return selectFromUsers.getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Users> getDoctor() {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.createQuery("select u from Users u where u.role =: role ", Users.class)
                    .setParameter("role", Role.DOCTOR)
                    .getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void assignPatientToDoctor(int patientId, int doctorId) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            entityManager.getTransaction().begin();
            Users patient = entityManager.createQuery("select u from Users u where u.id = :patientId", Users.class)
                    .setParameter("patientId", patientId)
                    .getSingleResult();
            Users doctor = entityManager.createQuery("select u from Users u where u.id = :doctorId", Users.class)
                    .setParameter("doctorId", doctorId)
                    .getSingleResult();
            patient.setAssignedDoctor(doctor);
            entityManager.merge(patient);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Users> getAllPatientsAssignedDoctor(int doctorId) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.createQuery("select u from Users u where u.status != 'COMPLETED' and u.assignedDoctor.id = :doctorId and u.role = :role order by createdDate desc ", Users.class)
                    .setParameter("doctorId", doctorId)
                    .setParameter("role", Role.PATIENT)
                    .getResultList();
        }
    }

    public static List<Users> getUserByPhoneNumberAndPassword(String phoneNumber, String password) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            entityManager.getTransaction().begin();
            List<Users> users = entityManager.createQuery("select u from Users u where u.phone = :phoneNumber and u.password = :password", Users.class)
                    .setParameter("phoneNumber", phoneNumber)
                    .setParameter("password", password)
                    .getResultList();
            entityManager.getTransaction().commit();
            return users;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static Users createUser(Users user) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            entityManager.getTransaction().begin();
            entityManager.persist(user);
            entityManager.getTransaction().commit();
            return user;
        }
    }

    public static Users getUserById(int id) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.find(Users.class, id);
        }
    }

    public static void updateUser(Users user) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            entityManager.getTransaction().begin();
            entityManager.merge(user);
            entityManager.getTransaction().commit();
        }

    }

    public static List<Users> getUsersByDoctorId(int doctorId) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.createQuery("select u from Users u where u.status = 'COMPLETED' and u.assignedDoctor.id = :doctorId and u.role = :role order by createdDate desc ", Users.class)
                    .setParameter("doctorId", doctorId)
                    .setParameter("role", Role.PATIENT)
                    .getResultList();
        }
    }

}
