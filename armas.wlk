// Armas

/*
Báculo: Cada báculo sabe cual es el poder que otorga.
*/
class Baculo {
  const property poder  
}

// Daga
class Daga {
    // TODO
}


/*
Arco: Los arcos se fabrican con una tensión en kilogramos que es igual para 
todos (y que debería ser posible de cambiar) y un largo en cm, propio del arco.
La tensión se conoce inicialmente en 40kg. Y su poder se calcula como la décima 
parte del producto entre la tensión y su longitud
*/
class Arco {
    const longitud
    var property tension = 40

    method poder() = tension * longitud / 10
}

/*
Hacha: El hacha está compuesta de un mango, y una hoja metálica con filo. 
Y se calcula como el largo del mango en cm multiplicado por el peso de la hoja
 en kg.
*/
class Hacha {
    const largoMango
    const pesoHoja

    method poder() = largoMango * pesoHoja
}

object noArma { //NullObject
    method poder() = 0
}

/*
Espada: Cada espada tiene un multiplicador de poder entre 1 y 
20, y además, como ya mencionamos, tiene su origen, que le 
otorga un valor extra. El poder de la espada se calcula como 
el producto entre el multiplicador y el valor del origen. 
Repasando cada uno de los valores de los orígenes:
  Élfico: 30
  Enano: 20
  Humano: 15
*/
class Espada {
    var property origen
    const property multiplicadorDePoder

    method poder() = origen.poder() * multiplicadorDePoder
}

// Posibles orígenes
object elfico {
    method poder() = 30
}

object humano {
    method poder() = 15
}

object enano {
    method poder() = 20
}
