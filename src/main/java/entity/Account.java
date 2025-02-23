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
public class Account {

    // Private fields for encapsulation of Account details
    private int id;
    private String userName;
    private String passWord;
    private int role;  // 1: User, 2: Admin, 3: Shipper
    private String email;

    // Default constructor
    public Account() {
    }

    public Account(int id, String userName) {
        this.id = id;
        this.userName = userName;
    }

    public Account(int id) {
        this.id = id;
    }

    // Constructor with five parameters (no email)
    public Account(int id, String userName, String passWord, int role) {
        this.id = id;
        this.userName = userName;
        this.passWord = passWord;
        this.role = role;
    }

    // Constructor with six parameters (including email)
    public Account(int id, String userName, String passWord, int role, String email) {
        this.id = id;
        this.userName = userName;
        this.passWord = passWord;
        this.role = role;
        this.email = email;
    }

    public Account(String userName, String passWord, int role, String email) {
        this.userName = userName;
        this.passWord = passWord;
        this.role = role;
        this.email = email;
    }

    // Getter for id
    public int getId() {
        return id;
    }

    // Setter for id
    public void setId(int id) {
        this.id = id;
    }

    // Getter for userName
    public String getUserName() {
        return userName;
    }

    // Setter for userName
    public void setUserName(String userName) {
        this.userName = userName;
    }

    // Getter for passWord
    public String getPassWord() {
        return passWord;
    }

    // Setter for passWord
    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    // Getter for email
    public String getEmail() {
        return email;
    }

    // Setter for email
    public void setEmail(String email) {
        this.email = email;
    }

}
