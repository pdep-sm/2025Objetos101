import zonas.*
import armas.*

// Gandalf, el gris, nuestro personaje principal
/*
Maiar: Gandalf es un Maia, y la forma en la cual calcula su poder 
representa a todos los de su misma raza. Los valores de 15 y 300 son 
factores de poder básico y poder bajo amenaza, respectivamente, que dependen 
de todos los Maiar. Hay que tener en cuenta que podrían llegar a cambiar, 
aplicando el cambio para todos ellos por igual.
    vida actual * factor actual + (sumatoria del poder de sus armas) * 2
*/
class Maia {
    const armas = #{}
    const items = []
    //const armas = [baculo]
    var vida = 100


    method agregarArma(arma){
        armas.add(arma)
    }

    method tieneArmas() = not armas.isEmpty()


//  Requerimiento principal: Poder responder "¿Cuánto poder tiene Gandalf?"
    method poder() = 
        vida * self.factorDePoder() + self.poderDeArmas() * 2

    method poderDeArmas() = armas.sum { arma => arma.poder() }

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
    method factorDePoder() = 
        if(vida <= 10) 
            maia.factorDePoderBajoAmenaza() 
        else 
            maia.factorDePoderBasico()    

//      Normal
    method factorDePoder2() {
        if(vida <= 10) 
            return maia.factorDePoderBajoAmenaza() 
        else
            return maia.factorDePoderBasico()
    }
}

object maia { // Companion object
    var property factorDePoderBasico = 15
    var property factorDePoderBajoAmenaza = 300
}

object tomBombadil {

    const property poder = 10000000

    method puedePasar(zonaOCamino) = true

    method recorre(zonaOCamino) {}
}

/*
Hobbits: Los hobbits son la raza mediana del lugar. No representan una gran 
amenaza y su cálculo de poder está dado por la siguiente fórmula:
    vida actual + (sumatoria del poder de sus armas) + cantidad de ítems
*/

class Hobbit {
    const armas = #{}
    const items = []
    var property vida

    method poder() = vida + self.poderDeArmas() + items.size()

    method poderDeArmas() = armas.sum { arma => arma.poder() }

    method quitarVida(vidaPerdida){
        vida -= vidaPerdida
    }

    method aumentarVida(vidaGanada) {
      vida += vidaGanada
    }
}

/*
Gollum: Gollum es otro ser particular dentro de La Tierra Media, y fue 
totalmente afectado por el anillo único. Sabemos que en el pasado supo 
ser un hobbit feliz, por lo cual su cálculo de poder es igual que el de 
cualquier hobbit, pero el efecto que le produjo el anillo reduce el mismo a la 
mitad.
*/
object gollum {
    // TODO 
}

/*
Enanos: Los Enanos suelen tener armas muy poderosas, por lo tanto su poder es:
    vida actual + factor de poder * (sumatoria del poder de sus armas)
El factor de poder, es un número que depende de cada enano.
*/

class Enano {
    const factorDePoder
    const armas = #{}
    const items = []
    var property vida

    method poder() = vida + factorDePoder * self.poderDeArmas()

    method poderDeArmas() = armas.sum { arma => arma.poder() }

    method quitarVida(vidaPerdida){
        vida -= vidaPerdida
    }

    method aumentarVida(vidaGanada) {
      vida += vidaGanada
    }
}

/*
Elfos: Una de las características de los elfos es su destreza, representada 
por un número. Por este motivo es que debemos considerarla a la hora de 
calcular su poder:
    vida actual + (sumatoria del poder de sus armas) * 
        (destrezaBase + destrezaPropia)
La destreza base, es común para todos los elfos y puede cambiar.
 Hoy en día es de 2.
*/

class Elfo {
    var property destrezaPropia
    const armas = #{}
    const items = []
    var property vida

    method poder() = vida + self.poderDeArmas() * (elfo.destrezaBase() + destrezaPropia)

    method poderDeArmas() = armas.sum { arma => arma.poder() }

    method quitarVida(vidaPerdida){
        vida -= vidaPerdida
    }

    method aumentarVida(vidaGanada) {
      vida += vidaGanada
    }
}

object elfo {
    // WKO. Companion object
    var property destrezaBase = 2
}

/*
Humanos: Probablemente, la raza más común, pero no por eso la menos importante.
 Su cálculo de poder está dado por:
    vida actual * (sumatoria del poder de sus armas) / Limitador de Poder
El limitador de poder es particular para cada Humano.
*/

class Humano {
    const limitadorDePoder
    const armas = #{}
    const items = []
    var property vida

    method poder() = vida * self.poderDeArmas() / limitadorDePoder

    method poderDeArmas() = armas.sum { arma => arma.poder() }

    method quitarVida(vidaPerdida){
        vida -= vidaPerdida
    }

    method aumentarVida(vidaGanada) {
      vida += vidaGanada
    }
}
