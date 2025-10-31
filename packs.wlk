class Pack {
  var duracion
  var precio
  const beneficios = #{}
  var coordinador

  method precioBase() = precio + self.precioBeneficios()

  method asignarBeneficio(unBeneficio) {
    beneficios.add(unBeneficio)
    }
  method precioBeneficios() = beneficios.filter({b=>b.estaVigente()}).sum({b=>b.costo()})


  method esPremium()

  method asignarCoordinador(unCoordinador) {
    coordinador = unCoordinador
  } 


}

class PackNacional inherits Pack {
  var destino
  var actividades = []



override method esPremium() = duracion > 10 and coordinador.esAltamenteCalificado()
override method precioBase() = super()

}

class PackProvincia inherits PackNacional {
  const ciudadesAVisitar  

  method cantidadBeneficiosVigentes() = beneficios.filter({b=>b.estaVigente()}).size()

  override method esPremium() = actividades.size() >= 4 and ciudadesAVisitar > 5 and self.cantidadBeneficiosVigentes() >= 3

  override method precioBase() = if (self.esPremium()) super() + (super() * 0.05) else super()

}

class PackInternacional inherits Pack {
  var destino
  var property escalas
  var esLugarDeInteres = true

  override method precioBase() = super() + precio * 0.2

  method escalas() = escalas

  method esLugarDeInteres() = esLugarDeInteres

  

  override method esPremium() =  duracion > 20 and escalas == 0 and esLugarDeInteres 
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
  
  override method esAltamenteCalificado() = super() and self.aniosExperiencia() >= 3
}

class Acompaniante inherits Coordinador {
  
  override method esAltamenteCalificado() = super()
}

class BeneficiosOpcionales {
  const tipo 
  const costo 
  const estaVigente 

  method tipo() = tipo

  method costo() = costo

  method estaVigente() = estaVigente
}

object accesoASalas{
  
}

object traslados {
  
}

object segurosAdicionales {
  
}
