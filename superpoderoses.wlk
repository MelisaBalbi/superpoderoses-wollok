/** Reemplazar por la solución del enunciado 
object wollok {
	method howAreYou() {
		return 'I am Wolloktastic!'
	}
}*/

class Personaje{
	var property estrategia =0
	var property espiritualidad=0
	var property poderes = []

	method capacidadDeBatalla(){
		//var totalCapacidad = 0
		//poderes.forEach{poder => totalCapacidad = totalCapacidad+ poder.capacidadPara(self)}//recorro poderes del pj con forEach, a cada poder calculo su capacidad con el metodo de capacidadPara() y sumo ese valor al totalCpacidad
		//return totalCapacidad
		return poderes.sum { poder => poder.capacidadPara(self) }
}
	method mejorPoder() {
  		return poderes.max{ poder => poder.capacidadPara(self) }

}
	method esInmuneRadiacion(){
	return poderes.any { poder => poder.inmunidadARadiacion(self) }
}

	method afrontarPeligro(peligro){// A VER SI puede enfrentar el peligro
		var puedeAfrontarPeligro=false
		if((self.capacidadDeBatalla() > peligro.capacidadDeBatalla()) && (!peligro.tieneDesechosRadiactivos() || self.esInmuneRadiacion())){
		 	puedeAfrontarPeligro=true
			estrategia = estrategia + peligro.nivelDeComplejidad()
		}return puedeAfrontarPeligro
	}
	method enfrentar(peligro){//si no lo puede enfrentar tira error, si si suma estrategia
	    if(not self.afrontarPeligro(peligro))self.error("no puede enfrentar el peligro")
		estrategia += peligro.nivelDeComplejidad()
	}
	
}

class Poder {
	method agilidadPara(pj) = 0
	method fuerzaPara(pj) = 0
	method habilidadEspecialPara(pj) = 0

	method capacidadPara(pj) {
		//const agilidad = self.agilidadPara(pj)
		//const fuerza = self.fuerzaPara(pj)
		//const habilidadEspecial = self.habilidadEspecialPara(pj)
		//return (agilidad + fuerza) * habilidadEspecial
		return (self.agilidadPara(pj) + self.fuerzaPara(pj)) * self.habilidadEspecialPara(pj)
	}
	method inmunidadARadiacion(pj){
		return false
	}
}

class Podervelocidad inherits Poder{
	var property rapidez = 0

	override method agilidadPara(pj) = pj.estrategia() * rapidez //reconfiguro los metodos para el poder
	override method fuerzaPara(pj) = pj.espiritualidad() * rapidez
	override method habilidadEspecialPara(pj) = pj.estrategia() + pj.espiritualidad()

	override method inmunidadARadiacion(pj) = false //directamente no da inmunidad
}

class Podervuelo inherits Poder{
	var property alturaMaxima = 0
	var property energiaParaDespegar = 1//para evitar division x 0

	override method agilidadPara(pj) = (pj.estrategia() * alturaMaxima) / energiaParaDespegar
	override method fuerzaPara(pj) = pj.espiritualidad() + alturaMaxima - energiaParaDespegar
	override method habilidadEspecialPara(pj) = pj.estrategia() + pj.espiritualidad()

	override method inmunidadARadiacion(pj) = alturaMaxima > 200 //que si cumple la condicion da true, sino da false directamente
}

class PoderAmplificador inherits Poder{
	var property poderBase= null //aca iria el pooder que se eligio como base (vuelo o velocidad)
	var property amplificador = 0
	
	override method agilidadPara(pj) = poderBase.agilidadPara(pj)
	override method fuerzaPara(pj) = poderBase.fuerzaPara(pj)
	override method habilidadEspecialPara(pj) = poderBase.habilidadEspecialPara(pj) * amplificador
	
	override method inmunidadARadiacion(pj) = true //directamente da inmunidad
}

class Equipo {
	 var property personajes = []

	 method miembroMasVulnerable(){// Método para encontrar el miembro más vulnerable
		//var masVulnerable= personajes.first()// Comienzo con el primer personaje
		//personajes.forEach{personaje => if (personaje.capacidadDeBatalla() < masVulnerable.capacidadDeBatalla()) {
        //        masVulnerable = personaje
        //    }
        //}
        //return masVulnerable
		return personajes.min { personaje => personaje.capacidadDeBatalla() }
    }

	method calidadDelEquipo(){ //promedio de la calidad de equipo
		//const sumaCapacidades = personajes.sum{ pj => pj.capacidadDeBatalla() }
		//return sumaCapacidades / personajes.size()
		return personajes.sum { pj => pj.capacidadDeBatalla() } / personajes.size()
	}
	
	method mejoresPoderes(){
		return personajes.map{pj => pj.mejorPoder()} //devuelve un conjunto con los mejores poderes del equipo
	}


	//se creo un metodo para que:en const o var no se guardan lógicas para eso se hace un method
	method cantidadQuePuedenAfrontar(peligro) {
		return personajes.count { pj => pj.afrontarPeligro(peligro) }
	}
	method afrontarPeligro(peligro) {
		//const cantidadQuePueden = personajes.count { pj => pj.afrontarPeligro(peligro) } // cuenta cuántos personajes cumplen esa condición y se guarda en la variable
		//return cantidadQuePueden > peligro.cantDePjQueSeBancaEnSimultaneo() //compara y si cumple devuelve true sino false
		return self.cantidadQuePuedenAfrontar(peligro) > peligro.cantDePjQueSeBancaEnSimultaneo()
		}
	}


class Peligro{
	var property capacidadDeBatalla = 0
	var property tieneDesechosRadiactivos = false

	var property nivelDeComplejidad = 0
	var property cantDePjQueSeBancaEnSimultaneo = 0

	method esSensato(personajes){
		return personajes.all{pj => pj.afrontarPeligro(self)} //si todos los integrantes del equipo pueden afronhtar el peligro da true sino false para "sensatez"
	}

	method puedeSerAfrontado(personaje){
		return self.capacidadDeBatalla() < personaje.capacidadDeBatalla() && (!self.tieneDesechosRadiactivos() || personaje.esInmuneRadiacion())//retorna true si la cap de batalla del peligro es menos que la del personaje
	}
}

class Metahumano inherits Personaje{
	
	override method capacidadDeBatalla(){
		//var totalCapacidad = 0
		//poderes.forEach{poder => totalCapacidad = totalCapacidad+ poder.capacidadPara(self)}//recorro poderes del pj con forEach, a cada poder calculo su capacidad con el metodo de capacidadPara() y sumo ese valor al totalCpacidad
		//return totalCapacidad*2
		return super().capacidadDeBatalla() * 2
	}

	override method esInmuneRadiacion(){
	return true
	}

	override method afrontarPeligro(peligro){
		var puedeAfrontarPeligro=false
		if((self.capacidadDeBatalla() > peligro.capacidadDeBatalla()) && (!peligro.tieneDesechosRadiactivos() || self.esInmuneRadiacion())){
		 	puedeAfrontarPeligro=true
			estrategia = estrategia + peligro.nivelDeComplejidad()
			espiritualidad = espiritualidad + peligro.nivelDeComplejidad()
		}return puedeAfrontarPeligro
	}
}

class Mago inherits Metahumano{

	var property poderAcumulado=0

	override method capacidadDeBatalla(){
		//var totalCapacidad = 0
		//poderes.forEach{poder => totalCapacidad = totalCapacidad+ poder.capacidadPara(self)}//recorro poderes del pj con forEach, a cada poder calculo su capacidad con el metodo de capacidadPara() y sumo ese valor al totalCpacidad
		//return (totalCapacidad*2)+poderAcumulado
		return super().capacidadDeBatalla() + poderAcumulado
	}

	override method afrontarPeligro(peligro){

		var puedeAfrontarPeligro=false

		if((self.capacidadDeBatalla() > peligro.capacidadDeBatalla()) && (!peligro.tieneDesechosRadiactivos() || self.esInmuneRadiacion())){
		 	puedeAfrontarPeligro=true
			if(poderAcumulado>10){
			estrategia = estrategia + peligro.nivelDeComplejidad()
			espiritualidad = espiritualidad + peligro.nivelDeComplejidad()
			}
		}
		if(poderAcumulado<5){
			poderAcumulado=0
		}else{
		poderAcumulado= poderAcumulado-5
		}
		return puedeAfrontarPeligro
	}
}




