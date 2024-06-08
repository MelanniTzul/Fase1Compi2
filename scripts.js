fetch('html/navbar.html')
        .then(response => response.text())
        .then(data => document.getElementById('navbar').innerHTML = data);
       
        fetch('html/textareas.html')
        .then(response => response.text())
        .then(data => document.getElementById('textareas').innerHTML = data);
        
        fetch('html/tabs.html')
        .then(response => response.text())
        .then(data => document.getElementById('tabs').innerHTML = data);

        function saludo(){
            alert("hola Douglas");
        }
        function optimizar(){
            alert("Optimizado con exito xd");
        }
        function CargarArchivo(){
            const fileInput = document.getElementById('fileInput');
            const textarea = document.getElementById('textoEntrada');

            const file = fileInput.files[0];
            if (file) {
                const reader = new FileReader();

                reader.onload = function(e) {
                    textarea.value = e.target.result;
                };

                reader.readAsText(file);
                alert("Archivo cargado con exito");
            }
        }