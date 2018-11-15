function atualizarGenero() {
    var e = document.getElementById("selectGenero");
    var param = e.options[e.selectedIndex].text;
    console.log(param);

    var xhttp = new XMLHttpRequest();
    var jsonProdutos = "";
    xhttp.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            console.log("J: " + this.responseText);
            if (this.responseText != "") {
                jsonProdutos = JSON.parse(this.responseText);
            }
            listarProdutos(jsonProdutos);
       }
    };
    xhttp.open("GET", "BuscarProdutosServlet?method=getProdutosRecentesPorGenero&param=" + param, true);
    xhttp.setRequestHeader("Content-type", "application/json");
    xhttp.send();
}

var listarProdutos = function (json) {
    var html = "";

    if (json.length > 0 && json != "") {

        for (var i = 0; i < json.length; i++) {
            html += '<div class="col-lg-4 col-sm-6 portfolio-item">';
            html += '<div class="card h-100">';
            html += '<a href="./pagProduto.jsp?id=' + json[i].id + '"><img class ="card-img-top" src="./imagens?id_prod=' + json[i].id + '&img=1" alt=""></a>';
            html += '<div class="card-body">';
            html += '<h4 class="card-title">';
            html += '<a href="./pagProduto.jsp?id=' + json[i].id + '">' + json[i].titulo + '</a>';
            html += '</h4>';
            html += '<p class="card-text">' + json[i].descricao + '</p>';
            html += '<a href="./pagProduto.jsp?id=' + json[i].id + '" class="btn btn-primary">Leia Mais</a>';
            html += '</div>';
            html += '</div>';
            html += '</div>';
        }

        document.getElementById("recentesPorGenero").innerHTML = html;
    }
};