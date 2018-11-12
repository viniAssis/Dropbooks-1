var btnAddToCart = document.getElementById("addToCart");

function comprar(id) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            console.log(this.responseText);
            if (this.responseText == "ok") {
                document.location.href = "./carrinho.jsp";
            } else if (this.responseText == "invalido") {
                alert("Você só pode adicionar ao carrinho produtos do mesmo vendedor.");
            } else {
                console.log("Ocorreu um erro inesperado.");
            }
       }
    };
    xhttp.open("GET", "ComprarServlet?livro=" + id, true);
    xhttp.setRequestHeader("Content-type", "application/json");
    xhttp.send();
}

btnAddToCart.addEventListener("click", function() {
    comprar(btnAddToCart.value);
});