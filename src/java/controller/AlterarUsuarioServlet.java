/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Mensagem;
import model.Usuario;
import modelDAO.UsuarioDAO;

/**
 *
 * @author Caique
 * 
 * Corrigido por Cristiano
 */
@WebServlet(name = "AlterarUsuarioServlet", urlPatterns = {"/AlterarUsuarioServlet"})
public class AlterarUsuarioServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
         //String _email = request.getSession().getAttribute("email").toString();
         String _email = "teste9@teste.com.br";
         Usuario user = new UsuarioDAO().getUsuario(_email);
         
        /*
        if (request.getParameter("cpf").isEmpty()) {
            user.setCpf(request.getParameter("cnpj"));
        } else if (request.getParameter("cnpj").isEmpty()) {
            user.setCpf(request.getParameter("cpf"));
        } else {
            user.setCpf("");
        }
        */
        user.setCpf_cnpj(request.getParameter("cpf"));
        user.setTipoPessoa(user.getTipoPessoa());
        user.setDataNascimento(Usuario.toSqlDate(request.getParameter("dataNascimento")));
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
        user.setSenha(user.getSenha());
        user.setNivel_usuario(user.getNivel_usuario());
        user.setAtivo(user.getAtivo());
        user.setBanco(request.getParameter("banco"));
        user.setAgencia(Integer.parseInt(request.getParameter("agencia")));
        user.setConta(Integer.parseInt(request.getParameter("conta")));
        user.setDigito(Integer.parseInt(request.getParameter("digito")));
         
         String resp = UsuarioDAO.alterarUsuario(user);
         
            if (Mensagem.OK.equals(resp)) {
                // Exibe a mensagem na tela, abaixo do botão
                response.sendRedirect("alterarCadastro.jsp?msg=" + Mensagem.USUARIO_ALTERADO);
            } else {
                response.sendRedirect("alterarCadastro.jsp?msg=" + Mensagem.ERRO_CONEXAO);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
