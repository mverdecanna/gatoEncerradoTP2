package ar.unq.edu.ciu.gatoEncerrado_xrest.tos.repo

import java.util.Map
import dominioElementosDeljuego.Jugador

class RepoUsuarios {
	
	//nombre user no es lo mejor para este mapa, en todo caso jugadorxid o algo similar
	Map<Integer, Jugador> user;
	
	def getUsuario(Integer userId){
		user.get(userId)
	}
	
	def getEstadoDeJuego(Integer userId,Integer laberintoId){
		
		  user.get(userId).partidas.get(laberintoId)
		
	}


	
}