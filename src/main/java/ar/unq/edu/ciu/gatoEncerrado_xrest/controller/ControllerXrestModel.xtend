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

class ControllerXrestModel {
	
	
	
	
//	
//	def getInventarioDeLaberintoDeUser(Integer idUser,Integer idLaberinto){
//		repoUsuario.getInventario(idUser,idLaberinto)
//	}
//	def List<LaberintoMin> getLaberintosMin(){
//		return this.allLaberintosMin(this.allLaberintos(this.bibliotecas));		
//	}
//	
//	
	def static List<LaberintoMin> allLaberintosMin(List<Laberinto> laberintos,RepoImagenes img) {
		var List<LaberintoMin> aux = laberintos.map [lab| new LaberintoMin(lab.nombreLaberinto,img.getPath(lab.id),lab.id)]
		return aux
		}
//	
//	def String getPath(int id) {
//		return this.repoImagenes.getPath(id);
//	}
//	
//	
//	def List<Laberinto> allLaberintos(List<BibliotecaDeJuego> bibliotecas) {
//		var List<Laberinto> aux = new ArrayList<Laberinto>();
//		for(BibliotecaDeJuego biblioteca: bibliotecas){
//			aux.addAll(biblioteca.laberintos);
//		}
//		print (aux);
//		return aux;
//	}
//	
////	def buscarLab(Integer idUsuario, Integer idLab) {
////		val laberinto = new Laberinto()
////		//return bibliotecas.get(idUsuario).getLaberinto(idLab)
////		return laberinto
////	}
	
	def static transformarALabMostrable( Laberinto laberinto,List<Item> inventario) {
	val habitacionesMin = new ArrayList<HabitacionMin>
	val inventarioMin= inventario.map[item|transformarItemEnElementoMin(item)]
	habitacionesMin.addAll(laberinto.habitaciones.map[hab| transformarHabitacionAHabitacionMin(hab)])
	
	return new LaberintoVista(laberinto.id,laberinto.nombreLaberinto,habitacionesMin,inventarioMin)	
		
		}
	
	def static transformarItemEnElementoMin(Item item) {
		return new ElementoMin(item.id,item.nombre,item.descripcion)
	}

	def static transformarHabitacionAHabitacionMin(Habitacion hab){
		var accionesMin= hab.acciones.map[acc| transformarAccionAAccionMin(acc)]	
		return new HabitacionMin(hab.id,hab.nombreHabitacion,accionesMin)
		
	}
	
	def static transformarAccionAAccionMin(Accion acc){
		return new AccionMin(acc.id,acc.nombreAccion)
	}
}