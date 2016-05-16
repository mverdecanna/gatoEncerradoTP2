package ar.unq.edu.ciu.gatoEncerrado_xrest.controller;

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.http.ContentType
import ar.unq.edu.ciu.gatoEncerrado_xrest.tos.repo.RepoBibliotecaJuego

import org.uqbar.commons.model.UserException


@Controller
class GatoEncerradoController {
	
	
	extension JSONUtils = new JSONUtils

	def static void main(String[] args) {
		XTRest.start(GatoEncerradoController, 9000)
	}

	@Get("/laberintos")
	def Result laberintos() {
		val laberintos =  RepoBibliotecaJuego.instance.laberintosMin;
		response.contentType = ContentType.APPLICATION_JSON;
		ok(laberintos.toJson);
	}
	
	@Get("/laberinto/:iduser :idlab")	
	def Result laberinto()
	{
		val idLab =Integer.valueOf(idlab)
		val idUser=Integer.valueOf(iduser)
		
		try {
			response.contentType = "application/json"
			val laberinto=RepoBibliotecaJuego.instance.buscarLab(idUser,idLab)
			ok(RepoBibliotecaJuego.transformarALabMostrable(laberinto,RepoBibliotecaJuego.instance.getInventarioDeLaberintoDeUser(idUser,idLab)).toJson)
		} 
		catch (UserException e) {
			notFound("No existe el laberinto con '" + idLab + "'");
		}
	}
		
		
		
	}
