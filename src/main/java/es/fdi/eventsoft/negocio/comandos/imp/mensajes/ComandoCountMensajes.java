package es.fdi.eventsoft.negocio.comandos.imp.mensajes;

import es.fdi.eventsoft.negocio.comandos.Comando;
import es.fdi.eventsoft.negocio.comandos.Contexto;
import es.fdi.eventsoft.negocio.comandos.EventosNegocio;
import es.fdi.eventsoft.negocio.servicios.factoria.FactoriaSA;

/**
 * Created by Rodrigo de Miguel on 09/05/2017.
 */
public class ComandoCountMensajes implements Comando {

    public Contexto execute(Object datos){
        return new Contexto(EventosNegocio.COUNT_MENSAJES, FactoriaSA.getInstance().crearSAMensajes().totalMensajes());
    }

}
