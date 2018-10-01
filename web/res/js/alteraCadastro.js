
window.onload = function () {


    $(document).ready(function () {
        $('#inputTelefone').mask('(99)99999-9999'); 
        $('#inputCEP').mask('99999-999')

    });
    document.getElementById("inputNome").onkeypress = function () {
        return Onlychars(event);
    };

    document.getElementById("inputTelefone").onkeypress = function () {
        return Onlynumbers(event);
    };
    
    document.getElementById("inputCEP").onkeypress = function () {
        return Onlynumbers(event);
    };

    document.getElementById("endereco").onkeypress = function () {
        return Onlychars(event);
    };

    document.getElementById("inputNumero").onkeypress = function () {
        return Onlynumbers(event);
    };
    
     document.getElementById("inputCity").onkeypress = function () {
        return Onlychars(event);
    };

    document.getElementById("complemento").onkeypress = function () {
        return Onlychars(event);
    };
   
    document.getElementById("inputBairro").onkeypress = function () {
        return Onlychars(event);
    };

    document.getElementById("estado").onkeypress = function () {
        return Onlychars(event);
    };

   




};

function Onlynumbers(e) {
    var tecla = new Number();
    if (window.event) {
        tecla = e.keyCode;
    } else if (e.which) {
        tecla = e.which;
    } else {
        return true;
    }
    if ((tecla >= "97") && (tecla <= "122")) {
        return false;
    }
}

function Onlychars(e) {
    var tecla = new Number();
    if (window.event) {
        tecla = e.keyCode;
    } else if (e.which) {
        tecla = e.which;
    } else {
        return true;
    }
    if ((tecla >= "48") && (tecla <= "57")) {
        return false;
    }
}