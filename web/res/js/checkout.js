var valorFrete = 0;
var idVendedor = 0;
var cepDestino = "";
var jsonCart = "";
var jsonVendedor = "";
var valorTotal = 0.0;

var calcWsCorreios = function(cepOrigem, cepDestino, valor) {
    $.ajax({
        async: false,
        method: "POST",
        url: "http://ws.correios.com.br/calculador/CalcPrecoPrazo.asmx/CalcPrecoPrazo",
        data: {
            nCdEmpresa: "",
            sDsSenha: "",
            nCdServico: '41106',
            sCepOrigem: cepOrigem,
            sCepDestino: cepDestino,
            nVlPeso: '1',
            nCdFormato: '1', 
            nVlComprimento: '20',
            nVlAltura: '5',
            nVlLargura: '15',
            nVlDiametro: '0',
            sCdMaoPropria: "s", 
            nVlValorDeclarado: valor, 
            sCdAvisoRecebimento: "s"
        },
        dataType: "xml",
        success: function (data) {
            var valor = Number.parseFloat($(data).find('Valor').text()).toFixed(2);
            var prazo = $(data).find('PrazoEntrega').text();
            if (valor > 0) {
                valorFrete = valor;
            }
        }
    });
};

function loadShoppingCart(cepComprador) {
    var xhttp = new XMLHttpRequest();
    cepDestino = cepComprador;
    
    xhttp.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            if (this.responseText != "") {
                jsonCart = JSON.parse(this.responseText);
                idVendedor = jsonCart[0].produto.id_usuario;
                getUserJson(idVendedor);
            }
       }
    };
    xhttp.open("GET", "GetShoppingCartServlet", true);
    xhttp.setRequestHeader("Content-type", "application/json");
    xhttp.send();
}

var listarCarrinho = function (json) {
    var htmlOrder = "";

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
        
        calcWsCorreios(jsonVendedor.cep, cepDestino, valorTotal);
        
        var sum = Number.parseFloat(valorTotal) + Number.parseFloat(valorFrete);
        
        if (valorFrete) {
            htmlOrder += '<li>';
            htmlOrder += '<h6 class="my-0">Frete</h6>';
            htmlOrder += '<span class="text-muted" id="idValor" name="idValor">R$ ' + valorFrete + '</span>';
            htmlOrder += '</li>';
        }
        htmlOrder += '<br />';
        htmlOrder += '<li class="d-flex justify-content-between">';
        htmlOrder += '<span>Valor Total</span>';
        htmlOrder += '<strong>R$ ' + sum.toFixed(2) + '</strong>';
        htmlOrder += '</li>';
        htmlOrder += '</ul>';
    } else {
        htmlOrder = "<h4>Seu carrinho est&aacute; vazio</h4>"
    }
    document.getElementById("order").innerHTML = htmlOrder;
};

function getUserJson(id) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            console.log("JSON: " + this.responseText);
            if (this.responseText != "") {
                jsonVendedor = JSON.parse(this.responseText);
            }
            listarCarrinho(jsonCart);
       }
    };
    xhttp.open("GET", "GetUserJSONServlet?id=" + id, true);
    xhttp.setRequestHeader("Content-type", "application/json");
    xhttp.send();
}

function finalizarPedido() {
    var els = document.getElementsByName("formaPagamento");
    var pagamento = "";
    for (var i = 0; i < els.length; i++){
        if ( els[i].checked ) {
            pagamento = els[i].value;
        }
    }
    
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            console.log("JSON: " + this.responseText);
            if (this.responseText == "ok") {
                document.location.href = "./status.jsp";
            } else {
                alert("Ocorreu algum erro ao gerar pedido. Tente novamente.");
            }
       }
    };
    xhttp.open("GET", "FinalizarPedidoServlet?total=" + valorTotal + "&frete=" + valorFrete + "&pagamento=" + pagamento, true);
    xhttp.setRequestHeader("Content-type", "application/json");
    xhttp.send();
}

var btnFinalizar = document.getElementById("finalizarPedido");
btnFinalizar.addEventListener("click", function(){
    finalizarPedido();
});