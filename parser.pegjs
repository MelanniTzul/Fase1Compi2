// Grammar Arquitecture ARM 64
// ==========================

// reconoce comentarios
Coment "coment"
  = "//".* 


// reconoce entero
Integer "integer"
  = _ i:[0-9]+ 

// espacios, saltos de linea y tab
_ "whitespace"
  = [ \t\n\r]*