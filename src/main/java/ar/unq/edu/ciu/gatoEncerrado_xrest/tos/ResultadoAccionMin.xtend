package ar.unq.edu.ciu.gatoEncerrado_xrest.tos

import dominioElementosDeljuego.Dato
import java.util.List
import dominioElementosDeljuego.TipoDeAccion

class ResultadoAccionMin extends ObjetoMin{
	
	TipoDeAccion tipo;
	List<Dato> datos;
	
	
	new(Integer id, String nombre) {
		super(id, nombre)
	}
	
//	
//	new(TipoDeAccion tipo, List<Dato> datos){
//		this.tipo = tipo;
//		this.datos = datos;
//	}
//	
	
}