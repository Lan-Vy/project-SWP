/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

public class Order {
    // Private fields to store order details
    private int id; // Unique identifier for the order
    private Date date; // Date of the order
    private int accountID; // ID of the account associated with the order
    private String address; // Shipping address for the order
    private String sdt; // Contact phone number (in Vietnamese, "sdt" stands for "số điện thoại")
    private String name; // Name of the person associated with the order
    private double totalPrice; // Total price of the order
    private int status; //0: Pending 1: Processing 2: Shipping 3: Completed
    private Account shipper;

    // Default constructor
    public Order() {
    }

    public Order(int id, Account shipper) {
        this.id = id;
        this.shipper = shipper;
    }

    public Order(int id, int status) {
        this.id = id;
        this.status = status;
    }

    // Parameterized constructor to initialize an Order with specific details
    public Order(int id, Date date, int accountID, String address, String sdt, String name, double totalPrice) {
        this.id = id;
        this.date = date;
        this.accountID = accountID;
        this.address = address;
        this.sdt = sdt;
        this.name = name;
        this.totalPrice = totalPrice;
    }

    // Getter for id
    public int getId() {
        return id;
    }

    // Setter for id
    public void setId(int id) {
        this.id = id;
    }

    // Getter for date
    public Date getDate() {
        return date;
    }

    // Setter for date
    public void setDate(Date date) {
        this.date = date;
    }

    // Getter for accountID
    public int getAccountID() {
        return accountID;
    }

    // Setter for accountID
    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    // Getter for address
    public String getAddress() {
        return address;
    }

    // Setter for address
    public void setAddress(String address) {
        this.address = address;
    }

    // Getter for sdt (contact phone number)
    public String getSdt() {
        return sdt;
    }

    // Setter for sdt (contact phone number)
    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    // Getter for name
    public String getName() {
        return name;
    }

    // Setter for name
    public void setName(String name) {
        this.name = name;
    }

    // Getter for totalPrice
    public double getTotalPrice() {
        return totalPrice;
    }

    // Setter for totalPrice
    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Account getShipper() {
        return shipper;
    }

    public void setShipper(Account shipper) {
        this.shipper = shipper;
    }

    // Overridden toString method to display order information
    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", date=" + date +
                ", accountID=" + accountID +
                ", address='" + address + '\'' +
                ", sdt='" + sdt + '\'' +
                ", name='" + name + '\'' +
                ", totalPrice=" + totalPrice +
                '}';
    }
}
