
window.onload = function () {





    document.getElementById("cpf").onkeypress = function () {
        return Onlynumbers(event);
    };

     document.getElementById("telefone").onkeypress = function () {
        return Onlynumbers(event);
    };

     document.getElementById("celular").onkeypress = function () {
        return Onlynumbers(event);
    };

        document.getElementById("cep").onkeypress = function () {
        return Onlynumbers(event);
    };

      document.getElementById("numero").onkeypress = function () {
        return Onlynumbers(event);
    };

       document.getElementById("banco").onkeypress = function () {
        return Onlynumbers(event);
    };

       document.getElementById("agencia").onkeypress = function () {
        return Onlynumbers(event);
    };

       document.getElementById("conta").onkeypress = function () {
        return Onlynumbers(event);
    };

         document.getElementById("dig").onkeypress = function () {
        return Onlynumbers(event);
    };




     document.getElementById("nomeRazao").onkeypress = function () {
        return Onlychars(event);
    };

       document.getElementById("end").onkeypress = function () {
        return Onlychars(event);
    };

       document.getElementById("bairro").onkeypress = function () {
        return Onlychars(event);
    };

      document.getElementById("estado").onkeypress = function () {
        return Onlychars(event);
    };


    document.getElementById("cidade").onkeypress = function () {
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
    if ((tecla >= "33") && (tecla <= "47") || (tecla >= "58") && (tecla <= "126")) {
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
    if ((tecla >= "33") && (tecla <= "64")){
        return false;
    }
}
