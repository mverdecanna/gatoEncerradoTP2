package ar.unq.edu.ciu.gatoEncerrado_xrest.tos;

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class LaberintoMin {
	
	String nombreLaberinto;
	String pathImage;
	int id;
	
	
	new(String nombre, String path, int id){
		this.nombreLaberinto = nombre;
		this.pathImage = path;
		this.id = id;
	}
	
	
}