package ar.unq.edu.ciu.gatoEncerrado_xrest.tos.repo

import dominioElementosDeljuego.BibliotecaDeJuego
import java.util.List
import java.util.ArrayList
import dominioElementosDeljuego.Laberinto
import ar.unq.edu.ciu.gatoEncerrado_xrest.tos.LaberintoMin
import ar.unq.edu.ciu.gatoEncerrado_xrest.tos.LaberintoVista
import ar.unq.edu.ciu.gatoEncerrado_xrest.tos.HabitacionMin
import dominioElementosDeljuego.Habitacion
import ar.unq.edu.ciu.gatoEncerrado_xrest.tos.AccionMin
import dominioElementosDeljuego.Accion
import ar.unq.edu.ciu.gatoEncerrado_xrest.tos.ElementoMin
import dominioElementosDeljuego.Item

class RepoBibliotecaJuego {

	List<BibliotecaDeJuego> bibliotecas; // Pensar aca si no es mejor un Map ,para buscar las bibliotecas de juego por id del jugador
	RepoImagenes repoImagenes;
	RepoUsuarios repoUsuario;
	
	private static RepoBibliotecaJuego instance;
	
	def static RepoBibliotecaJuego instance(){
		if(instance == null){
			instance = new RepoBibliotecaJuego
		}
		instance
	}
	
	new(){
		bibliotecas = new ArrayList<BibliotecaDeJuego>();
		val	BibliotecaDeJuego biblioteca = new BibliotecaDeJuego() => [
			agregarLaberinto(new Laberinto("Mansion de la Muerte") => [ 
			agregarHabitacion("Hall de entrada")
			agregarHabitacion("Torre Principal")
			agregarHabitacion("Habitacion de la Reina")
			])
		]
		bibliotecas.add(biblioteca);
		repoImagenes = new RepoImagenes;
	}
	
	def getInventarioDeLaberintoDeUser(Integer idUser,Integer idLaberinto){
		repoUsuario.getInventario(idUser,idLaberinto)
	}
	def List<LaberintoMin> getLaberintosMin(){
		return this.allLaberintosMin(this.allLaberintos(this.bibliotecas));		
	}
	
	
	def List<LaberintoMin> allLaberintosMin(List<Laberinto> laberintos) {
		var List<LaberintoMin> aux = new ArrayList<LaberintoMin>();
		for(Laberinto laberinto: laberintos){
			aux.add(new LaberintoMin(laberinto.nombreLaberinto, this.getPath(laberinto.id), laberinto.id));
		}
		return aux;
	}
	
	def String getPath(int id) {
		return this.repoImagenes.getPath(id);
	}
	
	
	def List<Laberinto> allLaberintos(List<BibliotecaDeJuego> bibliotecas) {
		var List<Laberinto> aux = new ArrayList<Laberinto>();
		for(BibliotecaDeJuego biblioteca: bibliotecas){
			aux.addAll(biblioteca.laberintos);
		}
		print (aux);
		return aux;
	}

	
	def buscarLab(Integer idUsuario, Integer idLab) {
		val laberinto = new Laberinto()
		//return bibliotecas.get(idUsuario).getLaberinto(idLab)
		return laberinto
	}
	
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
