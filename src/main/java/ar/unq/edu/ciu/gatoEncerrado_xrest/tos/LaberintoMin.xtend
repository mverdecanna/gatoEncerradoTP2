package ar.unq.edu.ciu.gatoEncerrado_xrest.tos;

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class LaberintoMin {
	
	String nombreLaberinto;
	String pathImage;
	int id;
	String descripcion;
	
	new(String nombre,String des, String path, int id){
		this.nombreLaberinto = nombre;
		this.pathImage = path;
		this.id = id;
		this.descripcion=des
	}
	
	new(String string, Integer id) {
		this.nombreLaberinto=string
		this.id=id
	}
	
	
}