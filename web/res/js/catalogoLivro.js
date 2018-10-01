window.onload = function () {


    document.getElementById("namelivro").onkeypress = function () {
        return Onlychars(event);
    };
    
        document.getElementById("nameAutor").onkeypress = function () {
        return Onlychars(event);
    };
    
        document.getElementById("nameEditora").onkeypress = function () {
        return Onlychars(event);
    };
    
    
        document.getElementById("valor").onkeypress = function () {
        return Onlynumbers(event);
    };
    
    
    
    document.getElementById("descricaoProduto").onkeypress = function () {
        return Onlychars(event);
    };

        
    document.getElementById("anoLancamento").onkeypress = function () {
        return Onlynumbers(event);
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