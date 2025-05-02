/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Size {

    private int id;
    private String size;

    private int quantity;
    private double price;

    public Size() {
    }

    public Size(String size) {
        this.size = size;
    }

    public Size(int id, String size) {
        this.id = id;
        this.size = size;
    }

    public Size(int id, String size, int quantity) {
        this.id = id;
        this.size = size;
        this.quantity = quantity;
    }

    public Size(int id, int quantity, double price) {
        this.id = id;
        this.quantity = quantity;
        this.price = price;
    }

    public Size(int id, String size, int quantity, double price) {
        this.id = id;
        this.size = size;
        this.quantity = quantity;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}
