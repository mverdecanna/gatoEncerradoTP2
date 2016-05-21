package ar.unq.edu.ciu.gatoEncerrado_xrest.controller

import dominioElementosDeljuego.Laberinto
import java.util.List
import ar.unq.edu.ciu.gatoEncerrado_xrest.tos.LaberintoVista
import java.util.ArrayList
import ar.unq.edu.ciu.gatoEncerrado_xrest.tos.HabitacionMin
import ar.unq.edu.ciu.gatoEncerrado_xrest.tos.ElementoMin
import dominioElementosDeljuego.Item
import dominioElementosDeljuego.Habitacion
import dominioElementosDeljuego.Accion
import ar.unq.edu.ciu.gatoEncerrado_xrest.tos.AccionMin
import ar.unq.edu.ciu.gatoEncerrado_xrest.tos.LaberintoMin
import ar.unq.edu.ciu.gatoEncerrado_xrest.tos.repo.RepoImagenes
import dominioElementosDeljuego.EstadoDeJuego

class ControllerXrestModel {
	
	
	
	
	def static List<LaberintoMin> allLaberintosMin(List<Laberinto> laberintos,RepoImagenes img) {
		var List<LaberintoMin> aux = laberintos.map [lab| new LaberintoMin(lab.nombreLaberinto,img.getPath(lab.id),lab.id)]
		return aux
		}

	
	def static transformarALabMostrable( Laberinto laberinto,EstadoDeJuego est) {
	val habitacionesMin = new ArrayList<HabitacionMin>
	val inventarioMin= est.inventario.map[item|transformarItemEnElementoMin(item)]
	habitacionesMin.addAll(laberinto.habitaciones.map[hab| transformarHabitacionAHabitacionMin(hab,est)])
	
	return new LaberintoVista(laberinto.id,laberinto.nombreLaberinto,habitacionesMin,inventarioMin)	
		
		}
	
	def static transformarItemEnElementoMin(Item item) {
		return new ElementoMin(item.id,item.nombre,item.descripcion)
	}

	def static transformarHabitacionAHabitacionMin(Habitacion hab,EstadoDeJuego est){
		var accionesMin= est.accionesPartidaDeHab(hab).map[acc| transformarAccionAAccionMin(acc)]	
		return new HabitacionMin(hab.id,hab.nombreHabitacion,accionesMin)
		
	}
	
	def static transformarAccionAAccionMin(Accion acc){
		return new AccionMin(acc.id,acc.nombreAccion)
	}
	
}