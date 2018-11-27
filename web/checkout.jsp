<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Dropbooks - Checkout</title>

        <link href="res/css/bootstrap.min.css" rel="stylesheet">
        <link href="res/css/modern-business.css" rel="stylesheet">           
        <link rel="stylesheet" type="text/css" href="res/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/util.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/main.css"/>
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script>
            $(function () {
                $("#header").load("MenuNavBar.jsp");
                $("#footer").load("Footer.jsp");
            });
        </script>
        <style>
            #nav{
                background: #090446 !important;
            }
            .navbar .navbar-nav li a{
                color: #FEB95F !important;
                font-weight: 400;
            }
            .navbar .navbar-nav li a:hover{
                color: #FEB95F !important;
                font-weight: 400;
                transform: scale(1);
            }
            .navbar-brand{
                color: #FEB95F !important;
                font-size: 24px;
                font-weight: 700;
            }
            .caixa1{
                padding: 20px 30px;
                box-sizing: border-box;
                margin-left: 20%;
                width: 60%;
                margin-top: 20px;
                margin-bottom: 10px;  
            }
            .action-button {
                width: 30px;
                background: #090446;
                font-weight: bold;
                color: #FEB95F;
                border: 0 none;
                border-radius: 25px;
                cursor: pointer;
                padding: 10px 5px;
                margin: 10px 5px;
                box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.15);
            }
            .list-group-item{
                background-color: #6495ED;
                box-shadow: 0px 3px 7px rgba(0, 0, 0, 0.4);
                color: black;
                text-align: left;
                font-size: 18px;

            }
            #finalizarPedido{
                width: 200px;
                border-radius: 25px;
            }
            #footer{
                background: #090446;
            }
            
            .label{
                 color: #090446;
            }
        </style>

        <%
            String email = "";
            Usuario user = null;
            boolean logado = false;

            if (request.getSession().getAttribute("email") != null) {
                email = request.getSession().getAttribute("email").toString();
                user = new UsuarioDAO().getUsuario(email);
                logado = true;
            } else {
                response.sendRedirect("login.jsp");
            }
        %>
    </head>
    <body class="bg-light" onload="loadShoppingCart(<%=user.getCep()%>)">
   <div id="header"></div>
     
        <div class="caixa1">
            <div id="formPgto">
                <h4 class="mb-3"></h4>
                <div class="row">
                    <div class="col-lg-6 mb-6">
                        <strong class="label">Resumo do pedido</strong>
                        <div id="order">
                            
                        </div>
                    </div>
                    <br />
                    <div class="col-lg-4 mb-6">
                        <strong class="label">Endereço de entrega:</strong>
                        <br />
                        <%
                            if (logado) {
                                out.print(user.getLogradouro() + ", " + user.getNumero());

                                if (user.getComplemento() != "") {
                                    out.print(", " + user.getComplemento() + "<br />");
                                } else {
                                    out.print("<br />");
                                }

                                out.print(user.getBairro() + "<br />");
                                out.print(user.getCidade() + " - " + user.getEstado() + "<br />");
                                out.print("CEP: " + user.getCep() + "<br />");
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>

        <div class="caixa1">
            <div id="formPgto">
                <h4 class="mb-3 label">Pagamento</h4>
                <form>
                    <div class="d-block my-3">
                        <div class="custom-control custom-radio">
                            <input id="credito" name="formaPagamento" value="Crédito" type="radio" class="custom-control-input" checked required>
                            <label class="custom-control-label" for="credito">Cartão de crédito</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input id="debito" name="formaPagamento" value="Débito" type="radio" class="custom-control-input" required>
                            <label class="custom-control-label" for="debito">Cartão de débito</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input id="paypal" name="formaPagamento" value= "Paypal" type="radio" class="custom-control-input" required>
                            <label class="custom-control-label" for="paypal">PayPal</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="cc-nome">Nome Completo</label>
                            <input type="text" class="form-control  border border-dark" id="cc-nome" placeholder="" required>
                            <small class="text-muted">Nome completo, como mostrado no cartão.</small>
                            <div class="invalid-feedback">
                                O nome que está no cartão é obrigatório.
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="cc-numero">Número do cartão de crédito</label>
                            <input type="text" class="form-control  border border-dark" id="cc-numero"  name="cc-numero" placeholder="" required>
                            <div class="invalid-feedback">
                                O número do cartão de crédito é obrigatório.
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mb-3">
                            <label for="cc-expiracao">Data de expiração</label>
                            <input type="text" class="form-control  border border-dark" id="cc-expiracao" name="cc-expiracao" placeholder="" required>
                            <div class="invalid-feedback">
                                Data de expiração é obrigatória.
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label for="cc-cvv">CVV</label>
                            <input type="text" class="form-control  border border-dark" id="cc-cvv"  name="cc-cvv" placeholder="" required>
                            <div class="invalid-feedback">
                                Código de segurança é obrigatório.
                            </div>
                        </div>
                    </div>
                    <hr class="mb-4">
                    <div class="input-group">
                        <div class="input-group-append">
                            <button type="button" name="finalizarPedido" id="finalizarPedido" class="btn action-button btn-block">Finalizar Compra</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>



         <div id="footer"></div>

        <!-- Container Selection1 -->
        <div id="dropDownSelect1"></div>
        <!-- Bootstrap core JavaScript -->

        <!-- Principal JavaScript do Bootstrap
        ================================================== -->
        <!-- Foi colocado no final para a página carregar mais rápido -->
        <!-- Bootstrap core JavaScript -->
        <script src="res/vendor/jquery/jquery.min.js"></script>
        <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="res/js/checkout.js"></script>
    </body>
</html>
