/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Funcionario;
import model.Mensagem;
import modelDAO.FuncionarioDAO;

/**
 *
 * @author Cristiano
 */
@WebServlet(name = "CadastroFuncionarioServlet", urlPatterns = {"/CadastroFuncionarioServlet"})
public class CadastroFuncionarioServlet extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

            // Data de nascimento
            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.DATE, 0);
            SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
            String hoje = format1.format(cal.getTime());
            
            // Novo Objeto de funcionario
            Funcionario user = new Funcionario();
            
            user.setTipoPessoa(1);
            //user.setTipoPessoa(Integer.parseInt(request.getParameter("tipoPessoa")));
            user.setEmail(request.getParameter("email"));
            user.setSenha(request.getParameter("senha"));
            user.setNome(request.getParameter("nome"));
            user.setCpf(request.getParameter("cpf"));
            user.setSexo(request.getParameter("sexo"));
            user.setDataNascimento(Funcionario.toSqlDate(request.getParameter("dataNascimento")));
            user.setTelefone(request.getParameter("telefone"));
            user.setCep(request.getParameter("cep"));
            user.setNumero(request.getParameter("numero"));
            user.setLogradouro(request.getParameter("logradouro"));
            user.setComplemento(request.getParameter("complemento"));
            user.setBairro(request.getParameter("bairro"));
            user.setEstado(request.getParameter("estado"));
            user.setCidade(request.getParameter("cidade"));
            user.setNivel_usuario(request.getParameter("Nivel_Usuario"));
            user.setAtivo("1");
            user.setBanco(request.getParameter("banco"));
            user.setAgencia(Integer.parseInt(request.getParameter("agencia")));
            user.setConta(Integer.parseInt(request.getParameter("conta")));
            user.setDigito(Integer.parseInt(request.getParameter("digito")));
            
            String resp = FuncionarioDAO.setFuncionario(user);
            
            if (Mensagem.OK.equals(resp)) {
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
