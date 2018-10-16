package modelDAO;

import java.sql.*;
import model.Funcionario;


public class FuncionarioDAO {
    
    public static Funcionario getFuncionario(String email) {
        
        Funcionario func = new Funcionario();
        
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM funcionario WHERE email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                func.setId(rs.getInt("id"));
                func.setEmail(rs.getString("email"));
                func.setSenha(rs.getString("senha"));
                func.setPerfil(rs.getInt("perfil"));
                func.setNome(rs.getString("nome"));
                func.setCep(rs.getString("cpf"));
                func.setSexo(rs.getString("sexo"));
                func.setDataNascimento(rs.getDate("dataNascimento"));
                func.setTelefone(rs.getString("telefone"));
                func.setCelular(rs.getString("celular"));
                func.setCep(rs.getString("cep"));
                func.setNumero(rs.getInt("numero"));
                func.setLogradouro(rs.getString("logradouro"));
                func.setComplemento(rs.getString("complemento"));
                func.setBairro(rs.getString("bairro"));
                func.setEstado(rs.getString("estado"));
                func.setCidade(rs.getString("cidade"));
                func.setBanco(rs.getString("banco"));
                func.setAgencia(rs.getInt("agencia"));
                func.setConta(rs.getInt("conta"));
                func.setDigito(rs.getInt("digito"));
            }else{
                func = null;
            }
            
            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return func;
    }
    
    public static String setFuncionario(Funcionario func) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "INSERT INTO funcionario(email, senha, perfil, nome, cpf, sexo, dataNascimento, telefone, celular, "
                    + "cep, numero, logradouro, complemento, bairro, estado, cidade, banco, agencia, conta, digito) "
                    + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, func.getEmail());
            ps.setString(2, func.getSenha());
            ps.setInt(3, func.getPerfil());
            ps.setString(4, func.getNome());
            ps.setString(5, func.getCpf());
            ps.setString(6, func.getSexo());
            ps.setDate(7, func.getDataNascimento());
            ps.setString(8, func.getTelefone());
            ps.setString(9, func.getCelular());
            ps.setString(10, func.getCep());
            ps.setInt(11, func.getNumero());
            ps.setString(12, func.getLogradouro());
            ps.setString(13, func.getComplemento());
            ps.setString(14, func.getBairro());
            ps.setString(15, func.getEstado());
            ps.setString(16, func.getCidade());
            ps.setString(17, func.getBanco());
            ps.setInt(18, func.getAgencia());
            ps.setInt(19, func.getConta());
            ps.setInt(20, func.getDigito());
            
            ps.execute();
            
            ps.close();
            con.close();
            
            resp="ok";
        }catch (Exception e){
            resp = e.toString();
        }
        return resp;
    }
    
    public static String alterarSenha(Funcionario func) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "UPDATE funcionario SET senha=? WHERE email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, func.getSenha());
            ps.setString(2, func.getEmail());
            ps.execute();
            
            ps.close();
            con.close();
            
            resp="ok";
        }catch (Exception e){
            resp = e.toString();
        }
        return resp;
    }
    
    public static String alterarFuncionario(Funcionario func) {

        String resp = "";

        try {
            Connection con = Conecta.getConexao();
            String sql = "UPDATE funcionario SET email = ?, senha = ?, perfil = ?, nome = ?, cpf = ?, sexo = ?, "
                       + "dataNascimento = ?, telefone = ?, celular = ?, cep = ?, numero = ?, logradouro = ?, complemento = ?, "
                       + "bairro = ?, estado = ?, cidade = ?, banco = ?, agencia = ?, conta = ?, digito = ? WHERE id = ?";
            
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, func.getEmail());
            ps.setString(2, func.getSenha());
            ps.setString(3, Integer.toString(func.getPerfil()));
            ps.setString(4, func.getNome());
            ps.setString(5, func.getCpf());
            ps.setString(6, func.getSexo());
            ps.setString(7, func.getDataNascimento().toString());
            ps.setString(8, func.getTelefone());
            ps.setString(9, func.getCelular());
            ps.setString(10, func.getCep());
            ps.setString(11, Integer.toString(func.getNumero()));
            ps.setString(12, func.getLogradouro());
            ps.setString(13, func.getComplemento());
            ps.setString(14, func.getBairro());
            ps.setString(15, func.getEstado());
            ps.setString(16, func.getCidade());
            ps.setString(17, func.getBanco());
            ps.setString(18, Integer.toString(func.getAgencia()));
            ps.setString(19, Integer.toString(func.getConta()));
            ps.setString(20, Integer.toString(func.getDigito()));
            
            ps.setString(21, Integer.toString(func.getId()));

            ps.execute();

            ps.close();
            con.close();

            resp = "OK";

        } catch (Exception e) {
            resp = e.toString();
        }

        return resp;
    } 
}