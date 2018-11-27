
window.onload = function () {


    document.getElementById("nomeRazao").onkeypress = function () {
        return Onlychars(event);
    };

    document.getElementById("cpf").onkeypress = function () {
        return Onlynumbers(event);
    };
    
    document.getElementById("telefone").onkeypress = function () {
        return Onlynumbers(event);
    };

    document.getElementById("logradouro").onkeypress = function () {
        return Onlychars(event);
    };

    document.getElementById("cep").onkeypress = function () {
        return Onlynumbers(event);
    };
    document.getElementById("banco").onkeypress = function () {
           return Onlychars(event);
    };
    document.getElementById("agencia").onkeypress = function () {
        return Onlynumbers(event);
    };
    document.getElementById("conta").onkeypress = function () {
        return Onlynumbers(event);
    };
    document.getElementById("digito").onkeypress = function () {
        return Onlynumbers(event);
    };
    document.getElementById("numero").onkeypress = function () {
        return Onlynumbers(event);
    };
    
     document.getElementById("cidade").onkeypress = function () {
        return Onlychars(event);
    };

    document.getElementById("complemento").onkeypress = function () {
        return Onlychars(event);
    };
   
    document.getElementById("bairro").onkeypress = function () {
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