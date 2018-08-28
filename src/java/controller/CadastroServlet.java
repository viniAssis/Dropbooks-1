/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
                    
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CadastroServlet</title>");            
            out.println("</head>");
            out.println("<body>");

            // TODO Remover ID quando o banco ficar autoincremento

            //user.setId(Integer.parseInt(request.getParameter("id")));
            //user.setId(1);
            if(request.getParameter("cpf").isEmpty()){
                user.setCpf_cnpj(request.getParameter("cnpj"));
            } else {
                user.setCpf_cnpj(request.getParameter("cpf"));
            }
                
                       
            user.setTipoPessoa(Integer.parseInt(request.getParameter("tipoPessoa")));
            
            /*
            String dataEmTexto = request.getParameter("dataNascimento");
            
            try {
            Date date = (Date) new SimpleDateFormat("dd/MM/yyyy").parse(dataEmTexto);
            
            user.setDataNascimento(date);
            
            
            } catch (ParseException e) {
            out.println("Erro de conversão da data");
            return; //para a execução do método
            }   

            //user.setDataNascimento((request.getParameter("dataNascimento")));
            */
            
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
            
            Usuario usuario = CadastroDAO.cadastrar(user);
            
            
            /* TESTE
            out.println("<h1>Meu parametro foi " + user.getBairro() + " </h1>");
            out.println("<h1>Meu parametro foi " + user.getCep() + " </h1>");
            out.println("<h1>Meu parametro foi " + user.getCidade() + " </h1>");
            out.println("<h1>Meu parametro foi " + user.getComplemento() + " </h1>");
            out.println("<h1>Meu parametro foi " + user.getCpf_cnpj() + " </h1>");
            out.println("<h1>Meu parametro foi " + user.getEmail() + " </h1>");
            out.println("<h1>Meu parametro foi " + user.getEstado() + " </h1>");
            out.println("<h1>Meu parametro foi " + user.getLogradouro() + " </h1>");
            out.println("<h1>Meu parametro foi " + user.getNomeRazao() + " </h1>");
            out.println("<h1>Meu parametro foi " + user.getNumero() + " </h1>");
            out.println("<h1>Meu parametro foi " + user.getSenha() + " </h1>");
            out.println("<h1>Meu parametro foi " + user.getSexo() + " </h1>");
            out.println("<h1>Meu parametro foi " + user.getTelefone() + " </h1>");
            out.println("<h1>Meu parametro foi " + user.getDataNascimento() + " </h1>");
            out.println("<h1>Meu parametro foi " + user.getId() + " </h1>");
            out.println("<h1>Meu parametro foi " + usuario.getEmail() + " </h1>");
            out.println("<h1>Meu parametro foi " + usuario.getId() + " </h1>");
            out.println("<h1>Meu parametro foi " + usuario.getCpf_cnpj() + " </h1>");
            */
            
            // Redireciona para outra página
            response.sendRedirect("login.jsp");
            
            out.println("</body>");
            out.println("</html>");
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
