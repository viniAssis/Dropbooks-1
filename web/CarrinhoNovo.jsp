<%-- 
    Document   : CarrinhoNovo
    Created on : 14/10/2018, 17:55:04
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <link rel="stylesheet" href="res/css/cadastro.css">
        <script  src="res/js/Cadastro.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.8/jquery.mask.js"></script>

        <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script>
           $(function(){
              $("#header").load("MenuNavBar.jsp");
              $("#footer").load("Footer.jsp");
           });
        </script>
        <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="res/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="res/vendor/animsition/css/animsition.min.css"/>
        <link rel="stylesheet" type="text/css" href="res/vendor/select2/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/util.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/main.css"/>

        <link rel="stylesheet" href="res/css/bootstrap.css">
        <style>
            #resumo{
                margin-top: 30px;
                font-family: arial;
                font-size: 20px;
                padding: 20px;
                color: blue;
               /** background-color: #6495ED;**/


            }
            .list-group-item{
                background-color: #6495ED;
                box-shadow: 0px 3px 7px rgba(0, 0, 0, 0.4);
                color: black;
                text-align: left;
                font-size: 18px;
            }
            .text-muted{
                color: black;
                text-align: center;
                font-size: 18px;
            }

            .action-button {
                width: 150px;
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
            .container{
                border: 1px solid black;
                background: white;
                border: 0 none;
                border-radius: 0px;
                box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
                padding: 20px 30px;
                box-sizing: border-box;
                width: 120%;
                margin-top: 10px;
                margin-bottom: 10px;  

            }
            #formPgto{
                border: 1px solid black;
                background: white;
                border: 0 none;
                border-radius: 0px;
                box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
                padding: 20px 30px;
                box-sizing: border-box;
                width: 100%;
                margin-top: 10px;
                margin-bottom: 10px;  

            }
            .caixa{
                margin-top: 10PX;
                width: 50%;
                float: left;
                padding: 15px;

            }
            img{
                margin-right: 50%;
                box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.5);

            }

            #titulo{
                margin-top: 10px;
                padding: 15px;
                text-align: left;
                font-size: 18px;
                color:#2F4F4F;
                

            }
            #idQtde{
                background-color: lightgrey;
                width: 20%;
                border-radius: 5px;
                box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.2);
                margin-left: 3px;
            }




        </style>
    </head>

    <body class="bg-light">
        <!--inicio do nav-->
        <div id="header"></div>
        

        <!--meu carrinho-->

        <div class="container">

            <div id="resumo" class="row">
                <div class="col-md-4 order-md-2 mb-4">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-muted">Resumo do Pedido</span>
                        <span class="badge badge-secondary badge-pill" id="qtdeProdutos"  name="qtdeProdutos">3</span>
                    </h4>
                    <ul class="list-group mb-3">
                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                            <div>
                                <h6 class="my-0" id="idTitulo"  name="idTitulo">Nome do Livro</h6>
                                <small class="text-muted" id="idAutor"  name="idAutor">Autor:</small> 
                            </div>
                            <span class="text-muted" id="idValor" name="idValor">R$12</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                            <div>
                                <h6 class="my-0" id="idTitulo"  name="idTitulo">Nome do Livro</h6>
                                <small class="text-muted" id="idAutor"  name="idAutor">Autor:</small> 
                            </div>
                            <span class="text-muted" id="idValor" name="idValor">R$8</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                            <div>
                                <h6 class="my-0" id="idTitulo"  name="idTitulo">Nome do Livro</h6>
                                <small class="text-muted" id="idAutor"  name="idAutor">Autor:</small> 
                            </div>
                            <span class="text-muted" id="idValor" name="idValor">R$5</span>
                        </li>

                        <li class="list-group-item d-flex justify-content-between">
                            <span>Valor Total</span>
                            <strong id="valorTotal" name="valorTotal">R$20</strong>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="" >Continuar comprando</a>
                        </li>
                    </ul>
                    <input type="button" name="finalizarPedido" class="action-button  btn-block" value="Finalizar Pedido" onclick="alterarfs()"/>



                </div>
                <div class="col-md-8 order-md-1">
                    <h4 class="mb-3">Meu Carrinho</h4>
                    <div class="caixa">
                        <img src="https://images.livrariasaraiva.com.br/imagemnet/imagem.aspx/?pro_id=2870760&qld=90&l=430&a=-1" width="150" height ="200" alt=""/>
                        <div id="titulo">
                            <label id="idTitulo" name="idTitulo">Tìtulo do Livro:</label>
                            <br/>
                            <label id="idAutor" name="idAutor">Autor:</label>
                            <br/>
                            <label>Quantidade:</label>
                            <input id="idQtde" name="idQtde" type="number" value="1">
                            
                            <br/>
                            <!-- Botão para acionar modal -->

                            <a data-toggle="modal" href="#modalExemplo">Excluir</a>

                            <!-- Modal -->
                            <div class="modal fade" id="modalExemplo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Tem certeza que deseja retirar do carrinho? </h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times</span>
                                            </button>
                                        </div>
                                        
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary action-button" data-dismiss="modal" id="excluirSim" name="excluirSim">Sim</button>
                                            <button type="button" class="btn btn-primary action-button" id="excluirNao" name="excluirNao">Não</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="caixa">
                        <img src="https://images.livrariasaraiva.com.br/imagemnet/imagem.aspx/?pro_id=2870760&qld=90&l=430&a=-1" width="150" height ="200" alt=""/>
                        <div id="titulo">
                            <label id="idTitulo" name="idTitulo">Tìtulo do Livro:</label>
                            <br/>
                            <label id="idAutor" name="idAutor">Autor:</label>
                            <br/>
                            <label>Quantidade:</label>
                            <input id="idQtde" name="idQtde" type="number" value="1">
                            
                            <br/>
                            <!-- Botão para acionar modal -->

                            <a data-toggle="modal" href="#modalExemplo">Excluir</a>

                            <!-- Modal -->
                            <div class="modal fade" id="modalExemplo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Tem certeza que deseja retirar do carrinho? </h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times</span>
                                            </button>
                                        </div>
                                        
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary action-button" data-dismiss="modal" id="excluirSim" name="excluirSim">Sim</button>
                                            <button type="button" class="btn btn-primary action-button" id="excluirNao" name="excluirNao">Não</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="caixa">
                        <img src="https://images.livrariasaraiva.com.br/imagemnet/imagem.aspx/?pro_id=2870760&qld=90&l=430&a=-1" width="150" height ="200" alt=""/>
                        <div id="titulo">
                            <label id="idTitulo" name="idTitulo">Tìtulo do Livro:</label>
                            <br/>
                            <label id="idAutor" name="idAutor">Autor:</label>
                            <br/>
                            <label>Quantidade:</label>
                            <input id="idQtde" name="idQtde" type="number" value="1">
                            
                            <br/>
                            <!-- Botão para acionar modal -->

                            <a data-toggle="modal" href="#modalExemplo">Excluir</a>

                            <!-- Modal -->
                            <div class="modal fade" id="modalExemplo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Tem certeza que deseja retirar do carrinho? </h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary action-button" data-dismiss="modal" id="excluirSim" name="excluirSim">Sim</button>
                                            <button type="button" class="btn btn-primary action-button" id="excluirNao" name="excluirNao">Não</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   

                </div>
            </div>
            <div id="formPgto">
                <h4 class="mb-3">Pagamento</h4>

                <form>
                    <div class="d-block my-3">
                        <div class="custom-control custom-radio">
                            <input id="credito" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                            <label class="custom-control-label" for="credito">Cartão de crédito</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input id="debito" name="paymentMethod" type="radio" class="custom-control-input" required>
                            <label class="custom-control-label" for="debito">Cartão de débito</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
                            <label class="custom-control-label" for="paypal">PayPal</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="cc-nome">Nome no cartão</label>
                            <input type="text" class="form-control" id="cc-nome" placeholder="" required>
                            <small class="text-muted">Nome completo, como mostrado no cartão.</small>
                            <div class="invalid-feedback">
                                O nome que está no cartão é obrigatório.
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="cc-numero">Número do cartão de crédito</label>
                            <input type="text" class="form-control" id="cc-numero" placeholder="" required>
                            <div class="invalid-feedback">
                                O número do cartão de crédito é obrigatório.
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mb-3">
                            <label for="cc-expiracao">Data de expiração</label>
                            <input type="text" class="form-control" id="cc-expiracao" placeholder="" required>
                            <div class="invalid-feedback">
                                Data de expiração é obrigatória.
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label for="cc-cvv">CVV</label>
                            <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
                            <div class="invalid-feedback">
                                Código de segurança é obrigatório.
                            </div>
                        </div>
                    </div> 
                    <hr class="mb-4">
                    <div class="input-group">
                        <input type="text" name="cep" id="cep" class="form-control"   required/>
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-secondary">Pesquisar Frete</button>
                        </div>
                    </div>

                    <input type="button" name="finalizarPedido" class="action-button  btn-block" value="Finalizar" onclick="alterarfs()"/>
                </form>
            </div>
        </div>


        <!-- Footer -->
        <div id="footer"></div>
        
        <!-- Back to top -->
        <div class="btn-back-to-top bg0-hov" id="myBtn">
            <span class="symbol-btn-back-to-top">
                <i class="fa fa-angle-double-up" aria-hidden="true"></i>
            </span>
        </div>

        <!-- Container Selection1 -->
        <div id="dropDownSelect1"></div>




        <!-- Principal JavaScript do Bootstrap
        ================================================== -->
        <!-- Foi colocado no final para a página carregar mais rápido -->
        <script src="res/jquery-3.3.1.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
        <script src="res/js/bootstrap.bundle.min.js"></script>
        <script src="res/js/bootstrap.js"></script>
        <script src="../../assets/js/vendor/holder.min.js"></script>
        <script>
                        // Exemplo de JavaScript para desativar o envio do formulário, se tiver algum campo inválido.
                        (function () {
                            'use strict';

                            window.addEventListener('load', function () {
                                // Selecione todos os campos que nós queremos aplicar estilos Bootstrap de validação customizados.
                                var forms = document.getElementsByClassName('needs-validation');

                                // Faz um loop neles e previne envio
                                var validation = Array.prototype.filter.call(forms, function (form) {
                                    form.addEventListener('submit', function (event) {
                                        if (form.checkValidity() === false) {
                                            event.preventDefault();
                                            event.stopPropagation();
                                        }
                                        form.classList.add('was-validated');
                                    }, false);
                                });
                            }, false);
                        })();
        </script>

    </body>
</html>

