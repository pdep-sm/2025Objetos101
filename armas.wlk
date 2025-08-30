// Armas
object baculo {
  method poder() = 400 
}

object noArma { //NullObject
    method poder() = 0
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
