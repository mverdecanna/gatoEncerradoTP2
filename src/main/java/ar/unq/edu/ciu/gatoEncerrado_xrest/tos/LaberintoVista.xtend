package ar.unq.edu.ciu.gatoEncerrado_xrest.tos

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ObjetoMin {
Integer id
String nombre
	new(Integer id,String nombre)
	{
		this.id=id
		this.nombre=nombre
	}
}

@Accessors	
class LaberintoVista extends ObjetoMin{
List<HabitacionMin> habitacionesmin
List<ElementoMin> inventarioMin
	
	new (Integer id,String nombre,List<HabitacionMin> hab,List<ElementoMin> inv){
		super(id,nombre)
		this.habitacionesmin=hab
		this.inventarioMin=inv
	
}
}

class ElementoMin extends ObjetoMin {
	String descripcion
	
	new(Integer id, String nombre,String des) {
		super(id, nombre)
	this.descripcion=des
	}
	
}




class HabitacionMin extends ObjetoMin{
	List<AccionMin> acciones
	
	new(Integer id, String nombre,List<AccionMin> acc) {
		super(id, nombre)
	this.acciones=acc
	}
	
	}

class AccionMin extends ObjetoMin {
	
	new(Integer id, String nombre) {
		super(id, nombre)
	}
	
	}