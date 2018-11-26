package modelDAO;

import java.sql.*;
import model.Funcionario;


public class FuncionarioDAO {
    
    public static Funcionario getFuncionario(String email) {
        
        Funcionario func = new Funcionario();
        
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM usuario WHERE email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                func.setId(rs.getInt("id"));
                func.setCpf(rs.getString("cpf_cnpj"));
                func.setTipoPessoa(rs.getInt("tipopessoa"));
                func.setDataNascimento(rs.getDate("dataNascimento"));
                func.setSexo(rs.getString("sexo"));
                func.setEmail(rs.getString("email"));
                func.setTelefone(rs.getString("telefone"));
                //func.setCelular(rs.getString("celular"));
                func.setNome(rs.getString("nome"));
                func.setCep(rs.getString("cep"));
                func.setLogradouro(rs.getString("logradouro"));
                func.setNumero(rs.getString("numero"));
                func.setComplemento(rs.getString("complemento"));
                func.setEstado(rs.getString("estado"));
                func.setCidade(rs.getString("cidade"));
                func.setBairro(rs.getString("bairro"));
                func.setSenha(rs.getString("senha"));
                func.setNivel_usuario(rs.getString("Nivel_Usuario"));
                func.setAtivo(rs.getString("Ativo"));
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
            String sql = "INSERT INTO usuario(cpf_cnpj, tipoPessoa, dataNascimento, sexo, email, telefone, nomeRazao, cep, logradouro, "
                    + "numero, complemento, estado, cidade, bairro, senha, Nivel_Usuario, Ativo, banco, agencia, conta, digito) "
                    + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, func.getCpf());
            ps.setInt(2, func.getTipoPessoa());
            ps.setDate(3, func.getDataNascimento());
            ps.setString(4, func.getSexo());
            ps.setString(5, func.getEmail());
            ps.setString(6, func.getTelefone());
            ps.setString(7, func.getNome());
            ps.setString(8, func.getCep());
            ps.setString(9, func.getLogradouro());
            ps.setString(10, func.getNumero());
            ps.setString(11, func.getComplemento());
            ps.setString(12, func.getEstado());
            ps.setString(13, func.getCidade());
            ps.setString(14, func.getBairro());
            ps.setString(15, func.getSenha());
            ps.setString(16, func.getNivel_usuario());
            ps.setString(17, func.getAtivo());
            //ps.setString(9, func.getCelular());
            ps.setString(18, func.getBanco());
            ps.setInt(19, func.getAgencia());
            ps.setInt(20, func.getConta());
            ps.setInt(21, func.getDigito());
            
            ps.execute();
            
            ps.close();
            con.close();
            
            resp="OK";
        }catch (Exception e){
            resp = e.toString();
        }
        return resp;
    }
    
    public static String alterarSenha(Funcionario func) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "UPDATE usuario SET senha=? WHERE email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, func.getSenha());
            ps.setString(2, func.getEmail());
            ps.execute();
            
            ps.close();
            con.close();
            
            resp="OK";
        }catch (Exception e){
            resp = e.toString();
        }
        return resp;
    }
    
    public static String alterarFuncionario(Funcionario func) {

        String resp = "";

        try {
            Connection con = Conecta.getConexao();
            String sql = "UPDATE usuario SET email = ?, senha = ?, tipoPessoa = ?, nomeRazao = ?, cpf = ?, sexo = ?, "
                       + "dataNascimento = ?, telefone = ?, cep = ?, numero = ?, logradouro = ?, complemento = ?, "
                       + "bairro = ?, estado = ?, cidade = ?, banco = ?, agencia = ?, conta = ?, digito = ? WHERE id = ?";
            
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, func.getEmail());
            ps.setString(2, func.getSenha());
            ps.setString(3, Integer.toString(func.getTipoPessoa()));
            ps.setString(4, func.getNome());
            ps.setString(5, func.getCpf());
            ps.setString(6, func.getSexo());
            ps.setString(7, func.getDataNascimento().toString());
            ps.setString(8, func.getTelefone());
            //ps.setString(9, func.getCelular());
            ps.setString(9, func.getCep());
            ps.setString(10, func.getNumero());
            ps.setString(11, func.getLogradouro());
            ps.setString(12, func.getComplemento());
            ps.setString(13, func.getBairro());
            ps.setString(14, func.getEstado());
            ps.setString(15, func.getCidade());
            ps.setString(16, func.getBanco());
            ps.setString(17, Integer.toString(func.getAgencia()));
            ps.setString(18, Integer.toString(func.getConta()));
            ps.setString(19, Integer.toString(func.getDigito()));
            
            ps.setString(20, Integer.toString(func.getId()));

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