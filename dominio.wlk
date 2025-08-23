object gandalf {
    var arma = baculo
    var vida = 100

    method poder() = 
        vida * self.multiplicadorDeVida() + arma.poder() * 2

    method arma(nuevaArma) {
        arma = nuevaArma
    }

    method vida(nuevaVida) {
        vida = nuevaVida
    }

    method multiplicadorDeVida() = if(vida <= 10) 300 else 15
    
    method multiplicadorDeVida2() {
        if(vida <= 10) 
            return 300
        else
            return 15
    }
}

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

object elfico {
    method poder() = 25
}

object humano {
    method poder() = 10
}

object enano {
    method poder() = 20
}