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
 = ini:instructions {return generateDot(ini);}

// puede aceptar varias cadenas
instructions 
 = _ left:instruction _ right:instructions _ {return new node("instruction",left,right);}
 / value:instruction {return (value===null)? null: new node(value);}


instruction "instruction"
  = "MOV "i  left:register "," _ right:operand { return new node("mov",left,right); }
  / "ADD "i dest:register "," _ src1:register "," _ src2:operand 
  / "SUB "i dest:register "," _ src1:register "," _ src2:operand
  / "MUL "i  dest:register "," _ src1:register "," _ src2:operand
  / "DIV "i dest:register "," _ src1:register "," _ src2:operand
  / "B."i cond:condition _ lbl:label
  / comment {return null;}
  
operand 
  = value:immediate {return value;} 
  / value:register {return value;}

register "register x"
  = "x"i num:integer { return (num >=0 && num<32)? new node("register",num): undefined;}
  
// registro
immediate
  = "#"? i:integer { return new node(i); }


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