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
import model.Usuario;
import modelDAO.UsuarioDAO;

/**
 *
 * @author Caique
 */
@WebServlet(name = "AlterarUsuarioServlet", urlPatterns = {"/AlterarUsuarioServlet"})
public class AlterarUsuarioServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
         String _email = request.getSession().getAttribute("email").toString();
         
         Usuario user = new UsuarioDAO().getUsuario(_email);
         
         user.setNomeRazao(request.getParameter("hNome")); 
         user.setEmail(request.getParameter("hEmail"));
         user.setSexo(request.getParameter("sexoPessoa"));
         user.setEstado(request.getParameter("hEstado"));
         user.setTelefone(request.getParameter("hTelefone")); 
         user.setNumero(request.getParameter("hNumero")); 
         user.setCidade(request.getParameter("hCidade"));
         user.setComplemento(request.getParameter("hComplemento"));
         user.setBairro(request.getParameter("hBairro")); 
         user.setCep(request.getParameter("hCEP"));
         user.setDataNascimento(Usuario.toSqlDate(request.getParameter("hData")));
         
         UsuarioDAO.alterarUsuario(user);
         
         response.sendRedirect("index.jsp");
         

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
