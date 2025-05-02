/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Admin
 */
public class OrderDetails {
    // Private fields to store details of an order item
    private int orderID; // ID of the order this item belongs to
    private int productID; // ID of the product in the order
    private double price; // Price of a single unit of the product
    private int quantity; // Quantity of the product in the order
    
    private String image; // URL or path to the product image
    private String productName; // Name of the product
    private String categoryName; // Category name of the product
    
    private int sizeId;
    private Size size;
    
    private boolean reviewed; // Track if this product has been reviewed

    // Default constructor
    public OrderDetails() {
    }

    // Constructor to initialize OrderDetails with essential fields
    public OrderDetails(int orderID, int productID, double price, int quantity) {
        this.orderID = orderID;
        this.productID = productID;
        this.price = price;
        this.quantity = quantity;
    }

    // Constructor to initialize OrderDetails with all fields
    public OrderDetails(int orderID, int productID, double price, int quantity, String image, String productName, String categoryName) {
        this.orderID = orderID;
        this.productID = productID;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
        this.productName = productName;
        this.categoryName = categoryName;
    }
    
    // Getter for orderID
    public int getOrderID() {
        return orderID;
    }

    // Setter for orderID
    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    // Getter for productID
    public int getProductID() {
        return productID;
    }

    // Setter for productID
    public void setProductID(int productID) {
        this.productID = productID;
    }

    // Getter for price
    public double getPrice() {
        return price;
    }

    // Setter for price
    public void setPrice(double price) {
        this.price = price;
    }

    // Getter for quantity
    public int getQuantity() {
        return quantity;
    }

    // Setter for quantity
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    // Getter for image
    public String getImage() {
        return image;
    }

    // Setter for image
    public void setImage(String image) {
        this.image = image;
    }

    // Getter for productName
    public String getProductName() {
        return productName;
    }

    // Setter for productName
    public void setProductName(String productName) {
        this.productName = productName;
    }

    // Getter for categoryName
    public String getCategoryName() {
        return categoryName;
    }

    // Setter for categoryName
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getSizeId() {
        return sizeId;
    }

    public void setSizeId(int sizeId) {
        this.sizeId = sizeId;
    }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }
    
    public boolean isReviewed() {
        return reviewed;
    }

    public void setReviewed(boolean reviewed) {
        this.reviewed = reviewed;
    }

    // Overridden toString method to display order item details
    @Override
    public String toString() {
        return "OrderDetails{" + 
                "orderID=" + orderID + 
                ", productID=" + productID + 
                ", price=" + price + 
                ", quantity=" + quantity + 
                '}';
    }
}
