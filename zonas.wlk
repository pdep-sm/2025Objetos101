
object lebennin {
    method permitePasar(persona) = 1500 < persona.poder()

    method esRecorridoPor(persona) {}
}

object minasTirith {
    method permitePasar(persona) = persona.tieneArmas()

    method esRecorridoPor(persona){
        persona.quitarVida(10)
    }
}

object lossarnch {
    method permitePasar(persona) = true

    method esRecorridoPor(persona){
      persona.aumentarVida(1)
    }
}



object gondor{
    var zonas = [lebennin, minasTirith]

    method zonas(nuevasZonas){
        zonas = nuevasZonas
    }

    method permitePasar(persona) = zonas.all{zona => persona.puedePasar(zona)}
    
    method esRecorridoPor(persona){
        zonas.forEach{zona => persona.recorre(zona)}
    }
}