package ar.unq.edu.ciu.gatoEncerrado_xrest.tos

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import dominioElementosDeljuego.Dato

@Accessors
class ObjetoMin {
	
	Integer id
	String nombre

	new(Integer id, String nombre){
		this.id = id
		this.nombre = nombre
	}
	
}



@Accessors
class ElementoMin extends ObjetoMin {
	
	String descripcion
	
	new(Integer id, String nombre, String des) {
		super(id, nombre)
		this.descripcion = des
	}
	
}



@Accessors
class HabitacionMin extends ObjetoMin{
	
	List<AccionMin> acciones
	
	new(Integer id, String nombre, List<AccionMin> acc) {
		super(id, nombre)
		this.acciones = acc
	}
	
}


@Accessors
class AccionMin extends ObjetoMin {
	
	new(Integer id, String nombre) {
		super(id, nombre)
	}
	
}

@Accessors
class ResultadoMin extends ObjetoMin{
	
	List<Dato> datos;
	
	new(String tipo, List<Dato> datos) {
		super(0, tipo)
		this.datos = datos
	}
	
}




@Accessors	
class LaberintoVista extends ObjetoMin {
	
	List<HabitacionMin> habitacionesMin
	List<ElementoMin> inventarioMin
	HabitacionMin habitacionMostrar

	
	new (Integer id, String nombre, List<HabitacionMin> hab, List<ElementoMin> inv, HabitacionMin habMin){
		super(id,nombre)
		this.habitacionesMin = hab
		this.inventarioMin = inv
		this.habitacionMostrar = habMin
	}
	
}










