/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author
 */
public class Feedback {

    private int id;
    private int userId;
    private int productId;
    private int rating;
    private String feedbackContent;
    private Date feedbackDate;
    
    private String userName;
    private String productName;

    public Feedback() {
    }

    public Feedback(int id, int userId, int productId, int rating, String feedbackContent, Date feedbackDate) {
        this.id = id;
        this.userId = userId;
        this.productId = productId;
        this.rating = rating;
        this.feedbackContent = feedbackContent;
        this.feedbackDate = feedbackDate;
    }
    
    public Feedback(int userId, int productId, int rating, String feedbackContent) {
        this.userId = userId;
        this.productId = productId;
        this.rating = rating;
        this.feedbackContent = feedbackContent;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getFeedbackContent() {
        return feedbackContent;
    }

    public void setFeedbackContent(String feedbackContent) {
        this.feedbackContent = feedbackContent;
    }

    public Date getFeedbackDate() {
        return feedbackDate;
    }

    public void setFeedbackDate(Date feedbackDate) {
        this.feedbackDate = feedbackDate;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }
    
    
}
