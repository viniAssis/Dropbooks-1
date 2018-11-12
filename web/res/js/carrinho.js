var valorFrete = 0;
var valorTotal = 0.0;
var idVendedor = 0;
var cepDestino = "";
var jsonCart = "";
var jsonVendedor = "";

function loadShoppingCart(cepComprador) {
    var xhttp = new XMLHttpRequest();
    cepDestino = cepComprador;
    
    xhttp.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            if (this.responseText != "") {
                jsonCart = JSON.parse(this.responseText);
                if (jsonCart != "")
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
    var html = "";
    var htmlOrder = "";

    console.log(json);
    if (json.length > 0 && json != "") {

        htmlOrder += '<h4 class="d-flex justify-content-between align-items-center mb-3">';
        htmlOrder += '<span class="text-muted">Resumo do Pedido</span>';
        htmlOrder += '<span class="badge badge-secondary badge-pill" id="qtdeProdutos"  name="qtdeProdutos">' + json.length + '</span>';
        htmlOrder += '</h4>';
        htmlOrder += '<ul class="list-group mb-3">';

        for (var i = 0; i < json.length; i++) {
            html += '<div class="caixa">';
            html += '<img src=" ' + json[i].produto.imagem_1 + ' " width="150" height ="200" alt=""/>';
            html += '<div id="titulo">';
            html += '<label id="idTitulo" name="idTitulo">' + json[i].produto.titulo + '</label>';
            html += '<br/>';
            html += '<label id="idAutor" name="idAutor">Autor: ' + json[i].produto.autor + '</label>';
            html += '<br/>';
            html += '<label>Quantidade:</label>';
            html +='<input id="idQtde" name="idQtde" type="number" onchange="atualizarQuantidade(this, ' + json[i].produto.id + ')" value="' + json[i].quantidade + '">';
            html += '<br/>';
            html += '<a href="#" onclick="excluir(' + json[i].produto.id + ')">Excluir</a>';
            html += '</div>';
            html += '</div>';

            htmlOrder += '<li class="list-group-item d-flex justify-content-between lh-condensed">';
            htmlOrder += '<div>';
            htmlOrder += '<h6 class="my-0" id="idTitulo"  name="idTitulo">' + json[i].produto.titulo + '</h6>';
            htmlOrder += '<small class="text-muted" id="idAutor"  name="idAutor">Autor: ' + json[i].produto.autor + '</small>';
            htmlOrder += '</div>';
            htmlOrder += '<span class="text-muted" id="idValor" name="idValor">R$ ' + Number.parseFloat(json[i].produto.preco).toFixed(2) + '</span>';
            htmlOrder += '</li>';

            console.log(Number.parseFloat(json[i].quantidade).toFixed(2));
            valorTotal += Number.parseFloat(json[i].quantidade) * Number.parseFloat(json[i].produto.preco);
        }
        
        calcWsCorreios(jsonVendedor.cep, cepDestino, valorTotal);
        
        htmlOrder += '<div id="valorFrete"></div>';
        
        htmlOrder += '<li class="list-group-item d-flex justify-content-between">';
        htmlOrder += '<span>Valor Total</span>';
        htmlOrder += '<strong id="valorTotal" name="valorTotal">R$ ' + valorTotal + '</strong>';
        htmlOrder += '</li>';
        htmlOrder += '<li class="nav-item d-flex">';
        htmlOrder += '<a class="nav-link" href="" >Continuar comprando</a>';
        htmlOrder += '</li>';
        htmlOrder += '</ul>';
        htmlOrder += '<form action="checkout.jsp">';
        htmlOrder += '<input type="submit" class="action-button btn-block" value="Finalizar Pedido"/>';
        htmlOrder += '</form>';
    } else {
        html = "<h4>Carrinho vazio</h4>"
    }

    document.getElementById("list-cart").innerHTML = html;
    document.getElementById("order").innerHTML = htmlOrder;
};

function excluir(id) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            document.location.reload();
       }
    };
    xhttp.open("GET", "RemoverItemCarrinhoServlet?livro=" + id, true);
    xhttp.send(); 
}

function atualizarQuantidade(event, id) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            document.location.reload();
        }
    };
    xhttp.open("GET", "AtualizarCarrinhoServlet?livro=" + id + "&qtd="+ event.value, true);
    xhttp.send(); 
}

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

var calcWsCorreios = function(cepOrigem, cepDestino, valor) {
    $.ajax({
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
                var sum = Number.parseFloat(valorTotal) + Number.parseFloat(valor);
                var html = "";
                html += '<li class="list-group-item d-flex justify-content-between lh-condensed">';
                html += '<div>';
                html += '<h6 class="my-0" id="idTitulo"  name="idTitulo">Frete</h6>';
                html += '<small class="text-muted" id="idAutor"  name="idAutor"></small>';
                html += '</div>';
                html += '<span class="text-muted" id="idValor" name="idValor">R$ ' + valor + '</span>';
                html += '</li>';
                
                $("#valorFrete").html(html);
                $("#valorTotal").text("R$ " + sum.toFixed(2));
                
            }
        }
    });
};