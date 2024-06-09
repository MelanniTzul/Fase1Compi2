// Grammar Arquitecture ARM 64
// ==========================

  // Función de ayuda para convertir los valores de los registros
{
  function toInteger(value) {
    return parseInt(value, 10);
  }
}

// puede aceptar varias cadenas
instructions 
 = _ rigth:instruction _ left:instructions _
 / instruction


instruction "instruction"
  = "MOV "i  reg:register "," _ op:operand
  / "ADD "i dest:register "," _ src1:register "," _ src2:operand 
  / "SUB "i dest:register "," _ src1:register "," _ src2:operand
  / "MUL "i  dest:register "," _ src1:register "," _ src2:operand
  / "DIV "i dest:register "," _ src1:register "," _ src2:operand
  / "B."i cond:condition _ lbl:label
  / comment {return null;}

register
  = "x"i [0-9]+

operand
  = immediate
  / register

// registro
immediate
  = "#"? i:integer


condition
  = "EQ" / "NE" / "GT" / "LT" / "GE" / "LE"

// reconoce entero
integer "integer"
  = _ [0-9]+

label "label"
  = [a-zA-Z_][a-zA-Z0-9_]*

// reconoce comentarios
comment "coment"
  = "//" i:[^\n]*  / ";" e:[^\n]* {}

// espacios, saltos de linea y tab
_ "whitespace"
  = [ \t\n\r]* {return null;}
