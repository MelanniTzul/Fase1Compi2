// Grammar Arquitecture ARM 64
// ==========================

// reconoce entero
Integer "integer"
  = _ [0-9]+ { return parseInt(text(), 10); }

// reconoce comentarios
Coment "coment"
  = "//".* 

// espacios, saltos de linea y tab
_ "whitespace"
  = [ \t\n\r]*