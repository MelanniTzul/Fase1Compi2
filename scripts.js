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
function salud(){
    alert("funciona mel");
 }


function CargarArchivo() {
    
    const fileInput = document.getElementById('fileInput');
    const textarea = document.getElementById('textoEntrada');
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
function limpiar() {
    const textarea = document.getElementById('textoEntrada');
    textarea.value = '';
    fileInput.value = '';
    actualizarLineas();
}

function actualizarLineas() {
    const textarea = document.getElementById('textoEntrada');
    const lineNumbers = document.getElementById('lineNumbers');
    const lines = textarea.value.split('\n').length;
    lineNumbers.innerHTML = Array.from({ length: lines }, (_, i) => i + 1).join('<br>');
    syncScroll();
}

function syncScroll() {
    const textarea = document.getElementById('textoEntrada');
    const lineNumbers = document.getElementById('lineNumbers');
    lineNumbers.scrollTop = textarea.scrollTop;
}
