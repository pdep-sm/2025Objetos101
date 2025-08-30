import zonas.*

// Gandalf, el gris, nuestro personaje principal
object gandalf {
    var arma = baculo
    var vida = 100

//  Requerimiento principal: Poder responder "¿Cuánto poder tiene Gandalf?"
    method poder() = 
        vida * self.multiplicadorDeVida() + arma.poder() * 2

//  Setters:
    method arma(nuevaArma) {
        arma = nuevaArma
    }

    method vida(nuevaVida) {
        vida = nuevaVida
    }

    method vida() = vida

    method puedePasar(zona) = zona.permitePasar(self)

//  Dos versiones para el multiplicador de vida:
//      Aprovechando que el if con else es una expresión:
    method multiplicadorDeVida() = if(vida <= 10) 300 else 15    

//      Normal
    method multiplicadorDeVida2() {
        if(vida <= 10) 
            return 300
        else
            return 15
    }
}

// Armas
object baculo {
  method poder() = 400 
}

object espada {
    var origen = elfico
    var poderBase = 10

    method poder() = origen.poder() * poderBase
    method origen(nuevoOrigen) {
        origen = nuevoOrigen
    }
}

// Posibles orígenes
object elfico {
    method poder() = 25
}

object humano {
    method poder() = 10
}

object enano {
    method poder() = 20
}
