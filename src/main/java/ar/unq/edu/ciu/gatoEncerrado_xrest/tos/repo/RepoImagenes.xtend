package ar.unq.edu.ciu.gatoEncerrado_xrest.tos.repo

import java.util.Map
import java.util.HashMap

class RepoImagenes {
	
	Map<Integer, String> paths;
	

	new (){
		paths = new HashMap;
		
	}

	def agregarImagen(Integer id,String path){
		
		paths.put(id,path)
	}
	def String getPath(int id) {
	if(paths.containsKey(id))	
		{return this.paths.get(id);}
	else 
		{ return "no hay imagen"}	
		 
	}

/**
 * pensar como se instancia con valores consistentes las entradas del Map
 * especialmente caso de new Laberinto
 */
	
	
}


