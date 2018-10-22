var calcWsCorreios = function(cepOrigem, valor) {
    $.ajax({
        method: "POST",
        url: "http://ws.correios.com.br/calculador/CalcPrecoPrazo.asmx/CalcPrecoPrazo",
        data: {
            nCdEmpresa: "",
            sDsSenha: "",
            nCdServico: '41106',
            sCepOrigem: cepOrigem,
            sCepDestino: $("#cepDestino").val(),
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
            var valor = $(data).find('Valor').text();
            var prazo = $(data).find('PrazoEntrega').text();
            $("#resultadoFrete").html("Chega em até " + prazo + " dias úteis via PAC por R$ " + Number.parseFloat(valor).toFixed(2));
            console.log("Chega em até " + prazo + " dias úteis via PAC por R$ " + Number.parseFloat(valor).toFixed(2));
        }
    });
};