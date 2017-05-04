package es.fdi.eventsoft.negocio.servicios;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.lang.reflect.ParameterizedType;
import java.util.List;

public abstract class Servicio<T> {
    protected static EntityManagerFactory emf = FactoriaSA.EMF;
    protected static EntityManager em;
    private Class<T> entityClass;

    public Servicio() {
        ParameterizedType genericSuperclass = (ParameterizedType) getClass().getGenericSuperclass();
        this.entityClass = (Class<T>) genericSuperclass.getActualTypeArguments()[0];
    }

    public void alta(T t) {
        em = emf.createEntityManager();

        try {
            em.getTransaction().begin();
            em.merge(t);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw e;
        }
    }

    public void baja(Long id) {
        em = emf.createEntityManager();

        try {
            em.getTransaction().begin();
            T t = em.find(entityClass, id);
            em.remove(t);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
        }
    }

    public void modifica(T t) {
        em = emf.createEntityManager();

        try {
            em.getTransaction().begin();
            em.merge(t);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
        }
    }

    public T consulta(Long id) {
        em = emf.createEntityManager();
        T t = em.find(entityClass, id);
        em.close();

        return t;
    }

    public List<T> listado() {
        em = emf.createEntityManager();
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<T> cq = cb.createQuery(entityClass);
        Root<T> root = cq.from(entityClass);
        CriteriaQuery<T> all = cq.select(root);
        TypedQuery<T> allQuery = em.createQuery(all);
        List<T> listado = allQuery.getResultList();
        em.close();

        return listado;
    }

    public Long getRowCount() {
        em = emf.createEntityManager();
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Long> cq = cb.createQuery(Long.class);
        cq.select(cb.count(cq.from(entityClass)));
        Long count = em.createQuery(cq).getSingleResult();
        em.close();

        return count;
    }
}