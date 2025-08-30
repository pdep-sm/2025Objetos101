import zonas.*
import armas.*

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

