package controller;

import model.Email;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
/**
 * @author Cristiano
 */

@WebServlet("/EnviaEmailServlet")
public class EnviaEmailServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
 
public EnviaEmailServlet() {
super();
 
}
 
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
}
 
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

/*
* Recupera os dados da página html
*/
String nome = request.getParameter("nome");
String email = request.getParameter("email");
String assunto = request.getParameter("assunto");
String mensagem = request.getParameter("mensagem");
 

//Chama o método que envia email
Email.enviaEmail(nome, email, assunto, mensagem);

    // Redireciona para outra página
    response.sendRedirect("./home.jsp");
}
 
}