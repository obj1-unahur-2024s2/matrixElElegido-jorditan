object neo {
     var energia = 100
     method energia() = energia
     method elegido() = true
     method saltar() {energia = energia / 2}
     method vitalidad() = energia/10
}

object morfeo {
     var vitalidad = 8
     var descansado = true
     method elegido() = false
     method descansado() = descansado
     method vitalidad() = 0.max(vitalidad)

     method saltar() {
          vitalidad -= 1
          descansado = !descansado
     }
}

object trinity {
     method vitalidad() = 0
     method saltar() {}
     method elegido() = false
}

object nave {
     const property pasajeros = [neo, morfeo, trinity]

     method cantidadPasajeros() = pasajeros.size()

     method subirA(pasajero) = pasajeros.add(pasajero)
     method bajarA(pasajero) = pasajeros.remove(pasajero)

     method pasajeroMayorVitalidad() = pasajeros.max(
     { pasajero => pasajero.vitalidad() }
     )

     method pasajeroMenosVital() = pasajeros.min({
          pasajero => pasajero.vitalidad()
     })


     method estaEquilibrada() {
          return self.pasajeroMayorVitalidad().vitalidad() <=
          self.pasajeroMenosVital().vitalidad()*2
     }


     method estaElElegido() = pasajeros.any({
          pasajero => pasajero.elegido()
     })

     method noElegidos() = pasajeros.filter({
          pasajero => !pasajero.elegido()
     })

     method chocar() {
          pasajeros.forEach({
               pasajero => pasajero.saltar() self.bajarA(pasajero)
          })
     }
     

     method acelerar() {
          self.noElegidos().forEach({ 
               pasajero => pasajero.saltar()
          })
     }
}