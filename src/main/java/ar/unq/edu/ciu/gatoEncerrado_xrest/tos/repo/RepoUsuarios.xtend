package ar.unq.edu.ciu.gatoEncerrado_xrest.tos.repo

import java.util.Map
import dominioElementosDeljuego.Jugador
import java.util.HashMap

class RepoUsuarios {
	
	//nombre user no es lo mejor para este mapa, en todo caso jugadorxid o algo similar
	Map<Integer, Jugador> user;
	
	new (){
		user= new HashMap
	}
	def agregarUsuario(Jugador jug){
		
		user.put(jug.id,jug)
		
	}
	def getUsuario(Integer userId){
		user.get(userId)
	}
	
	def getEstadoDeJuego(Integer userId,Integer laberintoId){
		// 27-05:PENSAR REFACTOR De este metodo,ya que el estado de juego a traer deberia ser el actual para no depender de laberinto
		
		  this.getUsuario(userId).partidas.get(laberintoId)
		
	}


	
}