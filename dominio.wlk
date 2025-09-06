import zonas.*
import armas.*

// Gandalf, el gris, nuestro personaje principal
object gandalf {
    const armas = #{baculo}
    //const armas = [baculo]
    var vida = 100


    method agregarArma(arma){
        armas.add(arma)
    }

    method tieneArmas() = not armas.isEmpty()


//  Requerimiento principal: Poder responder "¿Cuánto poder tiene Gandalf?"
    method poder() = 
        vida * self.multiplicadorDeVida() + armas.sum{arma => arma.poder()} * 2

//  Setters:
    method quitarArma(arma) {
        armas.remove(arma)
    }

    method vida(nuevaVida) {
        vida = nuevaVida
    }

    method vida() = vida

    method quitarVida(vidaPerdida){
        vida -= vidaPerdida
    }

    method aumentarVida(vidaGanada) {
      vida += vidaGanada
    }

    method puedePasar(zonaOCamino) = zonaOCamino.permitePasar(self)

    method recorre(zonaOCamino) = zonaOCamino.esRecorridoPor(self)

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

object tomBombadil {
    method puedePasar(zonaOCamino) = true

    method recorre(zonaOCamino) {}
}

