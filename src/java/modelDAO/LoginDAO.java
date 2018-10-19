
package modelDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelDAO.Conecta;
import model.Usuario;


public class LoginDAO {
    public static List<Usuario> getUsuario (String email, String senha){
        List<Usuario> lista = new ArrayList<>();
        try{
            Connection conn = Conecta.getConexao();
            PreparedStatement ps = conn.prepareStatement("select*from usuario WHERE email=? AND senha=?");
            ps.setString(1, email);
            ps.setString(2, senha);
            ResultSet rs =ps.executeQuery();
            
            if(rs.next()){
                Usuario objUsuario = new Usuario();
                objUsuario.setEmail(rs.getString(1));
                objUsuario.setSenha(rs.getString(2));
                lista.add(objUsuario);
            }
            conn.close();
        }
        catch(Exception ex){
            
        }
        return lista;
    }
}
