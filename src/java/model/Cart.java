package model;

import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.http.Cookie;
import model.ItemCart;
import model.Produto;

public class Cart {
    private boolean exists = false;
    private String key, value = "0";
        
    public HashMap<String, String> AddItemCart(int produto, HashMap<String, String> lista) {
        
        if (lista == null) {
            lista = new HashMap<String, String>();
        }

        // Verificar se o item a ser adicionar, já existe na lista
        for (int i = 0; i < lista.size(); i++) {
            int idLista = Integer.parseInt(lista.get(i));
            if (idLista == produto){
                exists = true;
                key = String.valueOf(i);
            }
        }

        // Caso já exista na lista, adicionar 1 na quantidade, ao invés de adicionar um item repetido
        if (exists) {
            lista.get(key)
            itemExistente.setQuantidade(itemExistente.getQuantidade() + 1);
        } else {
            ItemCart item = new ItemCart();
            item.setProduto(produto);
            item.setQuantidade(1);
            lista.add(item);
        }
        
        return lista;
    }
    
    public HashMap RemoveItemCart(Produto produto, ArrayList lista) {
        
        if (lista == null) {
            lista = new ArrayList();
        }

        // Verificar se o item a ser adicionar, já existe na lista
        for (int i = 0; i < lista.size(); i++) {
            int idsLista = ((ItemCart)lista.get(i)).getProduto().getId();
            if (idsLista == produto.getId()){
                lista.remove(i);
            }
        }
        
        return lista;
    }
    
    public ArrayList UpdateItemCart(int codLivro, int qtd, ArrayList lista) {
        
        if (lista == null) {
            lista = new ArrayList();
        }

        // Verificar se o item a ser adicionar, já existe na lista
        for (int i = 0; i < lista.size(); i++) {
            ItemCart item = ((ItemCart)lista.get(i));
            if (item.getProduto().getId() == codLivro){
                item.setQuantidade(qtd);
            }
        }
        
        return lista;
    }
}
