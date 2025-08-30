
object lebennin {
    method permitePasar(persona) = 1500 < persona.poder() 
}

object minasTirith {
    method permitePasar(persona) = 60 < persona.vida()
}

object lossarnch {
    method permitePasar(persona) = true
}

