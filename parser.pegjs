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


  // Función de ayuda para convertir los valores de los registros
{
  function toInteger(value) {
    return parseInt(value, 10);
  }
}

start
  = _ instruction* _

instruction
  = mov
  / add
  / sub
  / mul
  / div
  / branch

mov
  = "MOV" _ reg:register "," _ op:operand { return { type: "MOV", register: reg, operand: op }; }

add
  = "ADD" _ dest:register "," _ src1:register "," _ src2:operand { return { type: "ADD", destination: dest, source1: src1, source2: src2 }; }

sub
  = "SUB" _ dest:register "," _ src1:register "," _ src2:operand { return { type: "SUB", destination: dest, source1: src1, source2: src2 }; }

mul
  = "MUL" _ dest:register "," _ src1:register "," _ src2:operand { return { type: "MUL", destination: dest, source1: src1, source2: src2 }; }

div
  = "DIV" _ dest:register "," _ src1:register "," _ src2:operand { return { type: "DIV", destination: dest, source1: src1, source2: src2 }; }

branch
  = "B." cond:condition _ lbl:label { return { type: "BRANCH", condition: cond, label: lbl }; }

register
  = "x" [0-9]+ { return { type: "REGISTER", value: text() }; }

operand
  = immediate
  / register

immediate
  = "#" [0-9]+ { return { type: "IMMEDIATE", value: toInteger(text().substring(1)) }; }

condition
  = "EQ" / "NE" / "GT" / "LT" / "GE" / "LE" { return text(); }

label
  = [a-zA-Z_][a-zA-Z0-9_]* { return { type: "LABEL", value: text() }; }

// Ignorar espacios en blanco y comentarios
_ 
  = [ \t\n\r]* { return null; }
