/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author DELL
 */
public class ResourceDTO implements Serializable{
    private int id;
    private String name;
    private String color;
    private String image;
    private Date usingDate;
    private int quantity;
    private String categoryID;
    private boolean booking;
    
    public ResourceDTO(int id, String name, String color,String image, Date usingDate, int quantity, String categoryID) {
        this.id = id;
        this.name = name;
        this.color = color;
        this.image = image;
        this.usingDate = usingDate;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.booking = false;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getUsingDate() {
        return usingDate;
    }

    public void setUsingDate(Date usingDate) {
        this.usingDate = usingDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public boolean isBooking() {
        return booking;
    }

    public void setBooking(boolean booking) {
        this.booking = booking;
    }

 
    
}
