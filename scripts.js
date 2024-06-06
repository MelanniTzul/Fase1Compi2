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