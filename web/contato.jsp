<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    
         <title>Contato</title>
        <script src="res/jquery-3.3.1.js"></script>
        <link href="res/css/bootstrap.min.css" rel="stylesheet">
        <link href="res/css/modern-business.css" rel="stylesheet">     
        <script src="res/js/contato.js"></script>
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script>
            $(function () {
                $("#header").load("MenuNavBar.jsp");
                $("#footer").load("Footer.jsp");
            });
        </script>
        <style>
            #container{
                margin-top: 2%;
                width: 50%;
                margin-left: 30%;    
                margin-bottom: 7%;
            }
            #caixa2{
                margin-top: 5%;
                margin-left: 25%;
                margin-bottom: 3%;
                clear: both;
            }
            .titulo{
                color: #090446;
                padding: 3%;	
                margin-left: 15%;
            }
            #botao2{
                margin-top: 3%;
                margin-left: 5%;
                margin-bottom: 3%;
                width: 60%;
            }
            #botao2, #botao1{
                background: #090446;
                color:#FEB95F;
            } 
        </style>
        <%
            String msg = "";
            if (msg == null) {
                msg = "teste";
            }
        %>
    </head>
    <body>
        <div id="header"></div>

        <form id="caixa2" method='post' action="PesquisarLivrosServlet">
            <div class="form-row align-items-center">
                <div class="col-auto my-1">
                    <select class="custom-select mr-sm-2 border border-dark" id="tipoPesquisa" name="opcaoPesquisa">
                        <option  value="Titulo">Título</option>
                        <option  value="Autor">Autor</option>
                        <option  value="Editora">Editora</option>
                        <option  value="Genero">Genêro</option>
                    </select>
                </div>
                <div class="col-auto col-md-6">
                    <input class="form-control mr-sm-2 border border-dark" type="search" placeholder="Pesquisar" aria-label="Pesquisar" name="palavraChave">
                </div>
                <button type="submit" class="btn btn-primary border border-dark" id="botao1" name="botao1">Pesquisa</button>
            </div>
        </form>

        <!-- Conteúdo início -->
        <div  class="container" id="container">
            <h1 class="titulo">Contate-nos</h1>

            <form id="form1" method="post" action="EnviaEmailServlet">

                <!-- Nome -->
                <div class="form-row">
                    <div class="form-group col-md-10 mb-8">
                        <label id="texto">Nome <span class="alerta"></span>*</label>
                        <input type="text" class="form-control col-md-10  border border-dark" id="nome" name="nome"  maxlength="40" value="" required="required">
                    </div>
                </div>

                <!-- Email -->
                <div class="form-row">
                    <div class="form-group col-md-10">
                        <label id="texto">Email <span class="alerta">*</span></label>
                        <input type="email" class="form-control col-md-10  border border-dark" id="email" maxlength="45" name="email" value="" required="required">
                    </div>
                </div>

                <!-- Assunto -->
                <div class="form-row">	
                    <div class="form-group col-md-10">
                        <label id="texto">Assunto <span class="alerta">*</span></label>
                        <select id="assunto" class="form-control col-md-10  border border-dark" name="assunto" required="required">
                            <option selected>Dúvidas</option>
                            <option>Reclamações</option>
                            <option>Cancelamento</option>
                            <option>Outros Assuntos</option>
                        </select>
                    </div> 
                </div> 

                <!-- Mensagem -->
                <div class="form-group">
                    <label id="texto">Mensagem <span class="alerta">*</span></label>
                    <textarea class="form-control col-md-8  border border-dark" id="mensagem" rows="7" maxlength="2000" name="mensagem" required="required"></textarea>
                    * Campos obrigatórios
                </div>

                <button type="submit" class="btn btn-primary border border-dark" id="botao2">Enviar</button>
            </form>    

            <!-- Mensagem de resposta -->
            <%=request.getParameter("msg")%>


        </div>

        <div id="footer"></div>
        <!-- Bootstrap core JavaScript -->
        <script src="res/vendor/jquery/jquery.min.js"></script>
        <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>