package ar.unq.edu.ciu.gatoEncerrado_xrest.controller

import dominioElementosDeljuego.Habitacion

class ResultadoAccionMoverse extends ResultadoAccion {
	Habitacion habitacionAcual;
	
	
	new(Habitacion habitacionAcual){
		this.habitacionActual = habitacionActual;R
	}
	
	def List<Dato> getDatos(){
		List<Dato> datos = newArrayList
		datos.add(new Dato ("habitacionActual", habitacionActual))
		datos
	}
	
}