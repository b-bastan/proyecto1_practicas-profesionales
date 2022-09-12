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
    padre.innerHTML += '<div class="ingredientes__input--ingrediente"><i class="fa-solid fa-list-ul"></i><input type="text" placeholder="Ejemplo: Papa" maxlength="100"><a href="#" class="trash"><i class="fa-solid fa-trash-can"></i></a></div>'
});

// Insertar secciones

insertarS = document.getElementById('seccion_btn');
insertarS.addEventListener('click', function (){
    padre = document.getElementById('ingredientes__input');
    padre.innerHTML += '<div class="ingredientes__input--seccion"><i class="fa-solid fa-list-ul"></i><input type="text" placeholder="Ejemplo: Tuco" maxlength="100"><a href="#" class="trash"><i class="fa-solid fa-trash-can"></i></a></div>'
});

// Insertar pasos

insertarP = document.getElementById('paso_btn');
insertarP.addEventListener('click', function (){
    padre = document.getElementById('pasos__paso');
    last = document.getElementsByClassName("last");
    numeros = last.length;
    numeros += 1;
    padre.innerHTML += '<div class="div" draggable="true"><div class="pasos__paso--parte1"><div class="last">' + numeros + '</div><i class="fa-solid fa-list-ul"></i></div><div class="pasos__paso--parte2"><input type="text" placeholder="Ejemplo: Precalentar el horno a 180°..." maxlength="300"><input type="image"></div><a href="#" class="trash"><i class="fa-solid fa-trash-can"></i></a></div>';
    // padre.lastChild.innerHTML = "SDAFSADF";
});

// Reordenar elementos

// LINK PARA ESTO https://www.digitalocean.com/community/tutorials/js-drag-and-drop-vanilla-js-es

function handleDragStart(e) {
    this.style.opacity = '0.6';

    dragSrcEl = this;   

    e.dataTransfer.effectAllowed = 'move';
    e.dataTransfer.setData('text/html', this.innerHTML);
}

function handleDragEnd(e) {
    this.style.opacity = '1';
    items.forEach(function (item) {
        item.classList.remove('over');
    });
}

function handleDragOver(e) {
    if (e.preventDefault) {
      e.preventDefault();
    }

    return false;
}

function handleDragEnter(e) {
    this.classList.add('over');
}

function handleDragLeave(e) {
    this.classList.remove('over');
}

function handleDrop(e) {
    e.stopPropagation(); // stops the browser from redirecting.

    if (dragSrcEl !== this) {
        dragSrcEl.innerHTML = this.innerHTML;
        this.innerHTML = e.dataTransfer.getData('text/html');
    }
    return false;
}

let items = document.querySelectorAll('.div');

items.forEach(function(item) {
    item.addEventListener('dragstart', handleDragStart);
    item.addEventListener('dragend', handleDragEnd);
    item.addEventListener('drop', handleDrop);
    item.addEventListener('dragenter', handleDragEnter);
    item.addEventListener('dragleave', handleDragLeave);
    item.addEventListener('dragend', handleDragEnd);
});

// Eliminar ingredientes

document.querySelectorAll('.trash').forEach(item => {
    item.addEventListener('click', event => {
        $(item).closest("#pasos").remove();
    })
}) 
