function loadShoppingCart() {
    var xhttp = new XMLHttpRequest();
    var jsonCart = "";
    xhttp.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            console.log("J: " + this.responseText);
            if (this.responseText != "") {
                jsonCart = JSON.parse(this.responseText);
            }
            listarCarrinho(jsonCart);
       }
    };
    xhttp.open("GET", "GetShoppingCartServlet", true);
    xhttp.setRequestHeader("Content-type", "application/json");
    xhttp.send();
}

var listarCarrinho = function (json) {
    var htmlOrder = "";
    var valorTotal = 0.0;

    if (json.length > 0 && json != "") {

        htmlOrder += '<ul>';

        for (var i = 0; i < json.length; i++) {
            htmlOrder += '<li>';
            htmlOrder += '<h6 class="my-0" id="idTitulo"  name="idTitulo">' + json[i].produto.titulo + ' (' + json[i].quantidade + ')</h6>';
            htmlOrder += '<span class="text-muted" id="idValor" name="idValor">R$ ' + Number.parseFloat(json[i].produto.preco).toFixed(2) + '</span>';
            htmlOrder += '</li>';

            console.log(Number.parseFloat(json[i].quantidade).toFixed(2));
            valorTotal += Number.parseFloat(json[i].quantidade) * Number.parseFloat(json[i].produto.preco);
        }

        htmlOrder += '<li>';
        htmlOrder += '<h6 class="my-0">Frete</h6>';
        htmlOrder += '<span class="text-muted" id="idValor" name="idValor">R$ 50,00</span>';
        htmlOrder += '</li>';
        htmlOrder += '<br />';
        htmlOrder += '<li class="d-flex justify-content-between">';
        htmlOrder += '<span>Valor Total</span>';
        htmlOrder += '<strong>R$ ' + valorTotal.toFixed(2) + '</strong>';
        htmlOrder += '</li>';
        htmlOrder += '</ul>';
    } else {
        htmlOrder = "<h4>Seu carrinho est&aacute; vazio</h4>"
    }
    document.getElementById("order").innerHTML = htmlOrder;
};