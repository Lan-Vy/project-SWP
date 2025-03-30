/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author dell
 */
public class Cart {

    private List<Product> items;

    public Cart() {
        this.items = new ArrayList<>();
    }

    public Cart(List<Product> items) {
        this.items = items;
    }

    public void add(Product ci) {
        for (Product product : items) {
            if (ci.getId() == product.getId() && ci.getSizeInCart().getId() == product.getSizeInCart().getId()) {
                if ((product.getNumberInCart() + 1) <= product.getAmount()) {
                    product.setNumberInCart(product.getNumberInCart() + 1);
                }
                return;
            }
        }
        ci.setNumberInCart(1);
        items.add(ci);
    }

    public void minus(Product ci) {
        for (int i = 0; i < items.size(); i++) {
            Product product = items.get(i);
            if (ci.getId() == product.getId() && ci.getSizeInCart().getId() == product.getSizeInCart().getId()) {
                if (product.getNumberInCart() >= 1) {
                    product.setNumberInCart(product.getNumberInCart() - 1);
                } else {
                    items.remove(i);
                }
                return;
            }
        }
    }

    public void remove(int id, int size) {
        items.removeIf(product -> product.getId() == id && product.getSizeInCart().getId() == size);
    }

    public double getAmount() {
        double s = 0;
        for (Product product : items) {
            s += product.getPrice() * product.getNumberInCart();
        }
        return Math.round(s * 100.0) / 100.0;
    }

    public List<Product> getItems() {
        return items;
    }
}
