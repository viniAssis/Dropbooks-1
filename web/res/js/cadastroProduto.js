
window.onload = function () {


    document.getElementById("nameLivro").onkeypress = function () {
        return Onlychars(event);
    };

    document.getElementById("nameAutor").onkeypress = function () {
        return Onlychars(event);
    };

    document.getElementById("nameEditora").onkeypress = function () {
        return Onlychars(event);
    };


    document.getElementById("anoLancamento").onkeypress = function () {
        return Onlynumbers(event);
    };



    document.getElementById("idiomaLivro").onkeypress = function () {
        return Onlychars(event);
    };


    document.getElementById("qtdLivro").onkeypress = function () {
        return Onlynumbers(event);
    };

    document.getElementById("valorLivro").onkeypress = function () {
        return Onlynumbers(event);
    };


    document.getElementById("descricao").onkeypress = function () {
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