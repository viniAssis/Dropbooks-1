
<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelDAO.ProdutoDAO"%>
<%@page import="model.Produto"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Catalogo do Livro</title>

        <!-- Principal CSS do Bootstrap -->
        <link href="res/css/bootstrap.min.css" rel="stylesheet">
        <link href="res/js/dist/dropdown.js" rel="stylesheet">
        
        
        <!-- Custom styles for this template -->
        <link href="res/css/modern-business.css" rel="stylesheet">
        
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="res/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/util.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/main.css"/>
        
        <style>

            #caixa2{
                margin-top: 5%;
                margin-left: 20%;
                margin-bottom: 3%;
                clear: both;

            }
            #botao1{
                width: 15%;
                border: #00008B;
                color: white;
                margin: 0;
                margin-left: 2%;

            }
           
            .titulo{
                padding-top: 3%;
                text-align: center;
                margin-bottom: 7%;
                color: black;
                font-size: 40px;


            }
            table{width: 100%;}

            #conteudo{
                width: 200px;
                padding: 15px;
                margin: 50px auto;
                display: table;

            }

            .modal-header{
                text-align: center;
                background-color: #1E90FF;

            }

            .toggle {
                margin-bottom: 40px;
                padding: 30px;

            }

            .toggle > input { display: none; }

            .toggle > label {
                position: relative;
                display: block;
                height: 20px;
                width: 44px;
                background: #898989;
                border-radius: 100px;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .toggle > label:after {
                position: absolute;
                left: -2px;
                top: -3px;
                display: block;
                width: 26px;
                height: 26px;
                border-radius: 100px;
                background: #fff;
                box-shadow: 0px 3px 3px rgba(0,0,0,0.05);
                content: '';
                transition: all 0.3s ease;
            }

            .toggle > label:active:after { transform: scale(1.15, 0.85); }

            .toggle > input:checked ~ label { background: #6fbeb5; }

            .toggle > input:checked ~ label:after {
                left: 20px;
                background: #179588;
            }

            .form-group{
                margin-left: 5%;
                display: block;
                width: 250px;
            }



            .sliderCheck{ margin-top: 10px; }

            .switch {
                position: relative;
                display: inline-block;
                width: 60px;
                height: 34px;
            }

            .switch input {display:none;}

            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #ccc;
                transition: .4s;
            }

            .slider:before {
                position: absolute;
                content: "";
                height: 26px;
                width: 26px;
                left: 4px;
                bottom: 4px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

            input:checked + .slider { background-color: #2196F3; }

            input:focus + .slider { box-shadow: 0 0 1px #2196F3; }

            input:checked + .slider:before { transform: translateX(26px);}

            .slider.round { border-radius: 34px; }

            .slider.round:before { border-radius: 50%; }

            .container_1{

                margin-left: 20%;
            }

            .caixa{
                border: 1px solid black;
                background: #FFFFF0;
                height:75%;
                width: 20%;
                margin-left: 4%;
                overflow: auto;
                text-align: center;
                display: table;
                float: left;
                margin-top: 2%;
                box-shadow: 0 2px 4px 2px #D3D3D3;
                margin-bottom: 10%;
            }

            img{
                margin-top: 5%;
                width: 200px;
                height: 230px;
            }
            .dropdown-toggle1{
                background-color: #1E90FF;
                color: white;   
                margin-left: 10px;

            }
            #dropdown1 , #dropdown2  {

                margin-top: 5%;	
                margin-bottom: 5%;	
                width: 25%;
                float: left;
                margin-left: 15%;
            }


            .input-group{
                margin-top: 5%;

            }
            .input{
                width: 100%;
                border-radius: 5px;
                box-shadow: 0 1px 2px 1px #D3D3D3;
                margin: 3px;


            }
            .formLivro{
                text-align:left;
                padding: 3px;
                font-size: 20px;
                margin-left: 10px;
                color: black;

            }

            #idEditar, #idExcluir{
                margin-top: 2%;
                margin-left: 5%;
                margin-bottom: 2%;
                width: 30%;
                border: #C1839F;
                color: white;
            }



            nav >a{
                margin-top: 3%;
                font-size: 22px;
                color: white;
            }


            #menu a:hover{
                color: black;
            }

            a:hover{
                color: black;
                text-decoration: none;
            }


            .desativar{
                color: black;
                margin-left: 120%;
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

            /** #idConfirmar, #idFechar, #edcatalogo{
                 background: #C1839F;
                 border: #C1839F;
             }**/

        </style> 
        
                
        <script type="text/javascript">
            function redireciona(param) {
                location.href = param;
            }
        </script>
        <%
            String email = request.getSession().getAttribute("email").toString();
	
            //int id = user.getId(); 
            Usuario user = new UsuarioDAO().getUsuario(email);
            int id = user.getId(); 
            Produto pro = new ProdutoDAO().getProduto(id);
            
        %>
    </head>
    <body>   
        <!-- Navigation -->
        <nav class="navbar fixed-top navbar-expand-lg navbar-darkfixed-top" id="nav">
			<div class="container">
				<a class="navbar-brand" href="index.jsp">DropBooks</a>
				<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item">
							<a class="nav-link" href="index.jsp">Home</a>
						</li>
                                                <li class="nav-item">
                                                        <a class="nav-link" href="Contato.jsp">Contato</a>
                                                </li>
                                              
                                                <li class="nav-item">
                                                    <li class="nav-item dropdown"> 
                                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%= user.getNomeRazao()%></a>
                                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                                                    <a class="dropdown-item" href="alterarCadastro.jsp">Alterar Dados</a>
                                                    <a class="dropdown-item" href="catalogoLivro.jsp">Meu Catalogo</a>
                                                    <a class="dropdown-item" href="cadastroProduto.jsp">Cadastra Catalogo</a>
                                                    <a class="dropdown-item" href="Senha.jsp">Alterar Senha</a>
                                                    <a class="dropdown-item" name=Sair href=SairServlet>Sair</a>
                                                    </div>
                                                </li>
                			</ul>
				</div>
			</div>
		</nav>
        
        <div class="container-fluid">
 
           <form id="caixa2" action="PesquisarLivrosServlet">
			<div class="form-row align-items-center">
				<div class="col-auto my-1">
					<select class="custom-select mr-sm-2" id="tipoPesquisa" name="opcaoPesquisa">
						<option  value="Titulo">T�tulo</option>
                                                        <option  value="Autor">Autor</option>
                                                        <option  value="Editora">Editora</option>
                                                        <option  value="Genero">Genero</option>
					</select>
				</div>
				<div class="col-auto col-md-6">
					<input class="form-control mr-sm-2 border border-dark" type="search" placeholder="Pesquisar" aria-label="Pesquisar" name="palavraChave">
				</div>
				<button type="submit" class="btn btn-primary" id="botao1" name="botao1">Pesquisa</button>
			</div>
		</form>

        </div>
<%
    
        out.println("<div id= 'container1'>");

            out.println("<h4 class='titulo'>Cat�logo do Livro</h4>");
                 
            out.println("<div id='container' >	");
                out.println("<table>");

            ArrayList<Produto> lista = new ProdutoDAO().getProdutos(user.getId());       
                
            for(int i=0; i<lista.size(); i++) {
                
                String status = null;

                // Retorna o status do produto
                if (lista.get(i).getAtivo()== 1) {
                    status = "checked";
                } else if (lista.get(i).getAtivo()== 0) {
                    status = "";
                } else {

                }

                //out.println("<td><a href='index.jsp?rgm=" + lista.get(i).getId()+ "'>" + lista.get(i).getId()+ "</a></td>");
             
                 //out.println("<tr>");
                

                    out.println("<td class='caixa'>");
                            out.println("<img src='./imagens?id_prod=" + lista.get(i).getId() + "&img=1' width='200' height = '200'  alt=''>");
                            
                            //out.println("<p> ID: <span name='id' id='id'>" + lista.get(i).getId()+ "</span></p>");
                            out.println("<p> Titulo: <span name='titulo' id='texto'>" + lista.get(i).getTitulo()+ "</span></p>");
                            out.println("<p> Autor:  <span name='autor' id='autor'>" + lista.get(i).getAutor()+ "</span></p>");
                            out.println("<p> Valor: R&#36;: <span name='valor' id='valor'>" + lista.get(i).getPreco()+ "</span></p>");

                            // <!-- Bot�o para acionar modal BOTAO EDITAR -->
                            out.println("<button type='button' class='btn btn-primary editar' data-toggle='modal' data-target='#ExemploModalCentralizado' name='editar' id='"+lista.get(i).getId()+"'>");
                                out.println("Editar");
                            out.println("</button>");

                            // <!-- Modal -->
                            out.println("<div class='modal fade' id='ExemploModalCentralizado' tabindex='-1' role='dialog' aria-labelledby='TituloModalCentralizado' aria-hidden='true'>");
                                out.println("<div class='modal-dialog modal-dialog-centered' role='document'>");
                                    out.println("<div class='modal-content'>");
                                        out.println("<div class='modal-header'>");
                                            out.println("<h5 class='modal-title' id='TituloModalCentralizado'>Editar Cat�logo</h5>");
                                            out.println("<button type='button' class='close' data-dismiss='modal' aria-label='Fechar'>");
                                                out.println("<span aria-hidden='true'>&times;</span>");
                                            out.println("</button>");
                                        out.println("</div>");
                                        out.println("<div class='modal-body'>");
                                            out.println("<center>");
                                                out.println("<form method='post' action='AlterarProdutoServlet?id=" + lista.get(i).getId() + "' name='ed_catalogo'>");
                                                    out.println("<table>");
                                                        out.println("<tr>");
                                                            out.println("<td class='formLivro'>Titulo do Livro:</td>");
                                                            //out.println("<p> ID: <span name='id' id='id'>" + lista.get(i).getId() + "</span></p>");
                                                            out.println("<td style='color:black'>");
                                                                out.println("<input type='text' class='input' name='namelivro' id='namelivro' placeholder='' value='" + lista.get(i).getTitulo()+ "'>");
                                                            out.println("</td>");
                                                        out.println("</tr>");
                                                        out.println("<tr>");
                                                            out.println("<td class='formLivro'>Nome do Autor: </td>");
                                                            out.println("<td style='color:black'>");
                                                                out.println("<input type='text' class='input' name='nameAutor' id='nameAutor' placeholder='' value='" + lista.get(i).getAutor()+ "'>");
                                                            out.println("</td>");
                                                        out.println("</tr>");
                                                        out.println("<tr>");
                                                            out.println("<td class='formLivro'>Nome da Editora: </td>");
                                                            out.println("<td style='color:black'>");
                                                                out.println("<input type='text' class='input' name='nameEditora' id='nameEditora' placeholder='' value='" + lista.get(i).getEditora()+ "'>");
                                                            out.println("</td>");
                                                        out.println("</tr>");
                                                        out.println("<tr>");
                                                            out.println("<td class='formLivro'>Ano de Lan�amento: </td>");
                                                            out.println("<td style='color:black'>");
                                                                out.println("<input type='date' class='input' name='anoLancamento' id='anoLancamento' placeholder=''  value='" + lista.get(i).getDataPublicacao()+ "'>");
                                                            out.println("</td>");
                                                        out.println("</tr>");
                                                        out.println("<tr>");
                                                            out.println("<td class='formLivro'>Valor do Livro: </td>");
                                                            out.println("<td style='color:black'>");
                                                                out.println("<input type='text'  class='input' name='valor' id='idValor' placeholder='' value='" + lista.get(i).getPreco()+ "'>");
                                                            out.println("</td>");
                                                        out.println("</tr>");
                                                        out.println("<tr>");
                                                            out.println("<td class='formLivro'>Descri��o: </td>");
                                                            out.println("<td style='color:black'>");
                                                                out.println("<textarea class='form-control input' id='descricao' name='descricaoProduto' value='' placeholder='' rows='3' >" + lista.get(i).getDescricao()+ "</textarea>");
                                                            out.println("</td>");
                                                        out.println("</tr>");

                                                    out.println("</table>");
                                                    out.println("<div class='dropdown' id='dropdown1'>");
                                                        out.println("<div class='dropdown'>");
                                                            out.println("<label class='formLivro'>G�nero</label>");
                                                            out.println("<select class='btn  dropdown-toggle' id='idGenero' name='menuGenero' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' value=''>");
                                                                out.println("<option>" + lista.get(i).getGenero()+ "</option>");
                                                                out.println("<option>Drama</option>");
                                                                out.println("<option>A��o</option>");
                                                                out.println("<option>Aventura</option>");
                                                                out.println("<option>Com�dia</option>");
                                                                out.println("<option>Fantasia</option>");
                                                            out.println("</select>");

                                                        out.println("</div>");
                                                    out.println("</div>");
                                                    out.println("<div class='dropdown' id='dropdown2'>");
                                                        out.println("<div class='dropdown'>");
                                                            out.println("<label class='formLivro'>Idioma</label>");
                                                            out.println("<select class='btn  dropdown-toggle' id='idIdioma' name='menuIdioma' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' value=''>");
                                                                out.println("<option>" + lista.get(i).getIdioma()+ "</option>");
                                                                out.println("<option>Portugu�s</option>");
                                                                out.println("<option>Ingl�s</option>");
                                                            out.println("</select>");

                                                        out.println("</div>");
                                                    out.println("</div>");
                                                    
                                                     out.println("<div class='input-group mb-3'>");
                                                        out.println("<div class='input-group-prepend'>");
                                                            out.println("<span class='input-group-text' id='inputGroupFileAddon01'>Alterar Foto</span>");
                                                        out.println("</div>");
                                                        out.println("<div class='custom-file'>");
                                                            out.println("<input type='file' class='custom-file-input' id='inputFoto' name='inputFoto' aria-describedby='inputGroupFileAddon01'>");
                                                            out.println("<label class='custom-file-label' for='inputGroupFile01'></label>");
                                                        out.println("</div>");
                                                    out.println("</div>");
                                                    out.println("<br>");
                                                    out.println("<button type='submit' class='btn btn-primary' name='editar_catalogo' id='edcatalogo'>Editar Cat�logo</button>");
                                                out.println("</form>");
                                            out.println("</center>");
                                        out.println("</div>");
                                    out.println("</div>");
                                out.println("</div>");
                            out.println("</div>");

                            // <!-- Bot�o para acionar modal BOTAO EXCLUIR -->
                            out.println("<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#modalExemplo' name='excluir' id='idExcluir'>");
                                out.println("Excluir");
                            out.println("</button>");

                            // <!-- Modal -->
                            out.println("<div class='modal fade' id='modalExemplo' tabindex='-1' role='dialog' aria-labelledby='exampleModalLabel' aria-hidden='true'>");
                                out.println("<div class='modal-dialog' role='document'>");
                                    out.println("<div class='modal-content'>");
                                        out.println("<div class='modal-header'>");
                                            out.println("<h5 class='modal-title' id='exampleModalLabel'>Aten��o !!!</h5>");
                                            out.println("<button type='button' class='close' data-dismiss='modal' aria-label='Fechar'>");
                                                out.println("<span aria-hidden='true'>&times;</span>");
                                            out.println("</button>");
                                        out.println("</div>");
                                        out.println("<div class='modal-body'>");
                                            out.println("Voc� tem certeza que quer excluir esse livro do seu cat�logo? ");
                                        out.println("</div>");
                                        out.println("<div class='modal-footer'>");
                                        out.println("<form method='post' action='ExcluirProdutoServlet?id=" + lista.get(i).getId() + "' name='ex_catalogo'>");
                                            out.println("<button type='submit' class='btn btn-primary' name='confirmar' id='idConfirmar'>Sim</button>");
                                            out.println("</form>");
                                            out.println("<button type='button' class='btn btn-secondary' data-dismiss='modal' name='fechar' id='idFechar'>Fechar</button>  ");
                                        out.println("</div>");
                                    out.println("</div>");
                                out.println("</div>");
                            out.println("</div>");

                            out.println("<div class='sliderCheck'>");
                                out.println("<label class='switch'>");
                                %>
                                    <input type="checkbox" name="statusCheckbox1" <%= status %> onClick="redireciona('StatusProdutoServlet?id='<%= lista.get(i).getId() %>'');">
                                    <%

                                            out.println("<span class='slider round'></span>");
                                            out.println("</label>");
                                            out.println("</div>");
                                            out.println("</td>");

                                            // out.println("</tr>");
                                            //Fechando p�gina dinamica
                                        }
                                    %>
                </table>

            </div>
            
             <!-- Footer -->
        <footer class="bg6 p-t-45 p-b-43 p-l-45 p-r-45" id="footer">
            <div class="flex-w p-b-90">
                <div class="w-size6 p-t-30 p-l-15 p-r-15 respon3">
                    <h4	 id="corAmarelo">
                        Problemas
                    </h4>
                    <div>
                        <p class="s-text7 w-size27" id="corBranca">
                            Caso Tenha Qualquer Problema na Compra ou Venda do Seu livro Entre em Contato Para que seja Resolvido.
                            Agradecemos sua Visita. Volte Sempre !
                        </p>
                    </div>
                </div>
                <div class="w-size7 p-t-30 p-l-15 p-r-15 respon4">
                    <h4  class="s-text12 p-b-30" id="corAmarelo">
                        Categorias
                    </h4>
                    <ul>
                        <li class="p-b-9">
                            <a href="#" id="corBranca">
                                Fic��o
                            </a>
                        </li>
                        <li class="p-b-9">
                            <a href="#" id="corBranca">
                                Terror
                            </a>
                        </li>
                        <li class="p-b-9">
                            <a href="#" id="corBranca">
                                Romance
                            </a>
                        </li>
                        <li class="p-b-9">
                            <a href="#" id="corBranca">
                                Academicos
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="w-size7 p-t-30 p-l-15 p-r-15 respon4">
                    <h4 class="s-text12 p-b-30"  id="corAmarelo">Livros</h4>
                    <ul>
                        <li class="p-b-9"><a href="#" id="corBranca">Busca</a></li>
                        <li class="p-b-9"><a href="#" id="corBranca">Sobre N�s</a></li>
                        <li class="p-b-9"><a href="#" id="corBranca">Email</a></li>
                        <li class="p-b-9"><a href="#" id="corBranca">Local</a></li>
                    </ul>
                </div>
                <div class="w-size7 p-t-30 p-l-15 p-r-15 respon4">
                    <h4 class="s-text12 p-b-30"  id="corAmarelo">Ajuda</h4>
                    <ul>
                        <li class="p-b-9">
                            <a href="#" class="s-text7" id="corBranca">Dicas</a>
                        </li>
                        <li class="p-b-9">
                            <a href="#" class="s-text7" id="corBranca">Como Vender</a>
                        </li>
                        <li class="p-b-9">
                            <a href="#" class="s-text7" id="corBranca">Como Comprar</a>
                        </li>
                        <li class="p-b-9">
                            <a href="#" class="s-text7" id="corBranca">FAQs</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="t-center p-l-15 p-r-15">
                <a href="#"><img class="h-size2" src="res/images/icons/paypal.png" alt="IMG-PAYPAL"></a>
                <a href="#"><img class="h-size2" src="res/images/icons/visa.png" alt="IMG-VISA"></a>
                <a href="#"><img class="h-size2" src="res/images/icons/mastercard.png" alt="IMG-MASTERCARD"></a>
                <a href="#"><img class="h-size2" src="res/images/icons/express.png" alt="IMG-EXPRESS"></a>
                <a href="#"><img class="h-size2" src="res/images/icons/discover.png" alt="IMG-DISCOVER"></a>
                <div class="t-center s-text8 p-t-20">
                    Copyright � 2018 Todos Direitos Reservados <i class="fa fa-heart-o" aria-hidden="true"></i> by DropBooks
                </div>
            </div>
        </footer>

        <!-- Back to top -->
        <div class="btn-back-to-top bg0-hov" id="myBtn">
            <span class="symbol-btn-back-to-top">
                <i class="fa fa-angle-double-up" aria-hidden="true"></i>
            </span>
        </div>

                                    




            <!-- Principal JavaScript do Bootstrap
             ================================================== -->
            <!-- Foi colocado no final para a p�gina carregar mais r�pido -->
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://unpkg.com/popper.js"></script>
            <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
            <script src="res/js/bootstrap.min.js"></script>
            <!-- S� faz o nossos placeholders de imagens funcionarem. N�o precisar copiar a pr�xima linha! -->
            <script src="res/js/bootstrap.bundle.min.js"></script>
            <script src="res/js/catalogoLivro.js"></script>

        </div>
        

        <!-- Bootstrap core JavaScript -->
    <script src="res/vendor/jquery/jquery.min.js"></script>
    <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>