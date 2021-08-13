/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.RegistrationDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import utils.DBHelper;

/**
 *
 * @author DELL
 */
public class RegistrationDAO implements Serializable {

    public RegistrationDTO checkLogin(String userID, String password) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select userID, password, fullName, phone,address, isManage, status ,createDate "
                            + "FROM registration WHERE userID = ? "
                            + "AND password = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, userID);
                ps.setString(2, password);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return new RegistrationDTO(rs.getString("userID"), rs.getString("password"),
                            rs.getString("fullName"), rs.getString("phone"), rs.getString("address"),
                            rs.getBoolean("isManage"), rs.getBoolean("status"), rs.getDate("createDate"));
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }

    public boolean checkUserByUserID(String userID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select userID "
                        + "FROM registration WHERE userID = ? ";
                
                ps = con.prepareStatement(sql);
                ps.setString(1, userID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return true;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean insertNewAccountToRegistration(String userID, String password, String fullName, 
            String phone, String address, Date createDate) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO registration(userID, password, fullName, phone, address, isManage, status, createDate) "
                        + "VALUES(?,?,?,?,?,?,?,?)";
                
                ps = con.prepareStatement(sql);
                ps.setString(1, userID);
                ps.setString(2, password);
                ps.setString(3, fullName);
                ps.setString(4, phone);
                ps.setString(5, address);
                ps.setBoolean(6, false);
                ps.setBoolean(7, true);
                ps.setDate(8, createDate);
                int rs = ps.executeUpdate();
                if (rs > 0) {
                    return true;
                }
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    
    public boolean updateRoleAfterVerify(String userID) throws NamingException, SQLException{
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE registration SET status = ? "
                        + "WHERE userID = ?";
                
                ps = con.prepareStatement(sql);
                ps.setBoolean(1, true);
                ps.setString(2, userID);
                int rs = ps.executeUpdate();
                if (rs > 0) {
                    return true;
                }
            }
        } finally {
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return false;
    }
}
