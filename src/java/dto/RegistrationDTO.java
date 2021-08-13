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
public class RegistrationDTO implements Serializable {

    private String userID;
    private String password;
    private String fullName;
    private String phone;
    private String address;
    private boolean isManage;
    private boolean status;
    private Date createDate;

    public RegistrationDTO(String userID, String password, String fullName, String phone, String address, boolean isManage, boolean status, Date createDate) {
        this.userID = userID;
        this.password = password;
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.isManage = isManage;
        this.status = status;
        this.createDate = createDate;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public boolean isIsManage() {
        return isManage;
    }

    public void setIsManage(boolean isManage) {
        this.isManage = isManage;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

}
