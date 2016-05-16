package ar.unq.edu.ciu.gatoEncerrado_xrest.tos.repo

import java.util.Map
import java.util.HashMap

class RepoImagenes {
	
	Map<Integer, String> paths;
	

	new (){
		paths = new HashMap;
		paths.put(1, "zaraza");	
	}

	
	def String getPath(int id) {
		//return this.paths.get(id);
		return "zaraza"; 
	}

/**
 * pensar como se instancia con valores consistentes las entradas del Map
 * especialmente caso de new Laberinto
 */
	
	
}


