class Pack {
  var duracion
  var precio
  var beneficios
  var coordinador

  method precioBase() = precio + beneficios

  method asignarBeneficio() {
    beneficios = BeneficiosOpcionales.costo() * beneficios
  }

  method esPremium()

  method asignarCoordinador(unCoordinador) {
    coordinador = unCoordinador
  } 


}

class PackNacional inherits Pack {
  var destino
  var actividades = []

override method precioBase() = super()

override method esPremium() = duracion > 10 and coordinador.esAltamenteCalificado()


}

class PackInternacional inherits Pack {
  var destino
  var property escalas
  var esLugarDeInteres = true

  override method precioBase() = super() + precio * 0.2

  method escalas() = escalas

  method esLugarDeInteres() = esLugarDeInteres

  

  override method esPremium() =  duracion > 20 and escalas < 0 and esLugarDeInteres 
}

class Coordinador {
  var cantViajesRealizados
  var estaMotivado 
  var aniosExperiencia
  var rol

  method esAltamenteCalificado() = cantViajesRealizados > 20

  method cambiarRol(unRol) {
    rol = unRol
  }
  method estaMotivado() = true

  method rol() = rol

  method aniosExperiencia() = aniosExperiencia

}

class CoordinadorGuia inherits Coordinador {
  
   override method esAltamenteCalificado() = super() and self.estaMotivado()
  
}

class AsistenteLogistico inherits Coordinador {
  
  override method esAltamenteCalificado() = super() and self.aniosExperiencia() < 3
}

class Acompaniante inherits Coordinador {
  
  override method esAltamenteCalificado() = super()
}

object BeneficiosOpcionales {
  var tipo = 1
  var costo =100
  var estaVigente = true

  method tipo() = tipo

  method costo() = 100

  method estaVigente() = true
}
