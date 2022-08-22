function iniciar(){
    soltar = document.getElementById('cajasoltar');
    soltar.addEventListener('dragenter', function(e){
    e.preventDefault(); }, false);
    soltar.addEventListener('dragover', function(e){
    e.preventDefault(); }, false);
    soltar.addEventListener('drop', soltado, false);
    }
    function soltado(e){
        e.preventDefault();
        var archivos=e.dataTransfer.files;
        var lista='';
        for(var f=0;f<archivos.length;f++){
            lista += 'Archivo: ' + archivos[f].name + ' ' + archivos[f].size + '<br>';
        }
        soltar.innerHTML = lista;
    }
    window.addEventListener('load', iniciar, false);

// Insertar ingredientes

insertarI = document.getElementById('ingrediente_btn');
insertarI.addEventListener('click', function (){
    padre = document.getElementById('ingredientes__input');
    padre.innerHTML += '<div class="ingredientes__input--ingrediente"><i class="fa-solid fa-list-ul"></i><input type="text" placeholder="Ejemplo: Papa" maxlength="100"><i class="fa-solid fa-trash-can"></i></div>'
});

// Insertar secciones

insertarS = document.getElementById('seccion_btn');
insertarS.addEventListener('click', function (){
    padre = document.getElementById('ingredientes__input');
    padre.innerHTML += '<div class="ingredientes__input--seccion"><i class="fa-solid fa-list-ul"></i><input type="text" placeholder="Ejemplo: Tuco" maxlength="100"><i class="fa-solid fa-trash-can"></i></div>'
});

// Insertar pasos

insertarP = document.getElementById('paso_btn');
insertarP.addEventListener('click', function (){
    padre = document.getElementById('pasos__paso');
    last = document.getElementsByClassName("last");
    numeros = last.length;
    numeros += 1;
    alert(numeros)
    padre.innerHTML += '<div class="div"><div class="pasos__paso--parte1"><div class="last">' + numeros + '</div><i class="fa-solid fa-list-ul"></i></div><div class="pasos__paso--parte2"><input type="text" placeholder="Ejemplo: Precalentar el horno a 180°..." maxlength="300"><input type="image"></div><div class="pasos__paso--parte3"><i class="fa-solid fa-trash-can"></i></div></div>';
    // padre.lastChild.innerHTML = "SDAFSADF";
});