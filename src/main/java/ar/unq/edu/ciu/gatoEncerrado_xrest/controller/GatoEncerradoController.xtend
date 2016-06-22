package ar.unq.edu.ciu.gatoEncerrado_xrest.controller;

import ar.unq.edu.ciu.gatoEncerrado_xrest.tos.repo.RepoBibliotecaJuego
import org.uqbar.commons.model.UserException
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils

@Controller
class GatoEncerradoController {
	extension JSONUtils = new JSONUtils

	def static void main(String[] args) {
		XTRest.start(GatoEncerradoController, 7000)
	}

	@Get("/laberintos")
	def Result laberintos() {

		// aca falta tener en cuenta que los laberintos tienen un estado que depende del usuario (si lo termino o no)
		val laberintos = JuegoTransformer.toLaberintoTo(RepoBibliotecaJuego.instance.biblioteca.laberintos,
			RepoBibliotecaJuego.instance.repoImagenes)
		response.contentType = ContentType.APPLICATION_JSON;
		println("PASE POR ACA")
		ok(laberintos.toJson);
	}

	@Get("/laberinto/:iduser/:idlab")
	// NOTA 22-05:NO TUVIMOS EN CUENTA EL REPO DE IMAGENES ACA,REVISAR
	def Result laberinto() {

		val idLab = Integer.valueOf(idlab)
		val idUser = Integer.valueOf(iduser)

		try {
			response.contentType = "application/json"
			val laberinto = RepoBibliotecaJuego.instance.buscarLab(idLab)
			val estadoLab = RepoBibliotecaJuego.instance.repoUsuario.getUsuario(idUser).inicializarPartida(laberinto)
			ok(JuegoTransformer.toLaberintoEnCursoTo(laberinto, estadoLab,RepoBibliotecaJuego.instance.repoImagenes).toJson)
		} catch (UserException e) {
			// aca lo ideal es que sea la excepcion la que tenga la info extra que necestitas, y en vez de que sea una generica, que sea una excepcion particular para tu dominio
			notFound("No existe el laberinto con '" + idLab + "'");
		}
	}
	
	@Get("/laberinto/:iduser")
	def Result laberintoo(){
		val idUser=Integer.valueOf(iduser)
		
		try {
			response.contentType = "application/json"
			val est = RepoBibliotecaJuego.instance.repoUsuario.getUsuario(idUser).partidaJugando
			val habitacion = RepoBibliotecaJuego.instance.repoUsuario.getUsuario(idUser).partidaJugando.habitacionActual
			ok(JuegoTransformer.toHabitacionEnLaberintoTo(habitacion,est,RepoBibliotecaJuego.instance.repoImagenes).toJson)
			}
		catch(UserException e) {
			// aca lo ideal es que sea la excepcion la que tenga la info extra que necestitas, y en vez de que sea una generica, que sea una excepcion particular para tu dominio
			notFound("No existe el laberinto con '" +  "'");
		}
		
	}
		
	@Get("/hacerAccion/:idhab/:idacc/:iduser")
	def Result hacerAccion() {
		val idHab = Integer.valueOf(idhab)
		val idAcc = Integer.valueOf(idacc)
		val idUser = Integer.valueOf(iduser)

		try {
			println(idAcc)
			println(idHab)
			val jugador = RepoBibliotecaJuego.instance.repoUsuario.getUsuario(idUser)
			println(jugador)
			println(jugador.partidaJugando)
			val accion = jugador.partidaJugando.accionesDePartida.get(idHab)
			println(accion)
			val accion2= accion.findFirst[acc| acc.id == idAcc]
			println(accion2)
			val resultado= accion2.ejecutar(jugador,jugador.partidaJugando.habitacionActual)
			println(resultado)
	        val valorADevolver = JuegoTransformer.toResultadoAccionTo(resultado)
			response.contentType = "application/json"


// esta mal la respuesta, dependiendo de la accion es como s interpreta la respuesta....
/*
 * 
 * seria algo como....
 * 
 * 
 * el codigo que deberian de tener seria algo como:
 * 
 * 
 * 
 * val resultante = accion.ejecutar(jugador, habitacion);
 * 
 * 
 * 
 * 
 * 
 * 
 */
			ok(valorADevolver.toJson)
		} catch (UserException e) {
			notFound("No existe la accion en la habitacion ");
		}
//
	}

	@Get("/inventario/:idlab/:iduser")
	def Result  traerInventario(){
		val idLab = Integer.valueOf(idlab)
		val idUser = Integer.valueOf(iduser)

		try {
			response.contentType = "application/json"
			val laberinto = RepoBibliotecaJuego.instance.buscarLab(idLab)
			val estadoLab = RepoBibliotecaJuego.instance.repoUsuario.getUsuario(idUser).inicializarPartida(laberinto)
			ok(JuegoTransformer.toInventarioLaberintoTo(estadoLab).toJson)
	}
	catch (UserException e){
		notFound("No existe en el inv")
		
	}
	}

}
