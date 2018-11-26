<%@page import="javax.swing.JOptionPane"%>
<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>

<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <!-- Meta tags Obrigatórias -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap core CSS -->
        <link href="res/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="res/css/modern-business.css" rel="stylesheet">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="res/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/util.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/main.css"/>
        
        <script src="res/jquery-3.3.1.js"></script>

        <script src="res/js/alteraCadastro.js"></script>
                <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script>
            $(function () {
                $("#header").load("MenuNavBar.jsp");
                $("#footer").load("Footer.jsp");
            });
        </script>
        <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->

        <style>
            #form1{
                width: 60%;
                margin: 0 auto;
                margin-bottom: 5%;
                margin-top: 5%;	
            }

            #nome{
                margin-top: 5%;
                text-align: center;
                color: #090446 !important;
                border-bottom: 3px solid #FEB95F;
                width: 40%;
                margin-left: 32%;
            }

            #caixa2{
                margin-top: 5%;
                margin-left: 25%;
                margin-bottom: 3%;
                clear: both;
            }

            #btnAlterar{			
                margin-left: 30%;
                width: 40%;
                margin-top: 30px;
            }

            #texto{
                font-size: 20px;
                color: black;
            }

            #nav{
                background: #090446;
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


            #footer{
                background: #090446;

            }
            #corAmarelo{
                color:#FEB95F ;
            }

            #corBranca{
                color: white;
            }

            #btnAlterar{
                color:#FEB95F ;
                background: #090446;
            }
        </style>

        <%

            //Usuario user = new Usuario();
            String email = request.getSession().getAttribute("email").toString();

            Usuario user = new UsuarioDAO().getUsuario(email);

            String masc = null;
            String fem = null;

            if (user.getSexo().equals("M") || user.getSexo().equals("m")) {
                masc = "checked";
            } else {
                fem = "checked";
            }
        %>
    </head>

    <body>

          <div id="header"></div>

        <h3 id="nome">Olá, <%= user.getNomeRazao()%> </h3>

        <form id="form1" action="AlterarUsuarioServlet">

            <!-- Email -->
            <div class="form-group row">
                <label id="texto" class="col-sm-3 col-form-label ">Email:</label>
                <div class="col-sm-9">
                    <input type="email"readonly class="form-control border border-dark" id="inputEmail3" name="hEmail" value="<%= user.getEmail()%>">
                </div>
            </div>

            <!-- Nome/Razão Social -->
            <div class="form-group row">
                <label class="col-sm-3 col-form-label" id="texto">Nome/Razão Social:</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control  border border-dark" id="inputNome" maxlength="45" name="hNome" value="<%= user.getNomeRazao()%>" required>
                </div>
            </div>

            <!-- Data de Nascimento -->
            <div class="form-group row">
                <label class="col-sm-3 col-form-label" id="texto">Data de Nascimento:</label>
                <div class="col-sm-3">
                    <input type="date" class="form-control  border border-dark" id="inputData" name="hData" value="<%= user.getDataNascimento()%>" required>
                </div>
            </div>

            <!-- Sexo  -->
            <div class="form-group row">	
                <label id="texto" class="col-sm-3 col-form-label">Sexo:</label>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="sexoPessoa" id="sxFem"  value="F" <% out.print(fem); %> required>
                    <label class="form-check-label" id="texto">Feminino</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="sexoPessoa" id="sxMas"  value="F" <% out.print(fem);%> required>
                    <label class="form-check-label" id="texto">Masculino</label>
                </div>
            </div>

            <!-- Telefone  -->
            <div class="form-group row">
                <label id="texto" class="col-sm-3 col-form-label">Telefone:</label>
                <div class="col-4">
                    <input type="text" class="form-control  border border-dark" id="inputTelefone" value="<%= user.getTelefone()%>" name="hTelefone" required>
                </div>
            </div>

            <!-- CEP, Endereço e Numero  -->
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label id="texto">CEP</label>
                    <input type="text" class="form-control  border border-dark" id="inputCEP" name="hCEP" value="<%= user.getCep()%>" required>
                </div>
                <div class="form-group col-md-4">
                    <label id="texto">Endereço</label>
                    <input type="text" class="form-control  border border-dark" id="endereco"  maxlength="50" name="endereco"  value="<%= user.getLogradouro()%>" required>
                </div>
                <div class="form-group col-md-4">
                    <label id="texto">Numero</label>
                    <input type="text" class="form-control  border border-dark" id="inputNumero" maxlength="5" name="hNumero" value="<%= user.getNumero()%>" required>
                </div>
            </div>

            <!-- Cidade, Complemento e Bairro -->
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label id="texto">Cidade</label> 
                    <input type="text" class="form-control  border border-dark" id="inputCity"  maxlength="20" name="hCidade" value="<%= user.getCidade()%>" required>
                </div> 
                <div class="form-group col-md-4">
                    <label id="texto">Complemento</label>
                    <input type="text" class="form-control  border border-dark " id="complemento" maxlength="20" name="hComplemento" value="<%= user.getComplemento()%>" required>
                </div>
                <div class="form-group col-md-4">
                    <label id="texto">Bairro</label> 
                    <input type="text" class="form-control  border border-dark"  id="inputBairro"  maxlength="20" name="hBairro" value="<%= user.getBairro()%>" required> 
                </div>
            </div>

            <!-- Estado  -->
            <div class="form-row">
                <div class="form-group col-md-3">
                    <label id="texto">Estado</label>
                    <input type="text" class="form-control  border border-dark" id="estado" maxlength="20" name="hEstado"  value="<%= user.getEstado()%>" required>
                </div>
            </div>

            <button type="submit" class="btn border-0" id="btnAlterar" >Alterar</button>

        </form>	

        <!-- Footer -->
         <div id="footer"></div>

        <!-- Back to top -->
        <div class="btn-back-to-top bg0-hov" id="myBtn">
            <span class="symbol-btn-back-to-top">
                <i class="fa fa-angle-double-up" aria-hidden="true"></i>
            </span>
        </div>


        <!-- Bootstrap core JavaScript -->
        <script src="res/vendor/jquery/jquery.min.js"></script>
        <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.8/jquery.mask.js"></script>

    </body>
</html>