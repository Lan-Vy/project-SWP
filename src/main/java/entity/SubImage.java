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
public class SubImage {

    // Private fields for sub-image details
    private int subImageID; // Unique identifier for the sub-image
    private int pID; // Product ID to which this sub-image belongs
    private String image; // URL or path of the sub-image

    // Default constructor
    public SubImage() {
    }

    // Parameterized constructor to initialize SubImage with all fields
    public SubImage(int subImageID, int pID, String image) {
        this.subImageID = subImageID;
        this.pID = pID;
        this.image = image;
    }

    // Getter for pID
    public int getpID() {
        return pID;
    }

    // Setter for pID
    public void setpID(int pID) {
        this.pID = pID;
    }

    // Getter for image
    public String getImage() {
        return image;
    }

    // Setter for image
    public void setImage(String image) {
        this.image = image;
    }

    // Getter for subImageID
    public int getSubImageID() {
        return subImageID;
    }

    // Setter for subImageID
    public void setSubImageID(int subImageID) {
        this.subImageID = subImageID;
    }

    // Overridden toString method to display sub-image information
    @Override
    public String toString() {
        return "SubImage{" + "pID=" + pID + ", image=" + image + '}';
    }

}
