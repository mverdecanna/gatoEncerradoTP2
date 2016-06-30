package ar.unq.edu.ciu.gatoEncerrado_xrest.controller

import ar.unq.edu.ciu.gatoEncerrado_xrest.tos.AccionMin
import ar.unq.edu.ciu.gatoEncerrado_xrest.tos.ElementoMin
import ar.unq.edu.ciu.gatoEncerrado_xrest.tos.HabitacionMin
import ar.unq.edu.ciu.gatoEncerrado_xrest.tos.LaberintoMin
import ar.unq.edu.ciu.gatoEncerrado_xrest.tos.LaberintoVista
import ar.unq.edu.ciu.gatoEncerrado_xrest.tos.repo.RepoImagenes
import dominioElementosDeljuego.Accion
import dominioElementosDeljuego.EstadoDeJuego
import dominioElementosDeljuego.Habitacion
import dominioElementosDeljuego.Item
import dominioElementosDeljuego.Jugador
import dominioElementosDeljuego.Laberinto
import java.util.List
import dominioElementosDeljuego.ResultadoAccion
import ar.unq.edu.ciu.gatoEncerrado_xrest.tos.ResultadoAccionMin

// NO SE ENTIENDE BIEN LA RESPONSABILIDAD ACA, no es un controller, pero esta en el medio de todo al fin y al cabo lo que hace
// son 2 cosas: hacer la accion del dominio y transformar a los tos, idealmente podriamos dejarle solo la responsabilidad
// de hacer las invocaciones de dominio y en ese caso quizas un mejor nombre sea JugarService
// sino, si queremos que haga las transformaciones a los resultados LabertintoTransformer. Si lo dejan como LaberintoTransformer, no hay que cambiar tanto
class JuegoTransformer {
	
	
	//el nombre deberia de ser toLaberintoTo
	def static List<LaberintoMin> toLaberintoTo(List<Laberinto> laberintos, RepoImagenes img) {
		//la imagen puede ser un atributo del objeto laberinto
		laberintos.map [lab| new LaberintoMin(lab.nombreLaberinto,lab.descripcion, img.getPath(lab.id), Integer.toString(lab.id), lab.id.longValue )]
	}
	
	def static LaberintoMin toLaberintoAlone(Laberinto lab, RepoImagenes img){
		return new LaberintoMin(lab.nombreLaberinto,lab.descripcion, img.getPath(lab.id), Integer.toString(lab.id), lab.id.longValue );
	}
	
	def static toInventarioLaberintoTo(EstadoDeJuego juego) 
	   {
	    return juego.inventario.map[item|ar.unq.edu.ciu.gatoEncerrado_xrest.controller.JuegoTransformer.toItemEnInventarioTo(item)]
	    }

	//el nombre deberia de ser toLaberintoEnCursoTo
	def static toLaberintoEnCursoTo( Laberinto laberinto, EstadoDeJuego juego,RepoImagenes img) {
		val inventarioMin = juego.inventario.map[item|ar.unq.edu.ciu.gatoEncerrado_xrest.controller.JuegoTransformer.toItemEnInventarioTo(item)]
		val habitacionesMin = laberinto.habitaciones.map[hab| ar.unq.edu.ciu.gatoEncerrado_xrest.controller.JuegoTransformer.toHabitacionEnLaberintoTo(hab,juego,img)]
		val habMostrar = ar.unq.edu.ciu.gatoEncerrado_xrest.controller.JuegoTransformer.toHabitacionEnLaberintoTo(juego.habitacionActual, juego,img)
		return new LaberintoVista(laberinto.id, laberinto.nombreLaberinto, habitacionesMin, inventarioMin, habMostrar)
	}

	//el nombre deberia de ser toItemEnInventarioTo
	def static toItemEnInventarioTo(Item item) {
		return new ElementoMin(item.id, item.nombre, item.descripcion)
	}

	//el nombre deberia de ser toHabitacionEnLaberintoTo
	def static toHabitacionEnLaberintoTo(Habitacion hab, EstadoDeJuego est,RepoImagenes img){
		var accionesMin = est.accionesPartidaDeHab(hab).map[acc| transformarAccionAAccionMin(acc)]
			
		return new HabitacionMin(hab.id, hab.nombreHabitacion, accionesMin,img.getPath(hab.id))	
	}
	
	
	def static transformarAccionAAccionMin(Accion acc){
		return new AccionMin(acc.id, acc.nombreAccion)
	}
	
	
	
	
	def static toResultadoAccionTo(ResultadoAccion resultado) {
		
		return new ResultadoAccionMin(resultado.tipo,resultado.datos)
	}
	
}