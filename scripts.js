fetch('html/navbar.html')
    .then(response => response.text())
    .then(data => document.getElementById('navbar').innerHTML = data);

fetch('html/textareas.html')
    .then(response => response.text())
    .then(data => {
        document.getElementById('textareas').innerHTML = data;
        actualizarLineas(); // Inicializar los números de línea
    });

fetch('html/tabs.html')
    .then(response => response.text())
    .then(data => document.getElementById('tabs').innerHTML = data);


function optimizar() {
    alert("Optimizado con exito xd");
}
// function loadTree(){
//     let x;
//         x = document.getElementById("x").value;
//         var container = document.getElementById("mynetwork");
//         var DOTstring = PEG.parse(x);
//         var parsedData = vis.parseDOTNetwork(DOTstring);
//         var data = {
//             nodes: parsedData.nodes,
//             edges: parsedData.edges
//         }
//         var options = {
//             nodes: {
//                 widthConstraint: 20,
//             },        
//             layout: {
//                 hierarchical: {
//                     levelSeparation: 60,
//                     nodeSpacing: 80,
//                     parentCentralization: true,
//                     direction: 'UD',        // UD, DU, LR, RL
//                     sortMethod: 'directed',  // hubsize, directed
//                     shakeTowards: 'roots'  // roots, leaves                        
//                 },
//             },
//             nodes: {
//                 while: 85,
//               },                         
//         };
//         var network = new vis.Network(container, data, options);
//  }

function loadTree() {
    let x = document.getElementById("x").value;
    var networkDiv = document.getElementById("mynetwork");
    log.innerHTML = ""; 

    try {
        var DOTstring = PEG.parse(x);
        console.log('esto trae', DOTstring);
        lo.textContent = DOTstring; // Mostrar el mensaje de error en el div
        var parsedData = vis.parseDOTNetwork(DOTstring);
        var data = {
            nodes: parsedData.nodes,
            edges: parsedData.edges
        };
        var options = {
            nodes: {
                widthConstraint: 20
            },        
            layout: {
                hierarchical: {
                    levelSeparation: 60,
                    nodeSpacing: 80,
                    parentCentralization: true,
                    direction: 'UD',        // UD, DU, LR, RL
                    sortMethod: 'directed',  // hubsize, directed
                    shakeTowards: 'roots'  // roots, leaves                        
                }
            },
            nodes: {
                 while: 85,
                }, 
        };
        var network = new vis.Network(networkDiv, data, options);
    } catch (err) {
        lo.textContent = "Error:" + err.message;
        console.error("Error:", err.message);
    }
}


function CargarArchivo() {
    
    const fileInput = document.getElementById('fileInput');
    const textarea = document.getElementById('x');
    const file = fileInput.files[0];
    if (file) {
        const reader = new FileReader();

        reader.onload = function(e) {
            textarea.value = e.target.result;
            actualizarLineas();
        };

        reader.readAsText(file);
    }
}
function clean() {
    const textarea = document.getElementById('x');
    textarea.value = '';
    fileInput.value = '';
    log.innerHTML = '';
    lo.value = '';
    const container = document.getElementById('mynetwork');
            container.innerHTML = '';
    actualizarLineas();
}

function actualizarLineas() {
    const textarea = document.getElementById('x');
    const lineNumbers = document.getElementById('lineNumbers');
    const lines = textarea.value.split('\n').length;
    lineNumbers.innerHTML = Array.from({ length: lines }, (_, i) => i + 1).join('<br>');
    syncScroll();
}

function syncScroll() {
    const textarea = document.getElementById('x');
    const lineNumbers = document.getElementById('lineNumbers');
    lineNumbers.scrollTop = textarea.scrollTop;
}

function guardarArchivo() {
    const textarea = document.getElementById('x');
    const texto = textarea.value;

    if (texto.trim() === "") {
        alert("El área de texto está vacía. Por favor, ingrese algún texto antes de guardar.");
        return;
    }

    const blob = new Blob([texto], { type: "text/plain" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = "archivo.s";
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
    
}