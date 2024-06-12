// Grammar Arquitecture ARM 64
// ==========================

 // Función de ayuda para convertir los valores de los registros
{
  function toInteger(value) {
    return Number(value);
  }
  class node{
    constructor( value, left=null, right=null) {
    	this.value = value;
        this.right = right;
    	this.left = left;
    }
  }
  function generateDot(root) {
    let dot = "graph G {\n";
    let counter = { count: 0 };

    function traverse(node) {
      let current = counter.count++;
      
      if ( typeof node.value === 'object') {
      	let left = traverse(node.value);
   		  dot += `  ${current} -- ${left};\n`;
      } else {
        dot += `  ${current} [label="${node.value}"];\n`;
      }

      if (node.left) {
        let left = traverse(node.left);
        dot += `  ${current} -- ${left};\n`;
      }
      if (node.right) {
        let right = traverse(node.right);
        dot += `  ${current} -- ${right};\n`;
      }
      return current;
    }
    traverse(root);
    dot += "}\n";
    return dot;
  }
  
}

start
 = section
 
section 
 = comment* _ ".global _start"i _ data:data? _ text? ".section "i?"_start:"i instructions
 / ".section "i?"_start:"i instructions data? 
 

data 
 = ".section "i? ".data"i _ dec:Declarations*
 
text 
 = ".section "i? ".text"i _ ident:ID ":" _ ins:instructions 
	

// puede aceptar varias cadenas
instructions "instructions"
 = _ left:instruction _ right:instructions? {/*return new node("instruction",left,right);*/}

instruction "instruction"
  = asignate
  / "b "i ID
  / operation
  / logic
  / move
  / "B."i cond:condition _ lbl:label
  / "SVC "i left:immediate
  / comment {/*return null;*/}

logic
 = "AND "i arrayRegister
 / "ORR "i arrayRegister
 / "EOR "i arrayRegister
 / "MVN "i dest:register "," _ src1:register
 / "CMP "i dest:register "," _ src1:register
 
 arrayRegister "arrayRegister"
  = dest:register "," _ src1:register"," _ src2:register
 
 move "move"
 = "LSL"i
 / "LSR"i
 
operation "operation"
  = "ADD "i arrayOperation
  / "SUB "i arrayOperation 
  / "MUL "i arrayOperation
  / "DIV "i arrayOperation
  
arrayOperation "arrayOperation"
 = est:register "," _ src1:register "," _ src2:operand 

asignate "asignate"
 = "FMOV "i dest:register "," _ op:float_operand
 / "MOV "i  left:register "," _ right:immediate
 
operand "operand"
  = value:immediate {return value;} 
  / value:register {return value;}

register "register x"
  = ["x"i/"w"i] num:integer { return (num >=0 && num<32)? new node("register",num): undefined;}

Declarations
  = id:ID ":" _ "." _ ID _ (integer / string)

// registro
immediate "immediate"
  = "#"? "0b"binaryDigits:[01]+ {return parseInt(binaryDigits, 2);}
  / "#"? num:integer {return Number(num);}

condition 
  = "EQ" / "NE" / "GT" / "LT" / "GE" / "LE"

// reconoce entero
integer "integer"
  = num:[0-9]+ {return Number(num.join("")); }
  
// operacion del float
float_operand "operation_float"
  = "#"? entero:[0-9][0-9]*"."decimal:[0-9]+
  / register

//reconoce id
label "label"
  = [a-zA-Z_][a-zA-Z0-9_]*

ID
  = id:([a-zA-Z_$][a-zA-Z0-9_$]*) _ { return id; }

string "string"
  = "\"" chars:[^\"]* "\"" _ { return chars.join(""); }

// reconoce comentarios
comment "coment"
  = "//" [^\n]* {}
  / ";" [^\n]*  {}

// espacios, saltos de linea y tab
_ "whitespace"
  = [ \t\n\r]* {return null;} 
