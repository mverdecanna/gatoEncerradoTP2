package ar.unq.edu.ciu.gatoEncerrado_xrest.tos;

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class LaberintoMin {
	
	String nombreLaberinto;
	String pathImage;
	String id;
	String descripcion;
	Long idLong;
	
	new(String nombre,String des, String path, String id, Long idLong){
		this.nombreLaberinto = nombre;
		this.pathImage = path;
		this.id = id;
		this.descripcion=des
		this.idLong = idLong;
	}
	
	new(String string, String id) {
		this.nombreLaberinto=string
		this.id=id
	}
	
	
}