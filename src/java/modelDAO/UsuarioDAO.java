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
                usuario.setDataNascimento(rs.getString("dataNascimento"));
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
    
    public String setSenha(Usuario usuario) {
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
}