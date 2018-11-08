
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
        <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script>
           $(function(){
              $("#header").load("MenuNavBar.jsp");
              $("#footer").load("Footer.jsp");
           });
        </script>
        <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->
        
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
        <div id="header"></div>
        
        <div class="container-fluid">
 
           <form id="caixa2" action="PesquisarLivrosServlet">
			<div class="form-row align-items-center">
				<div class="col-auto my-1">
					<select class="custom-select mr-sm-2" id="tipoPesquisa" name="opcaoPesquisa">
						<option  value="Titulo">Título</option>
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

            out.println("<h4 class='titulo'>Catálogo do Livro</h4>");
                 
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

                            // <!-- Botão para acionar modal BOTAO EDITAR -->
                            out.println("<button type='button' class='btn btn-primary editar' data-toggle='modal' data-target='#ExemploModalCentralizado' name='editar' onclick=' location.href= &#39 editarProduto.jsp?id="+ lista.get(i).getId() +" &#39'>");
                                out.println("Editar");
                            out.println("</button>");

                            // <!-- Botão para acionar modal BOTAO EXCLUIR -->
                            out.println("<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#modalExemplo' name='excluir' id='idExcluir'>");
                                out.println("Excluir");
                            out.println("</button>");

                            // <!-- Modal -->
                            out.println("<div class='modal fade' id='modalExemplo' tabindex='-1' role='dialog' aria-labelledby='exampleModalLabel' aria-hidden='true'>");
                                out.println("<div class='modal-dialog' role='document'>");
                                    out.println("<div class='modal-content'>");
                                        out.println("<div class='modal-header'>");
                                            out.println("<h5 class='modal-title' id='exampleModalLabel'>Atenção !!!</h5>");
                                            out.println("<button type='button' class='close' data-dismiss='modal' aria-label='Fechar'>");
                                                out.println("<span aria-hidden='true'>&times;</span>");
                                            out.println("</button>");
                                        out.println("</div>");
                                        out.println("<div class='modal-body'>");
                                            out.println("Você tem certeza que quer excluir esse livro do seu catálogo? ");
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
                                            //Fechando página dinamica
                                        }
                                    %>
                </table>

            </div>
            
        <!-- Footer -->
        <div id="footer"></div>
             
        <!-- Back to top -->
        <div class="btn-back-to-top bg0-hov" id="myBtn">
            <span class="symbol-btn-back-to-top">
                <i class="fa fa-angle-double-up" aria-hidden="true"></i>
            </span>
        </div>

                                    




            <!-- Principal JavaScript do Bootstrap
             ================================================== -->
            <!-- Foi colocado no final para a página carregar mais rápido -->
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://unpkg.com/popper.js"></script>
            <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
            <script src="res/js/bootstrap.min.js"></script>
            <!-- Só faz o nossos placeholders de imagens funcionarem. Não precisar copiar a próxima linha! -->
            <script src="res/js/bootstrap.bundle.min.js"></script>
            <script src="res/js/catalogoLivro.js"></script>

        </div>
        

        <!-- Bootstrap core JavaScript -->
    <script src="res/vendor/jquery/jquery.min.js"></script>
    <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>