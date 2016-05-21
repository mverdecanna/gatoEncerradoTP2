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
		val laberintos=ControllerXrestModel.allLaberintosMin(RepoBibliotecaJuego.instance.biblioteca.laberintos, RepoBibliotecaJuego.instance.repoImagenes)
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
			val laberinto=RepoBibliotecaJuego.instance.buscarLab(idLab)
			//val estadoLab=RepoUsuarios.get(iduser).getEstadoDeJuegoDeLab(idlab)
	//		ok(ControllerXrestModel.transformarALabMostrable(laberinto,RepoBibliotecaJuego.instance..toJson)
		ok()
		} 
		catch (UserException e) {
			notFound("No existe el laberinto con '" + idLab + "'");
		}
	}
	@Get("/hacerAccion/:idhab :idacc")
	def Result hacerAccion(){
		val idHab =Integer.valueOf(idhab)
		val idAcc=Integer.valueOf(idacc)
		
		try {
			response.contentType = "application/json"
			ok()
		} 
		catch (UserException e) {
			notFound("No existe la accion en la habitacion ");
		}
		
		ok()
		
		
	}
		
		
		
	}
