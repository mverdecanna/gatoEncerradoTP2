package ar.unq.edu.ciu.gatoEncerrado_xrest.tos.repo

import java.util.Map
import dominioElementosDeljuego.Jugador

class RepoUsuarios {
	
	Map<Integer, Jugador> user;
	
	def getEstadoDeJuego(Integer userId,Integer laberintoId){
		
		 return user.get(userId).partidas.get(laberintoId)
		
	}


	
}