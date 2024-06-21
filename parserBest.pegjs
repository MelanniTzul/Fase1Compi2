{
    // Clase para representar un nodo del árbol de sintaxis concreto "CST"
    class ASTnode{
        constructor(type, value, children = []){
            this.type = type;
            this.value = value;
            this.children = children;
            this.id = ASTnode.generateUniqueId();
        }
        // Genera un identificador único para el nodo del árbol "Para el archivo .dot"
        static generateUniqueId() {
            return '\"xxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx\"'.replace(/[xy]/g, function(c) {
                const r = Math.random() * 16 | 0,
                v = c === 'x' ? r : (r & 0x3 | 0x8);
                return v.toString(16);
            });
        }
        // Función para obtener el código .dot del árbol de sintaxis concreto "CST"
        getDot(node){
            let dot = '';
            dot += 'digraph G {\n';
            function addNodes(node){
                // ROOT
                if (node.type === 'ROOT') {dot += `${node.id} [label="${node.type}"];\n`;}
                // INSTRUCTION
                else if (node.type === 'INSTRUCTION'){dot += `${node.id} [label="${node.type} ${node.value}"];\n`;}
                // Registro General 64 Bits
                else if (node.type === 'Registro General 64 Bits'){dot += `${node.id} [label="${node.type} ${node.value}"];\n`;}
                // SOURCE1 AND SOURCE2
                else if (node.type === 'DESTINATION' || node.type === 'SOURCE1' || node.type === 'SOURCE2' ) {dot += `${node.id} [label="${node.value}"];\n`;}
                // R_64_BITS, R_32_BITS, R_STACK_POINTER, R_LINK_REGISTER, R_ZERO_REGISTER
                else if (node.type === 'R_64_BITS' || node.type === 'R_32_BITS' || node.type === 'R_STACK_POINTER' || node.type === 'R_LINK_REGISTER' || node.type === 'R_ZERO_REGISTER'){dot += `${node.id} [label="${node.value}"];\n`;}
                // LOGICAL_SHIFT_LEFT, LOGICAL_SHIFT_RIGHT, ARITHMETIC_SHIFT_RIGHT
                else if (node.type === 'LOGICAL_SHIFT_LEFT' || node.type === 'LOGICAL_SHIFT_RIGHT' || node.type === 'ARITHMETIC_SHIFT_RIGHT'){dot += `${node.id} [label="${node.value}"];\n`;}
                // UNSIGNED_EXTEND_BYTE, UNSIGNED_EXTEND_HALFWORD, UNSIGNED_EXTEND WORD, UNSIGNED_EXTEND_DOUBLEWORD, SIGNED_EXTEND_BYTE, SIGNED_EXTEND_HALFWORD, SIGNED_EXTEND_WORD, SIGNED_EXTEND_DOUBLEWORD
                else if (node.type === 'UNSIGNED_EXTEND_BYTE' || node.type === 'UNSIGNED_EXTEND_HALFWORD' || node.type === 'UNSIGNED_EXTEND WORD' || node.type === 'UNSIGNED_EXTEND_DOUBLEWORD' || node.type === 'SIGNED_EXTEND_BYTE' || node.type === 'SIGNED_EXTEND_HALFWORD' || node.type === 'SIGNED_EXTEND_WORD' || node.type === 'SIGNED_EXTEND_DOUBLEWORD'){dot += `${node.id} [label="${node.value}"];\n`;}
                else{dot += `${node.id} [label="${node.value}"];\n`;}
                // Agregar nodos hijos y aristas correspondientes a cada nodo del árbol "Recursivo"
                node.children.forEach(child => {
                    dot += `${node.id} -> ${child.id};\n`;
                    addNodes(child);
                });
            }
            addNodes(node);
            dot += '}';
            console.clear();
            console.log(dot);
            return dot;
        }
    }
    // Funciones para crear y manipular nodos del árbol de sintaxis concreto "CST"
    function createNode(type, value, children = []){
        return new ASTnode(type, value, children);
    }
    function setValue(node, value){
        node.value = value;
    }
    function addChild(node, child){
        node.children.push(child);
    }
    function addChildren(node, children){
        node.children = node.children.concat(children);
    }
    // Función para obtener el código .dot del árbol de sintaxis concreto "CST"
    function getDot(node){
        let dot = '';
        dot += 'digraph G {\n';
        function addNodes(node){
            // ROOT
            if (node.type === 'ROOT') {dot += `${node.id} [label="${node.type}"];\n`;}
            // INSTRUCTION
            else if (node.type === 'INSTRUCTION'){dot += `${node.id} [label="${node.type} ${node.value}"];\n`;}
            // Registro General 64 Bits
            else if (node.type === 'Registro General 64 Bits'){dot += `${node.id} [label="${node.type} ${node.value}"];\n`;}
            // SOURCE1 AND SOURCE2
            else if (node.type === 'DESTINATION' || node.type === 'SOURCE1' || node.type === 'SOURCE2' ) {dot += `${node.id} [label="${node.value}"];\n`;}
            // R_64_BITS, R_32_BITS, R_STACK_POINTER, R_LINK_REGISTER, R_ZERO_REGISTER
            else if (node.type === 'R_64_BITS' || node.type === 'R_32_BITS' || node.type === 'R_STACK_POINTER' || node.type === 'R_LINK_REGISTER' || node.type === 'R_ZERO_REGISTER'){dot += `${node.id} [label="${node.value}"];\n`;}
            // LOGICAL_SHIFT_LEFT, LOGICAL_SHIFT_RIGHT, ARITHMETIC_SHIFT_RIGHT
            else if (node.type === 'LOGICAL_SHIFT_LEFT' || node.type === 'LOGICAL_SHIFT_RIGHT' || node.type === 'ARITHMETIC_SHIFT_RIGHT'){dot += `${node.id} [label="${node.value}"];\n`;}
            // UNSIGNED_EXTEND_BYTE, UNSIGNED_EXTEND_HALFWORD, UNSIGNED_EXTEND WORD, UNSIGNED_EXTEND_DOUBLEWORD, SIGNED_EXTEND_BYTE, SIGNED_EXTEND_HALFWORD, SIGNED_EXTEND_WORD, SIGNED_EXTEND_DOUBLEWORD
            else if (node.type === 'UNSIGNED_EXTEND_BYTE' || node.type === 'UNSIGNED_EXTEND_HALFWORD' || node.type === 'UNSIGNED_EXTEND WORD' || node.type === 'UNSIGNED_EXTEND_DOUBLEWORD' || node.type === 'SIGNED_EXTEND_BYTE' || node.type === 'SIGNED_EXTEND_HALFWORD' || node.type === 'SIGNED_EXTEND_WORD' || node.type === 'SIGNED_EXTEND_DOUBLEWORD'){dot += `${node.id} [label="${node.value}"];\n`;}
            else{dot += `${node.id} [label="${node.value}"];\n`;}
            // Agregar nodos hijos y aristas correspondientes a cada nodo del árbol "Recursivo"
            node.children.forEach(child => {
                dot += `${node.id} -> ${child.id};\n`;
                addNodes(child);
            });
        }
        addNodes(node);
        dot += '}';
        console.clear();
        console.log(dot);
        return dot;
    }
    const root = createNode('ROOT', 'ROOT');
}
// Iniciamos el análisis sintáctico con la regla inicial "start"
start
    = line:(directive / section / instruction / comment / mcomment / blank_line)*
        {
            root.children = [...line];
            root.children = root.children.filter(node => node.type !== 'EMPTY');
            root.children = root.children.filter(node => node.type !== 'COMMENT');
            return root;
        }
// Directivas en ARM64 v8
directive
  = _* name:directive_p _* args:(directive_p / label / string / expression)? _* comment? "\n"?
  {
    const node = createNode('DIRECTIVE', 'Directive');
    addChild(node, name);
    if(args){
        addChild(node, args);
    }
    return node;
  
  }
//
directive_p
    = "." directive_name
    {
        const node = createNode('DIRECTIVE', text());
        return node;  
    }
// Nombre de las directivas
directive_name
  = "align" / "ascii" / "asciz" / "byte" / "hword" / "word" / "quad" /
    "data" / "text" / "global" / "section" / "space" / "zero" / "incbin" / "set" / "equ" / "bss"

// Secciones
section
  = _* label:label _* ":" _* comment? "\n"?
  {
    const node = createNode('SECTION', 'Section');
    addChild(node, label);
    return node;
  }


// Instrucciones en ARM64 v8 
instruction
    = i:add_inst
    / i:sub_inst
    / i:mul_inst
    / i:div_inst
    / i:udiv_inst
    / i:sdiv_inst
    / i:and_inst
    / i:orr_inst
    / i:eor_inst
    / i:mov_inst
    / i:mvn_inst
    / i:ldr_inst
    / i:ldrb_inst
    / i:ldp_inst
    / i:strb_inst
    / i:str_inst
    / i:stp_inst
    / i:lsl_inst
    / i:lsr_inst
    / i:asr_inst
    / i:ror_inst
    / i:cmp_inst
    / i:beq_inst
    / i:bne_inst
    / i:bgt_inst
    / i:blt_inst
    / i:bl_inst
    / i:b_inst
    / i:ret_inst
    / i:svc_inst
// Instrucciones Suma 64 bits y 32 bits (ADD)
add_inst "Instrucción de Suma"
    = _* "ADD"i _* rd:reg64 _* "," _* src1:reg64 _* "," _* src2:operand64 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'ADD');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
    / _* "ADD"i _* rd:reg32 _* "," _* src1:reg32 _* "," _* src2:operand32 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'ADD');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
// Instrucciones de Resta 64 bits y 32 bits (SUB)  
sub_inst
    = _* "SUB"i _* rd:reg64 _* "," _* src1:reg64 _* "," _* src2:operand64 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'SUB');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
    / _* "SUB"i _* rd:reg32 _* "," _* src1:reg32 _* "," _* src2:operand32 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'SUB');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
// Instrucciones de Multiplicación 64 bits y 32 bits (MUL)
mul_inst
    = _* "MUL"i _* rd:reg64 _* "," _* src1:reg64 _* "," _* src2:operand64 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'MUL');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
    / _* "MUL"i _* rd:reg32 _* "," _* src1:reg32 _* "," _* src2:operand32 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'MUL');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
// Instrucciones de División 64 bits y 32 bits (DIV)
div_inst
    = _* "DIV"i _* rd:reg64 _* "," _* src1:reg64 _* "," _* src2:operand64 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'DIV');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
    / _* "DIV"i _* rd:reg32 _* "," _* src1:reg32 _* "," _* src2:operand32 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'DIV');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
// Instrucciones de División sin signo 64 bits y 32 bits (UDIV)
udiv_inst
    = _* "UDIV"i _* rd:reg64 _* "," _* src1:reg64 _* "," _* src2:operand64 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'UDIV');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
    / _* "UDIV"i _* rd:reg32 _* "," _* src1:reg32 _* "," _* src2:operand32 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'UDIV');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
// Instrucciones de División con signo 64 bits y 32 bits (SDIV)
sdiv_inst
    = _* "SDIV"i _* rd:reg64 _* "," _* src1:reg64 _* "," _* src2:operand64 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'SDIV');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
    / _* "SDIV"i _* rd:reg32 _* "," _* src1:reg32 _* "," _* src2:operand32 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'SDIV');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
// Instrucciones AND 64 bits y 32 bits (AND)        
and_inst
    = _* "AND"i _* rd:reg64 _* "," _* src1:reg64 _* "," _* src2:operand64 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'AND');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
    / _* "AND"i _* rd:reg32 _* "," _* src1:reg32 _* "," _* src2:operand32 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'AND');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
// Instrucciones OR 64 bits y 32 bits (ORR)
orr_inst
    = _* "ORR"i _* rd:reg64 _* "," _* src1:reg64 _* "," _* src2:operand64 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'ORR');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
    / _* "ORR"i _* rd:reg32 _* "," _* src1:reg32 _* "," _* src2:operand32 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'ORR');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
// Instrucciones XOR 64 bits y 32 bits (EOR)
eor_inst
    = _* "EOR"i _* rd:reg64 _* "," _* src1:reg64 _* "," _* src2:operand64 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'EOR');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
    / _* "EOR"i _* rd:reg32 _* "," _* src1:reg32 _* "," _* src2:operand32 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'EOR');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
// Instrucción MOV 64 bits y 32 bits (MOV)
mov_inst "Instrucción MOV"
  = _* "MOV"i _* rd:reg64_or_reg32 _* "," _* src:mov_source _* comment? "\n"?
  {
    const node = createNode('INSTRUCTION', 'MOV');
    const rdNode = createNode('DESTINATION', 'RD');
    const srcNode = createNode('SOURCE1', 'SRC1');
    addChild(rdNode, rd);
    addChild(srcNode, src);
    addChild(node, rdNode);
    addChild(node, srcNode);
    return node;
  }

reg64_or_reg32 "Registro de 64 o 32 Bits"
  = reg64
  / reg32

mov_source "Source para MOV"
  = reg64_or_reg32
  / immediate

//  Instucción Load Register (LDR)
ldr_inst "Instrucción LDR"
    = _* "LDR"i _* rd:reg64 _* "," _* src:ldr_source _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'LDR');
            const rdNode = createNode('DESTINATION', 'RD');
            const srcNode = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChildren(srcNode, src);
            addChild(node, rdNode);
            addChild(node, srcNode);
            return node;
        }
    / _* "LDR"i _* rd:reg32 _* "," _* src:ldr_source _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'LDR');
            const rdNode = createNode('DESTINATION', 'RD');
            const srcNode = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChildren(srcNode, src);
            addChild(node, rdNode);
            addChild(node, srcNode);
            return node;
        }
ldr_source 
    = "=" l:label
        {
            l.value = '=' + l.value;
            return [l];
        }
    / "[" _* r:reg64_or_reg32 _* "," _* r2:reg64_or_reg32 _* "," _* s:shift_op _* i2:immediate _* "]"
        {
            return [r, r2, s, i2];
        }
    / "[" _* r:reg64 _* "," _* i:immediate _* "," _* s:shift_op _* i2:immediate _* "]"
        {
            return [r, i, s, i2];
        }
    / "[" _* r:reg64 _* "," _* i:immediate _* "," _* e:extend_op _* "]" 
        {
            return [r, i, e];
        }
    / "[" _* r:reg64 _* "," _* i:immediate _* "]"
        {
            return [r, i];
        }
    / "[" _* r:reg64 _* "]"
        {
            return [r];
        }

// Instrucción Load Register (LDRB)
ldrb_inst "Instrucción LDRB"
    = _* "LDRB"i _* rd:reg64 _* "," _* src:ldr_source _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'LDRB');
            const rdNode = createNode('DESTINATION', 'RD');
            const srcNode = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChildren(srcNode, src);
            addChild(node, rdNode);
            addChild(node, srcNode);
            return node;
        }
    / _* "LDRB"i _* rd:reg32 _* "," _* src:ldr_source _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'LDRB');
            const rdNode = createNode('DESTINATION', 'RD');
            const srcNode = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChildren(srcNode, src);
            addChild(node, rdNode);
            addChild(node, srcNode);
            return node;
        }

// Instrucción Load Pair Register (LDP)
ldp_inst "Instrucción LDP"
    = _* "LDP"i _* rd:reg64 _* "," _* rd2:reg64 _* "," _* src:ldr_source _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'LDP');
            const rdNode = createNode('DESTINATION', 'RD');
            const rd2Node = createNode('DESTINATION', 'RD2');
            const srcNode = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(rd2Node, rd2);
            addChildren(srcNode, src);
            addChild(node, rdNode);
            addChild(node, rd2Node);
            addChild(node, srcNode);
            return node;
        }
    / _* "LDP"i _* rd:reg32 _* "," _* rd2:reg32 _* "," _* src:ldr_source _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'LDP');
            const rdNode = createNode('DESTINATION', 'RD');
            const rd2Node = createNode('DESTINATION', 'RD2');
            const srcNode = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(rd2Node, rd2);
            addChildren(srcNode, src);
            addChild(node, rdNode);
            addChild(node, rd2Node);
            addChild(node, srcNode);
            return node;
        }

// Instrucción Store Register (STR)
str_inst "Instrucción STR"
    = _* "STR"i _* rd:reg64 _* "," _* src:str_source _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'STR');
            const rdNode = createNode('DESTINATION', 'RD');
            const srcNode = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChildren(srcNode, src);
            addChild(node, rdNode);
            addChild(node, srcNode);
            return node;
        }
    / _* "STR"i _* rd:reg32 _* "," _* src:str_source _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'STR');
            const rdNode = createNode('DESTINATION', 'RD');
            const srcNode = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChildren(srcNode, src);
            addChild(node, rdNode);
            addChild(node, srcNode);
            return node;
        }
str_source 
    = "[" _* r:reg64_or_reg32 _* "," _* r2:reg64_or_reg32 _* "," _* s:shift_op _* i2:immediate _* "]"
        {
            return [r, r2, s, i2];
        }
    / "[" _* r:reg64 _* "," _* i:immediate _* "," _* s:shift_op _* i2:immediate _* "]"
        {
            return [r, i, s, i2];
        }
    / "[" _* r:reg64 _* "," _* i:immediate _* "," _* e:extend_op _* "]" 
        {
            return [r, i, e];
        }
    / "[" _* r:reg64 _* "," _* i:immediate _* "]"
        {
            return [r, i];
        }
    / "[" _* r:reg64 _* "]"
        {
            return [r];
        }

// Instrucción Store Register Byte (STRB)
strb_inst "Instrucción STRB"
    = _* "STRB"i _* rd:reg64 _* "," _* src:str_source _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'STRB');
            const rdNode = createNode('DESTINATION', 'RD');
            const srcNode = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChildren(srcNode, src);
            addChild(node, rdNode);
            addChild(node, srcNode);
            return node;
        }
    / _* "STRB"i _* rd:reg32 _* "," _* src:str_source _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'STRB');
            const rdNode = createNode('DESTINATION', 'RD');
            const srcNode = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChildren(srcNode, src);
            addChild(node, rdNode);
            addChild(node, srcNode);
            return node;
        }

// Instrucción Store Pair Register (STP)
stp_inst "Instrucción STP"
    = _* "STP"i _* rd:reg64 _* "," _* rd2:reg64 _* "," _* src:str_source _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'STP');
            const rdNode = createNode('DESTINATION', 'RD');
            const rd2Node = createNode('DESTINATION', 'RD2');
            const srcNode = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(rd2Node, rd2);
            addChildren(srcNode, src);
            addChild(node, rdNode);
            addChild(node, rd2Node);
            addChild(node, srcNode);
            return node;
        }
    / _* "STP"i _* rd:reg32 _* "," _* rd2:reg32 _* "," _* src:str_source _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'STP');
            const rdNode = createNode('DESTINATION', 'RD');
            const rd2Node = createNode('DESTINATION', 'RD2');
            const srcNode = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(rd2Node, rd2);
            addChildren(srcNode, src);
            addChild(node, rdNode);
            addChild(node, rd2Node);
            addChild(node, srcNode);
            return node;
        }
// Instrucción Move Not (MVN)
mvn_inst "Instrucción MVN"
    = _* "MVN"i _* rd:reg64 _* "," _* src:mov_source _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'MVN');
            const rdNode = createNode('DESTINATION', 'RD');
            const srcNode = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(srcNode, src);
            addChild(node, rdNode);
            addChild(node, srcNode);
            return node;
        }
    / _* "MVN"i _* rd:reg32 _* "," _* src:mov_source _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'MVN');
            const rdNode = createNode('DESTINATION', 'RD');
            const srcNode = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(srcNode, src);
            addChild(node, rdNode);
            addChild(node, srcNode);
            return node;
        }

// Instrucción Logial Shift Left (LSL)
lsl_inst "Instrucción LSL"
    = _* "LSL"i _* rd:reg64 _* "," _* src1:reg64 _* "," _* src2:operand64 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'LSL');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
    / _* "LSL"i _* rd:reg32 _* "," _* src1:reg32 _* "," _* src2:operand32 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'LSL');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }

// Instrucción Logial Shift Right (LSR)
lsr_inst "Instrucción LSR"
    = _* "LSR"i _* rd:reg64 _* "," _* src1:reg64 _* "," _* src2:operand64 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'LSR');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
    / _* "LSR"i _* rd:reg32 _* "," _* src1:reg32 _* "," _* src2:operand32 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'LSR');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }

// Instrucción Arithmetical Shift Right (ASR)
asr_inst "Instrucción ASR"
    = _* "ASR"i _* rd:reg64 _* "," _* src1:reg64 _* "," _* src2:operand64 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'ASR');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
    / _* "ASR"i _* rd:reg32 _* "," _* src1:reg32 _* "," _* src2:operand32 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'ASR');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }

// Instrucción Rotate Right (ROR)
ror_inst "Instrucción ROR"
    = _* "ROR"i _* rd:reg64 _* "," _* src1:reg64 _* "," _* src2:operand64 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'ROR');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
    / _* "ROR"i _* rd:reg32 _* "," _* src1:reg32 _* "," _* src2:operand32 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'ROR');
            const rdNode = createNode('DESTINATION', 'RD');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(rdNode, rd);
            addChild(src1Node, src1);
            addChild(node, rdNode);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }

// Instrucción Compare (CMP)
cmp_inst "Instrucción CMP"
    = _* "CMP"i _* src1:reg64 _* "," _* src2:operand64 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'CMP');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(src1Node, src1);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }
    / _* "CMP"i _* src1:reg32 _* "," _* src2:operand32 _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'CMP');
            const src1Node = createNode('SOURCE1', 'SRC1');
            addChild(src1Node, src1);
            addChild(node, src1Node);
            addChild(node, src2);
            return node;
        }

// Instrucción Branch (B)
b_inst "Instrucción B"
    = _* "B"i _* l:label _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'B');
            const labelNode = createNode('LABEL', 'LBL');
            addChild(labelNode, l);
            addChild(node, labelNode);
            return node;
        }

// Instrucción Branch with Link (BL)
bl_inst "Instrucción BL"
    = _* "BL"i _* l:label _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'BL');
            const labelNode = createNode('LABEL', 'LBL');
            addChild(labelNode, l);
            addChild(node, labelNode);
            return node;
        }

// Instrucción Retornar de Subrutina (RET)
ret_inst "Instrucción RET"
    = _* "RET"i _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'RET');
            return node;
        }

// Instrucción Salto Condicional (BEQ)
beq_inst "Instrucción BEQ"
    = _* "BEQ"i _* l:label _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'BEQ');
            const labelNode = createNode('LABEL', 'LBL');
            addChild(labelNode, l);
            addChild(node, labelNode);
            return node;
        }

// Instrucción Salto Condicional (BNE)
bne_inst "Instrucción BNE"
    = _* "BNE"i _* l:label _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'BNE');
            const labelNode = createNode('LABEL', 'LBL');
            addChild(labelNode, l);
            addChild(node, labelNode);
            return node;
        }

// Instrucción Salto Condicional (BGT)
bgt_inst "Instrucción BGT"
    = _* "BGT"i _* l:label _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'BGT');
            const labelNode = createNode('LABEL', 'LBL');
            addChild(labelNode, l);
            addChild(node, labelNode);
            return node;
        }

// Instrucción Salto Condicional (BLT)
blt_inst "Instrucción BLT"
    = _* "BLT"i _* l:label _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'BLT');
            const labelNode = createNode('LABEL', 'LBL');
            addChild(labelNode, l);
            addChild(node, labelNode);
            return node;
        }

// Instrucción Supervisor Call (SVC)
svc_inst "Instrucción SVC"
    = _* "SVC"i _* i:immediate _* comment? "\n"?
        {
            const node = createNode('INSTRUCTION', 'SVC');
            addChild(node, i);
            return node;
        }


// Registros de propósito general 64 bits (limitado a los registros válidos de ARM64)
reg64 "Registro_64_Bits"
    = "x"i ("30" / [12][0-9] / [0-9])
        {
            const node = createNode('RG_64_BITS', 'reg64');
            setValue(node, text());
            return node;
        }
    / "SP"i // Stack Pointer
        {
            const node = createNode('R_STACK_POINTER', 'SP');
            setValue(node, text());
            return node;
        }
    / "LR"i  // Link Register
        {
            const node = createNode('R_LINK_REGISTER', 'LR');
            setValue(node, text());
            return node;
        }
    / "ZR"i  // Zero Register
        {
            const node = createNode('R_ZERO_REGISTER', 'ZR');
            setValue(node, text());
            return node;
        }
// Registros de propósito general 32 bits (limitado a los registros válidos de ARM64)
reg32 "Registro_32_Bits"
    = "w"i ("30" / [12][0-9] / [0-9])
        {
            const node = createNode('RG_32_BITS', 'reg32');
            setValue(node, text());
            return node;
        }

// Operando puede ser un registro o un número inmediato
operand64 "Operandor 64 Bits"
    = r:reg64 _* "," _* ep:extend_op                 // Registro con extensión de tamaño
        {
            const node = createNode('SOURCE2', 'SRC2');
            addChild(node, r);
            if(ep){
            addChild(node, ep);
            }
            return node;
        }  
    / r:reg64 lp:(_* "," _* shift_op _* immediate)?  // Registro con desplazamiento lógico opcional
        {
            const node = createNode('SOURCE2', 'SRC2');
            addChild(node, r);
            if(lp){
                addChild(node, lp[3]);
                addChild(node, lp[5]);
            }
            return node;
        }   
    / i:immediate                                     // Valor inmediato
        {
            const node = createNode('SOURCE2', 'SRC2');
            addChild(node, i);
            return node;
        }                             

// Operando puede ser un registro o un número inmediato
operand32 "Operandor 32 Bits"
    = r:reg32 lp:(_* "," _* shift_op _* immediate)?  // Registro con desplazamiento lógico
        {
            const node = createNode('SOURCE2', 'SRC2');
            addChild(node, r);
            if(lp){
                addChild(node, lp[3]);
                addChild(node, lp[5]);
            }
            return node;
        }
    / i:immediate                             // Valor inmediato
        {
            const node = createNode('SOURCE2', 'SRC2');
            addChild(node, i);
            return node;
        
        }

// Definición de desplazamientos
shift_op "Operador de Desplazamiento"
    = "LSL"i
        {
            const node = createNode('LOGICAL_SHIFT_LEFT', 'LSL');
            setValue(node, text());
            return node;
        } 
    / "LSR"i
        {
            const node = createNode('LOGICAL_SHIFT_RIGHT', 'LSR');
            setValue(node, text());
            return node;
        } 
    / "ASR"i
        {
            const node = createNode('ARITHMETIC_SHIFT_RIGHT', 'ASR');
            setValue(node, text());
            return node;
        }

// Definición de extensiones
extend_op "Operador de Extensión"
    = "UXTB"i
        {
            const node = createNode('UNSIGNED_EXTEND_BYTE', 'UXTB');
            setValue(node, text());
            return node;
        }
    / "UXTH"i 
        {
            const node = createNode('UNSIGNED_EXTEND_HALFWORD', 'UXTH');
            setValue(node, text());
            return node;
        }
    / "UXTW"i 
        {
            const node = createNode('UNSIGNED_EXTEND WORD', 'UXTW');
            setValue(node, text());
            return node;
        }
    / "UXTX"i
        {
            const node = createNode('UNSIGNED_EXTEND_DOUBLEWORD', 'UXTX');
            setValue(node, text());
            return node;
        }
    / "SXTB"i
        {
            const node = createNode('SIGNED_EXTEND_BYTE', 'SXTB');
            setValue(node, text());
            return node;
        }
    / "SXTH"i
        {
            const node = createNode('SIGNED_EXTEND_HALFWORD', 'SXTH');
            setValue(node, text());
            return node;
        }
    / "SXTW"i 
        {
            const node = createNode('SIGNED_EXTEND_WORD', 'SXTW');
            setValue(node, text());
            return node;
        }
    / "SXTX"i
        {
            const node = createNode('SIGNED_EXTEND_DOUBLEWORD', 'SXTX');
            setValue(node, text());
            return node;
        }

// Definición de valores inmediatos
immediate "Inmediato"
    = integer
        {
            const node = createNode('INMEDIATE_OP', 'Integer');
            setValue(node, text());
            return node;
        }
    / "#" "'"letter"'"
        {
            const node = createNode('INMEDIATE_OP', '#');
            setValue(node, text());
            return node;
        }
    / "#" "0x" hex_literal
        {
            const node = createNode('INMEDIATE_OP', '#');
            setValue(node, text());
            return node;
        }
    / "#" "0b" binary_literal
        {
            const node = createNode('INMEDIATE_OP', '#');
            setValue(node, text());
            return node;
        }
    / "#" integer
        {
            const node = createNode('INMEDIATE_OP', '#');
            setValue(node, text());
            return node;
        }

binary_literal
  = [01]+ // Representa uno o más dígitos binarios
hex_literal
    = [0-9a-fA-F]+ // Representa uno o más dígitos hexadecimales
letter
    = [a-zA-Z] 
// Expresiones
expression "Espresión"
    = label
    / integer
        {
            const node = createNode('INTEGER', 'Integer');
            setValue(node, text());
            return node;
        }

// Etiqueta
label "Etiqueta"
    = [a-zA-Z_][a-zA-Z0-9_]*
        {
            const node = createNode('LABEL', 'Label');
            setValue(node, text());
            return node;
        }

// Número entero
integer "Numero Entero"
    = [0-9]+

// Cadena ASCII
string "Cadena de Texto"
    = '"' ([^"]*) '"'
    {
        const node = createNode('STRING', 'String');
        setValue(node, text().slice(1, -1));
        return node;
    }

// Línea en blanco
blank_line "Linea En Blanco"
    = _* comment? "\n"
        {
            const node = createNode('EMPTY', 'Empty');
            return node;
        }

// Comentarios
comment "Comentario"
    = ("//" [^\n]*) 
        {
            const node = createNode('COMMENT', 'Comment');
            setValue(node, text());
            return node;
        }
  / (";" [^\n]*)
        {
            const node = createNode('COMMENT', 'Comment');
            setValue(node, text());
            return node;
        }

mcomment "Comentario Multilinea"
    = "/*" ([^*] / [*]+ [^*/])* "*/"
        {
            const node = createNode('COMMENT', 'Comment');
            setValue(node, text());
            return node;
        }
// Espacios en blanco
_ "Ignorado"
    = [ \t]+