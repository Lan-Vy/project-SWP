/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author dell
 */
public class Cart {

    private List<Product> items;

    public Cart() {
    }

    public Cart(List<Product> items) {
        this.items = items;
    }

    public void add(Product ci) {
        for (Product product : items) {
            if (ci.getId() == product.getId()) {
                if ((product.getNumberInCart() + 1) <= product.getAmount()) {
                    product.setNumberInCart(product.getNumberInCart() + 1);
                }
                return;
            }
        }
        items.add(ci);
    }

    public void minus(Product ci) {
        for (Product product : items) {
            if (ci.getId() == product.getId()) {
                if (product.getNumberInCart() > 1) {
                    product.setNumberInCart(product.getNumberInCart() - 1);
                } else {
                    items.remove(product);
                }
                return;
            }
        }
    }

    public void remove(int id) {
        for (Product product : items) {
            if (product.getId() == id) {
                items.remove(product);
                return;
            }
        }
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
