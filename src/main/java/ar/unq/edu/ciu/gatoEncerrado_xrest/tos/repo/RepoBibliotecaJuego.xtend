package ar.unq.edu.ciu.gatoEncerrado_xrest.tos.repo

import dominioElementosDeljuego.BibliotecaDeJuego
import java.util.List
import java.util.ArrayList
import dominioElementosDeljuego.Laberinto
import ar.unq.edu.ciu.gatoEncerrado_xrest.tos.LaberintoMin

class RepoBibliotecaJuego {

	List<BibliotecaDeJuego> bibliotecas;
	RepoImagenes repoImagenes;
	
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


	
}