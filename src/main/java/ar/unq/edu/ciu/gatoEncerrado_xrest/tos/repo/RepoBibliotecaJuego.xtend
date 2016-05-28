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
import org.eclipse.xtend.lib.annotations.Accessors
import dominioElementosDeljuego.Jugador

// repo biblioteca es un nombre muy feo, en el ejemplo de libros se llamaba Biblioteca porque era un ejemplo que manejaba libros
// entonces el que maneja los libros es un objeto biblioteca
// en tu caso si no tenemos una abstraccion 
@Accessors
class RepoBibliotecaJuego {

	BibliotecaDeJuego biblioteca; // Pensar aca si no es mejor un Map ,para buscar las bibliotecas de juego por id del jugador
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
		
// CODIGO DE TESTING		
		biblioteca = new BibliotecaDeJuego() => [
			agregarLaberinto(new Laberinto("Mansion de la Muerte") => [ 
			agregarHabitacion("Hall de entrada")
			agregarHabitacion("Torre Principal")
			agregarHabitacion("Habitacion de la Reina")
			])
			agregarLaberinto(new Laberinto("Laberinto Oscuro") => [ 
			agregarHabitacion("Patio")
			agregarHabitacion("Entrada")
			agregarHabitacion("Habitacion")
			])
			agregarLaberinto(new Laberinto("Laberinto Solidario") => [ 
			agregarHabitacion("Cocina")
			agregarHabitacion("Entrada")
			agregarHabitacion("Sala")
			])
		]
		repoImagenes = new RepoImagenes;
		repoUsuario = new RepoUsuarios
// Ubicacion de imagenes arbitraria	
		repoImagenes.agregarImagen(biblioteca.laberintos.get(0).id,"imagenes/casa-terror.jpg")
		repoImagenes.agregarImagen(biblioteca.laberintos.get(1).id,"imagenes/laberinto1.jpg")
//27-05 Codigo de Prueba Horrible ,mejorarlo en la tarde		
		val usuario1= new Jugador("NANANANABATMAN")
		usuario1.inicializarPartida(biblioteca.laberintos.get(0))
		usuario1.inicializarPartida(biblioteca.laberintos.get(1))
		repoUsuario.agregarUsuario(usuario1)
		println("ID de usuario de prueba   " + usuario1.id)
		println("ID de Laberinto de prueba  " + biblioteca.laberintos.get(0).id)
	}
	
	
	def String getPath(int id) {
		return this.repoImagenes.getPath(id);
	}
	
	
	def buscarLab(Integer integer) {
		 return biblioteca.laberintos.findFirst[lab | lab.id.equals(integer)]
	}
	

	
}
