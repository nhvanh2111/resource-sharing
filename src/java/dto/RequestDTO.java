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
public class RequestDTO implements Serializable{
    private int requestID;
    private int resourceID;
    public String userID;
    private int quantity;
    private Date createDate;
    private String status;
    private boolean isStock;

    public RequestDTO(int requestID, int resourceID, String userID, int quantity, Date createDate, String status) {
        this.requestID = requestID;
        this.resourceID = resourceID;
        this.userID = userID;
        this.quantity = quantity;
        this.createDate = createDate;
        this.status = status;
        isStock = false;
    }

    public int getRequestID() {
        return requestID;
    }

    public void setRequestID(int requestID) {
        this.requestID = requestID;
    }

    public int getResourceID() {
        return resourceID;
    }

    public void setResourceID(int resourceID) {
        this.resourceID = resourceID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

   

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public boolean isIsStock() {
        return isStock;
    }

    public void setIsStock(boolean isStock) {
        this.isStock = isStock;
    }

    
    
}
