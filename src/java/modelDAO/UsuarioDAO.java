package modelDAO;

import model.Usuario;
import java.sql.*;

public class UsuarioDAO {

    public static Usuario getUsuario(String email) {
        
        Usuario usuario = new Usuario();
        
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM usuario WHERE email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                usuario.setSexo(rs.getString("sexo"));
                usuario.setDataNascimento(rs.getDate("dataNascimento"));
                usuario.setId(rs.getInt("id"));
                usuario.setTipoPessoa(rs.getInt("tipoPessoa"));
                usuario.setComplemento(rs.getString("complemento"));
                usuario.setCpf_cnpj(rs.getString("cpf_cnpj"));
                usuario.setEstado(rs.getString("estado"));
                usuario.setEmail(rs.getString("email"));
                usuario.setNomeRazao(rs.getString("nomeRazao"));
                usuario.setTelefone(rs.getString("telefone"));
                usuario.setNumero(rs.getString("numero"));
                usuario.setCidade(rs.getString("cidade"));
                usuario.setBairro(rs.getString("bairro"));
                usuario.setCep(rs.getString("cep"));
                usuario.setLogradouro(rs.getString("logradouro"));
                usuario.setSenha(rs.getString("senha"));
            }else{
                usuario = null;
            }
            
            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return usuario;
    }
    
    public static String setSenha(Usuario usuario) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "UPDATE usuario SET senha=? WHERE email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getSenha());
            ps.setString(2, usuario.getEmail());
            ps.execute();
            
            ps.close();
            con.close();
            
            resp="ok";
        }catch (Exception e){
            resp = e.toString();
        }
        return resp;
    }
    
    public static String alterarUsuario(Usuario usuario) {

        String resp = "";

        try {
            Connection con = Conecta.getConexao();
            String sql = "UPDATE usuario SET dataNascimento=?, sexo=?, NomeRazao=?, telefone=?, cep=?, logradouro=?, numero=?, complemento=?, estado=?, cidade=?, bairro=?, senha=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getDataNascimento().toString());
            ps.setString(2, usuario.getSexo());
            ps.setString(3, usuario.getNomeRazao());
            ps.setString(4, usuario.getTelefone());
            ps.setString(5, usuario.getCep());
            ps.setString(6, usuario.getLogradouro());
            ps.setString(7, usuario.getNumero());
            ps.setString(8, usuario.getComplemento());
            ps.setString(9, usuario.getEstado());
            ps.setString(10, usuario.getCidade());
            ps.setString(11, usuario.getBairro());
            ps.setString(12, usuario.getSenha());
            
            ps.setString(13, Integer.toString(usuario.getId()));

            ps.execute();

            ps.close();
            con.close();

            resp = "OK";

        } catch (Exception e) {
            resp = e.toString();
        }

        return resp;
    } 
    
    public static Usuario getUserById(int id) {
        
        Usuario usuario = new Usuario();
        
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM usuario WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                usuario.setSexo(rs.getString("sexo"));
                usuario.setDataNascimento(rs.getDate("dataNascimento"));
                usuario.setId(rs.getInt("id"));
                usuario.setTipoPessoa(rs.getInt("tipoPessoa"));
                usuario.setComplemento(rs.getString("complemento"));
                usuario.setCpf_cnpj(rs.getString("cpf_cnpj"));
                usuario.setEstado(rs.getString("estado"));
                usuario.setEmail(rs.getString("email"));
                usuario.setNomeRazao(rs.getString("nomeRazao"));
                usuario.setTelefone(rs.getString("telefone"));
                usuario.setNumero(rs.getString("numero"));
                usuario.setCidade(rs.getString("cidade"));
                usuario.setBairro(rs.getString("bairro"));
                usuario.setCep(rs.getString("cep"));
                usuario.setLogradouro(rs.getString("logradouro"));
                usuario.setSenha(rs.getString("senha"));
            }else{
                usuario = null;
            }
            
            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return usuario;
    }
}