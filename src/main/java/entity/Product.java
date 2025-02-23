/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.List;

/**
 *
 * @author Admin
 */
import java.util.List;

public class Product {

    // Private fields to store product details
    private int id; // Unique identifier for the product
    private String name; // Name of the product
    private String image; // URL or path to the main image of the product
    private double price; // Price of the product
    private String title; // Title or short description of the product
    private String description; // Detailed description of the product
    private int cateID; // Category ID to which the product belongs
    private List<SubImage> subImage; // List of additional images (sub-images) for the product
    private int isDeleted; // Flag to indicate if the product is deleted (1 for deleted, 0 for active)
    private int amount; // Quantity of the product in stock

    private int numberInCart; // Number of this product in the shopping cart

    // Default constructor
    public Product() {
    }

    // Constructor to initialize Product with essential fields, excluding numberInCart
    public Product(int id, String name, String image, double price, String title, String description, int cateID, List<SubImage> subImage, int amount, int isDeleted) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.title = title;
        this.description = description;
        this.cateID = cateID;
        this.subImage = subImage;
        this.amount = amount;
        this.isDeleted = isDeleted;
    }

    // Constructor to initialize Product with all fields, including numberInCart
    public Product(int id, String name, String image, double price, String title, String description, int cateID, List<SubImage> subImage, int amount, int numberInCart, int isDeleted) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.title = title;
        this.description = description;
        this.cateID = cateID;
        this.subImage = subImage;
        this.amount = amount;
        this.numberInCart = numberInCart;
        this.isDeleted = isDeleted;
    }

    // Getter for numberInCart
    public int getNumberInCart() {
        return numberInCart;
    }

    // Setter for numberInCart
    public void setNumberInCart(int numberInCart) {
        this.numberInCart = numberInCart;
    }

    // Getter for amount
    public int getAmount() {
        return amount;
    }

    // Setter for amount
    public void setAmount(int amount) {
        this.amount = amount;
    }

    // Getter for id
    public int getId() {
        return id;
    }

    // Setter for id
    public void setId(int id) {
        this.id = id;
    }

    // Getter for name
    public String getName() {
        return name;
    }

    // Setter for name
    public void setName(String name) {
        this.name = name;
    }

    // Getter for image
    public String getImage() {
        return image;
    }

    // Setter for image
    public void setImage(String image) {
        this.image = image;
    }

    // Getter for price
    public double getPrice() {
        return price;
    }

    // Setter for price
    public void setPrice(double price) {
        this.price = price;
    }

    // Getter for title
    public String getTitle() {
        return title;
    }

    // Setter for title
    public void setTitle(String title) {
        this.title = title;
    }

    // Getter for description
    public String getDescription() {
        return description;
    }

    // Setter for description
    public void setDescription(String description) {
        this.description = description;
    }

    // Getter for cateID
    public int getCateID() {
        return cateID;
    }

    // Setter for cateID
    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    // Getter for subImage list
    public List<SubImage> getSubImage() {
        return subImage;
    }

    // Setter for subImage list
    public void setSubImage(List<SubImage> subImage) {
        this.subImage = subImage;
    }

    // Getter for isDeleted
    public int getIsDeleted() {
        return isDeleted;
    }

    // Setter for isDeleted
    public void setIsDeleted(int isDeleted) {
        this.isDeleted = isDeleted;
    }

    // Overridden toString method to display product information
    @Override
    public String toString() {
        return "Product{"
                + "id=" + id
                + ", name=" + name
                + ", image=" + image
                + ", price=" + price
                + ", title=" + title
                + ", description=" + description
                + ", cateID=" + cateID
                + '}';
    }

}
