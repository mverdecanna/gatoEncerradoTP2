package ar.unq.edu.ciu.gatoEncerrado_xrest.tos.repo

import java.util.Map
import dominioElementosDeljuego.Jugador

class RepoUsuarios {
	Map<Integer, Jugador> user;
	
	def getInventario(Integer userId,Integer laberintoId){
		//Mirar esto puesto para probar nomas
		user.get(userId)
	}
	
	}