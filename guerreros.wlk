import zonas.*
import armas.*

class Guerrero { // Clase Abstracta
    const armas = #{}
    const items = []
    var property vida = 100

    method agregarArma(arma){
        armas.add(arma)
    }

    method tieneArmas() = not armas.isEmpty()

    method poder() // Todo guerrero debe sobreescribir este comportamiento

    method poderDeArmas() = armas.sum { arma => arma.poder() }

    method quitarArma(arma) {
        armas.remove(arma)
    }

    method quitarVida(vidaPerdida){
        vida -= vidaPerdida
    }

    method aumentarVida(vidaGanada) {
      vida += vidaGanada
    }

    method puedePasar(zonaOCamino) = zonaOCamino.permitePasar(self)

    method recorre(zonaOCamino) = zonaOCamino.esRecorridoPor(self)

}

class Maia inherits Guerrero {
  
    override method poder() = 
        vida * self.factorDePoder() + self.poderDeArmas() * 2

    method factorDePoder() = 
        if(vida <= 10) 
            maia.factorDePoderBajoAmenaza() 
        else 
            maia.factorDePoderBasico()    
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

class Hobbit inherits Guerrero(armas = #{sting}) {

    override method poder() = vida + self.poderDeArmas() + items.size()

}

/*
Gollum: Gollum es otro ser particular dentro de La Tierra Media, y fue 
totalmente afectado por el anillo único. Sabemos que en el pasado supo 
ser un hobbit feliz, por lo cual su cálculo de poder es igual que el de 
cualquier hobbit, pero el efecto que le produjo el anillo reduce el mismo a la 
mitad.
*/
object gollum inherits Hobbit {
    override method poder() = super() / 2
}

/*
Enanos: Los Enanos suelen tener armas muy poderosas, por lo tanto su poder es:
    vida actual + factor de poder * (sumatoria del poder de sus armas)
El factor de poder, es un número que depende de cada enano.
*/

class Enano inherits Guerrero  {
    const factorDePoder

    override method poder() = vida + factorDePoder * self.poderDeArmas()

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

class Elfo inherits Guerrero  {
    var property destrezaPropia

    override method poder() = vida + self.poderDeArmas() * (elfo.destrezaBase() + destrezaPropia)

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

class Humano inherits Guerrero {
    const limitadorDePoder

    override method poder() = vida * self.poderDeArmas() / limitadorDePoder

}
