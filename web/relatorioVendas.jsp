<%@page import="java.sql.Date"%>
<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page import="modelDAO.VendasDAO"%>
<%@page import="model.Vendas"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">


        <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script>
            $(function () {
                $("#header").load("MenuNavBar.jsp");
                $("#footer").load("Footer.jsp");
            });
        </script>
        <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
        <!------ Include the above in your HEAD tag ---------->
        <title>Relatorio de Vendas</title>
        <!--  Session -->
        <%
            String email = request.getSession().getAttribute("email").toString();

            Usuario user = new UsuarioDAO().getUsuario(email);

            if (!user.getNivel_usuario().equals("1")) {
                response.sendRedirect("paginaNaoEncontrada.jsp");
            }

        %>   

        <style>
            exporta {
                color: #605B5B;
                background-color: white;
                padding: 50px;
                margin: 10px;
            }

        </style>
    </head>
    <body>
        <!-- Navigation -->
        <div id="header"></div>  

        <form>
            <div class="container py-5 my-5">
                <div class="row text-center pb-4">
                    <div class="col-md-12">
                        <h2>Vendas na plataforma</h2>
                    </div>
                </div>   
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Data inicial</label>
                                            <input type="date" class="form-control  border border-dark" id="dataInicial" name="dataInicial">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Data Final</label>
                                            <input type="date" class="form-control  border border-dark" id="dataFinal" name="dataFinal">
                                        </div>
                                    </div>

                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label>Valor mínimo</label>
                                            <input type="number" class="form-control  border border-dark" id="valorMinimo" name="valorMinimo" min="0" value="0" placeholder="R$">
                                        </div>
                                    </div>

                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label>Valor Máximo</label>
                                            <input type="number" class="form-control  border border-dark" id="valorMaximo" name="valorMaximo" min="0" value="0" placeholder="R$">
                                        </div>
                                    </div>

                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label>Código do pedido</label>
                                            <input type="text" class="form-control  border border-dark" id="idPedido" name="idPedido" min="0" value="0" placeholder="ID do Pedido">
                                        </div>
                                    </div>

                                    <div class="col-lg-12 text-center">

                                        <button type="button" id="btnBuscar" name="btnBuscar" class="btn btn-primary">Buscar</button>
                                        <button type="reset" class="btn btn-primary">Limpar filtros</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>


        <div class="container py-5 my-5">
            <div class="row">
                <div class="col-md-12">
                    <div id="exporta" name="exporta">

                        <div id="tituloRelatorio" class="col-lg-12 text-center">
                            <h2>Relatorio de Vendas</h2>
                        </div>

                        <table class="table table-striped table table-hover sortable" id="tabela"></table>

                    </div>
                    <div id="btnExport" class="col-lg-12 text-center"></div>
                </div>
            </div>
        </div>

    </tbody>
    <!-- Footer -->
    <div id="footer"></div>

    <!-- Container Selection1 -->
    <div id="dropDownSelect1"></div>
    <!-- Bootstrap core JavaScript -->
    <script src="res/vendor/jquery/jquery.min.js"></script>
    <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.8/jquery.mask.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>



    <script type="text/javascript">
            var btnBuscar = document.getElementById("btnBuscar");
            btnBuscar.addEventListener("click", function () {
                $.ajax({
                    type: 'POST',
                    url: "RelatorioVendasServlet",
                    data: {
                        dataInicial: $("#dataInicial").val(),
                        dataFinal: $("#dataFinal").val(),
                        valorMinimo: $("#valorMinimo").val(),
                        valorMaximo: $("#valorMaximo").val(),
                        idPedido: $("#idPedido").val()
                    },
                    dataType: "json",
                    success: function (result) {
                        var html = "";
                        var btnExport = "";
                        html += '<tr>';
                        html += '<th scope="col">Código da venda</th>';
                        html += '<th scope="col">Código do pedido</th>';
                        html += '<th scope="col">Data do pedido</th>';
                        html += '<th scope="col">Valor</th>';
                        html += '</tr>';
                        for (var i = 0; i < result.length; i++) {
                            html += " <tr> ";
                            html += " <td> " + result[i].idVenda + "</td>";
                            html += " <td> " + result[i].idPedido + "</td>";
                            html += " <td> " + result[i].dataVenda + "</td>";
                            html += " <td> " + result[i].valor + "</td>";
                            html += " </tr> ";
                        }

                        $("#tabela").html(html);
                        btnExport += '<button type="button" id="btnExportar" name="btnExportar" class="btn btn-primary">Exportar para PDF</button>';
                        $("#btnExport").html(btnExport);
                    }
                });
            });


            function savePDF(codigoHTML) {
                var doc = new jsPDF('portrait', 'pt', 'a4'),
                        data = new Date();
                margins = {
                    top: 40,
                    bottom: 60,
                    left: 40,
                    width: 1100
                };
                doc.fromHTML(codigoHTML,
                        margins.left, // x coord
                        margins.top, {pagesplit: true},
                        function (dispose) {
                            doc.save("Relatorio - " + data.getDate() + "/" + data.getMonth() + "/" + data.getFullYear() + ".pdf");
                        });
            }


            $('#btnExport').click(function () {
                savePDF(document.querySelector('#exporta'));

                /**
                 var doc = new jsPDF('landscape');
                 
                 doc.addHTML($('#exporta'), function () {
                 doc.save("Relatorio.pdf");   
                 });**/

                /**
                 doc.fromHTML($('#exporta').html(), 15, 15, {
                 'width': 170,
                 'elementHandlers': specialElementHandlers
                 });
                 doc.save('Relatorio.pdf');
                 **/

            });

    </script>
</body>
</html>


