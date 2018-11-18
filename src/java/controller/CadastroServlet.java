/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Mensagem;
import model.Usuario;
import modelDAO.CadastroDAO;

/**
 *
 * @author Cristiano
 */
@WebServlet(name = "CadastroServlet", urlPatterns = {"/CadastroServlet"})
public class CadastroServlet extends HttpServlet {

    public CadastroServlet() {

    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");

        Usuario user = new Usuario();

        if (request.getParameter("cpf").isEmpty()) {
            user.setCpf_cnpj(request.getParameter("cnpj"));
        } else if (request.getParameter("cnpj").isEmpty()) {
            user.setCpf_cnpj(request.getParameter("cpf"));
        } else {
            user.setCpf_cnpj("");
        }

        user.setTipoPessoa(Integer.parseInt(request.getParameter("tipoPessoa")));
        user.setDataNascimento(Usuario.toSqlDate(request.getParameter("data")));
        user.setSexo(request.getParameter("sexo"));
        user.setEmail(request.getParameter("email"));
        user.setTelefone(request.getParameter("telefone"));
        user.setNomeRazao(request.getParameter("nomeRazao"));
        user.setCep(request.getParameter("cep"));
        user.setLogradouro(request.getParameter("logradouro"));
        user.setNumero(request.getParameter("numero"));
        user.setComplemento(request.getParameter("complemento"));
        user.setEstado(request.getParameter("estado"));
        user.setCidade(request.getParameter("cidade"));
        user.setBairro(request.getParameter("bairro"));
        user.setSenha(request.getParameter("senha"));
        user.setNivel_usuario("3");
        user.setAtivo("1");
        user.setBanco(request.getParameter("banco"));
        user.setAgencia(Integer.parseInt(request.getParameter("agencia")));
        user.setConta(Integer.parseInt(request.getParameter("conta")));
        user.setDigito(Integer.parseInt(request.getParameter("digito")));

        Usuario usuario = CadastroDAO.cadastrar(user);

        if (usuario != null) {
            // Exibe a mensagem na tela, abaixo do botão
            response.sendRedirect("login.jsp?msg=" + Mensagem.USUARIO_CADATRADO);
        } else {
            response.sendRedirect("login.jsp?msg=" + Mensagem.ERRO_CONEXAO);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(CadastroServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(CadastroServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
