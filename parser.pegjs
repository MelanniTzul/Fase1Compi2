// Grammar Arquitecture ARM 64
// ==========================

  // Función de ayuda para convertir los valores de los registros
{
  function toInteger(value) {
    return Number(value);
  }
  
}

// puede aceptar varias cadenas
instructions 
 = _ rigth:instruction _ left:instructions _
 / instruction


instruction "instruction"
  = "MOV "i  right:register "," _ left:operand { return {type:"mov",right:right, left:left }; }
  / "ADD "i dest:register "," _ src1:register "," _ src2:operand 
  / "SUB "i dest:register "," _ src1:register "," _ src2:operand
  / "MUL "i  dest:register "," _ src1:register "," _ src2:operand
  / "DIV "i dest:register "," _ src1:register "," _ src2:operand
  / "B."i cond:condition _ lbl:label
  / comment {return null;}
  
operand
  = immediate
  / register

register "register x"
  = "x"i num:integer {let n=num; return (num >=0 && num<32)? n: undefined;}
  
// registro
immediate
  = "#"? i:integer { return i; }


condition
  = "EQ" / "NE" / "GT" / "LT" / "GE" / "LE"

// reconoce entero
integer "integer"
  = num:[0-9]+ {return Number(num.join("")); }

label "label"
  = [a-zA-Z_][a-zA-Z0-9_]*

// reconoce comentarios
comment "coment"
  = "//" [^\n]*  / ";" [^\n]* {return null; }

// espacios, saltos de linea y tab
_ "whitespace"
  = [ \t\n\r]* {return null;}
