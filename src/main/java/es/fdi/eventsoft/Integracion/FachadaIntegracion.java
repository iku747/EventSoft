package es.fdi.eventsoft.Integracion;

import es.fdi.eventsoft.Integracion.imp.ServicioIntegracionImp;
import es.fdi.eventsoft.Negocio.Entidades.Empleado;
import es.fdi.eventsoft.Negocio.Entidades.Usuario.Cliente;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;

/**
 * Created by Rodrigo de Miguel on 05/05/2017.
 */
public interface FachadaIntegracion<T> {

        static <T> FachadaIntegracion<T> newInstance(Class<T> t){
                return new ServicioIntegracionImp(t);
        }


        public abstract void alta(T t);

        public abstract void baja(Long id);

        public abstract void modifica(T t);

        public abstract T consulta(Long id);

        public abstract List<T> listado();

        public abstract Long getRowCount();

}
