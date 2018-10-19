package model;

import java.util.ArrayList;
import model.ItemCart;
import model.Produto;

public class Cart {
    private boolean exists = false;
    private int pos = 0;
        
    public ArrayList AddItemCart(Produto produto, ArrayList lista) {
        
        if (lista == null) {
            lista = new ArrayList();
        }

        // Verificar se o item a ser adicionar, já existe na lista
        for (int i = 0; i < lista.size(); i++) {
            int idsLista = ((ItemCart)lista.get(i)).getProduto().getId();
            if (idsLista == produto.getId()){
                exists = true;
                pos = i;
            }
        }

        // Caso já exista na lista, adicionar 1 na quantidade, ao invés de adicionar um item repetido
        if (exists) {
            ItemCart itemExistente = ((ItemCart)lista.get(pos));
            itemExistente.setQuantidade(itemExistente.getQuantidade() + 1);
        } else {
            ItemCart item = new ItemCart();
            item.setProduto(produto);
            item.setQuantidade(1);
            lista.add(item);
        }
        
        return lista;
    }
    
    public ArrayList RemoveItemCart(Produto produto, ArrayList lista) {
        
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
