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
import dominioElementosDeljuego.AccionIrAOtraHabitacion
import dominioElementosDeljuego.AccionAgarrarUnElemento
import dominioElementosDeljuego.AccionUsarUnElemento

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
		//Items		
		val item = new Item("Pan")
		val item2 = new Item("Bizcochito de grasa")
		val item3= new Item ('Mate')
		val item4= new Item("La espada de He-man")
		val item5= new Item ("El yo-yo de Magic")
		val item6= new Item ("El Osito Teddy")
		val item7= new Item("Objeto Inutil de Inventario")
		val item8= new Item("Botella de Grog")
		//Habitaciones
		val hab3= new Habitacion ("Habitacion de la Reina")=>[
			agregarElementoALaHabitacion(item2)
			agregarAccion(new AccionAgarrarUnElemento(item2))
			agregarAccion(new AccionUsarUnElemento(item2,new AccionAgarrarUnElemento(item3)))
		]
		val hab2= new Habitacion("Torre Principal")=>[
			agregarAccion(new AccionUsarUnElemento(item4,new AccionIrAOtraHabitacion(hab3)))
		]
		val hab1= new Habitacion("Hall de entrada")=>[
			agregarElementoALaHabitacion(item4)
			agregarAccion(new AccionAgarrarUnElemento(item4))
			agregarAccion(new AccionIrAOtraHabitacion(hab2))
			esHabitacionInicial
		]
		val hab6= new Habitacion("Aula 37 B")=>[
			agregarElementoALaHabitacion(item6)
			agregarAccion(new AccionUsarUnElemento(item5,new AccionAgarrarUnElemento(item6)))
			
		]
		val hab5= new Habitacion("La Fundidora de Springfield")=>[
			agregarAccion(new AccionIrAOtraHabitacion(hab6))	
		]
		val hab4 = new Habitacion("El Amalfitani")=>[
			agregarElementoALaHabitacion(item5)
			agregarAccion(new AccionIrAOtraHabitacion(hab5))
			agregarAccion(new AccionAgarrarUnElemento(item5))
			esHabitacionInicial
		]
		
		//Laberintos
		val lab2= new Laberinto("Laberinto Chevere","Es un laberinto entretenido")=>[
			agregarHabitacionPreArmada(hab6)
			agregarHabitacionPreArmada(hab5)
			agregarHabitacionPreArmada(hab4)
			
		]
		lab2.idHardcode = 5
		
		val lab1= new Laberinto("Mansion de la Muerte","Si llegaste hasta aca venimos bien") => [ 
			agregarHabitacionPreArmada(hab1)
			agregarHabitacionPreArmada(hab2)
			agregarHabitacionPreArmada(hab3)
		]
		lab1.idHardcode=4
		
		val lab3= new Laberinto("Armada Invencible","La tercera es la vencida")=>[
			agregarHabitacionPreArmada(hab6)
			agregarHabitacionPreArmada(hab5)
			agregarHabitacionPreArmada(hab4)
		]
		lab3.idHardcode=6
		
		//Usuario
		val usuario1= new Jugador("NANANANABATMAN")
		
		biblioteca = new BibliotecaDeJuego() => [
			agregarLaberinto(lab1)
			agregarLaberinto(lab2)
			agregarLaberinto(lab3) 
			
			]
			repoImagenes = new RepoImagenes;
			repoUsuario = new RepoUsuarios
		//Imagenes para el repo	
		repoImagenes.agregarImagen(lab1.id,"img923/6774/ujKH1s.jpg")
		repoImagenes.agregarImagen(lab2.id,"img924/7259/OBSiVb.jpg")
		repoImagenes.agregarImagen(lab3.id,"img924/9435/ZSwNh1.jpg")
		repoImagenes.agregarImagen(hab5.id,"imagenes/casa-embrujada.jpg")
		repoImagenes.agregarImagen(hab6.id,"imagenes/casa-embrujada.jpg")
		repoImagenes.agregarImagen(hab3.id,"imagenes/habitacionTerror.jpg")	
		repoImagenes.agregarImagen(hab2.id,"imagenes/habitacionTerror1.jpg")	
		repoImagenes.agregarImagen(hab1.id,"imagenes/habitacionNormal.jpg")	
		
		
		//Inicializacion de partidas
		usuario1.inicializarPartida(biblioteca.laberintos.get(0))
		usuario1.partidaJugando.inventario.add(item8)
		usuario1.partidaJugando.inventario.add(item7)
		usuario1.inicializarPartida(biblioteca.laberintos.get(1))
		usuario1.partidaJugando.inventario.add(item2)
		usuario1.inicializarPartida(biblioteca.laberintos.get(2))	
		usuario1.partidaJugando.inventario.add(item3)
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
