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
	
	
	new(TipoDeAccion tipo, List<Dato> datos){
		super(0,"resultado")
		this.tipo=tipo
		this.datos=datos
	
//		this.tipo = toTipoDeAccionMin(tipo)
//		this.datos = toDatosMin(datos);
//		buildTipoDeAccion(tipo)
	}
	

	def toDatosMin(List<Dato> datos) {
		
	}
	
	def toTipoDeAccionMin(TipoDeAccion accion) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	
}