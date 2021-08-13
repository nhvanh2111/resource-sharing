/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.RequestDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import utils.DBHelper;

/**
 *
 * @author DELL
 */
public class RequestDAO implements Serializable {

    private List<RequestDTO> listRequest;

    public List<RequestDTO> getListRequest() {
        return listRequest;
    }

    public void loadRequestIsNew() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select requestID, resourceID, userID, quantity, createDate, status "
                        + "FROM request WHERE status = ? ORDER BY createDate ";
                
                ps = con.prepareStatement(sql);
                ps.setString(1, "new");
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (this.listRequest == null) {
                        this.listRequest = new ArrayList<>();
                    }
                    this.listRequest.add(new RequestDTO(rs.getInt("requestID"), rs.getInt("resourceID"),
                            rs.getString("userID"), rs.getInt("quantity"), rs.getDate("createDate"),
                            rs.getString("status")));
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
    }
    
    public void loadRequestHistory() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select requestID, resourceID, userID, quantity, createDate, status "
                        + "FROM request WHERE status <> ? ORDER BY createDate ";
                
                ps = con.prepareStatement(sql);
                ps.setString(1, "new");
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (this.listRequest == null) {
                        this.listRequest = new ArrayList<>();
                    }
                    this.listRequest.add(new RequestDTO(rs.getInt("requestID"), rs.getInt("resourceID"),
                            rs.getString("userID"), rs.getInt("quantity"), rs.getDate("createDate"),
                            rs.getString("status")));
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
    }
    
    public void loadRequestHistoryByDate(String date) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select requestID, resourceID, userID, quantity, createDate, status "
                        + "FROM request WHERE status != ? AND createDate = ? "
                        + "ORDER BY createDate ";
                
                ps = con.prepareStatement(sql);
                ps.setString(1, "new");
                ps.setString(2, date);
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (this.listRequest == null) {
                        this.listRequest = new ArrayList<>();
                    }
                    this.listRequest.add(new RequestDTO(rs.getInt("requestID"), rs.getInt("resourceID"),
                            rs.getString("userID"), rs.getInt("quantity"), rs.getDate("createDate"),
                            rs.getString("status")));
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
    }
    
    public void loadRequestHistoryByUserID(String userID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select requestID, resourceID, userID, quantity, createDate, status "
                        + "FROM request WHERE userID = ? "
                        + "ORDER BY createDate ";
                
                ps = con.prepareStatement(sql);
                ps.setString(1, userID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (this.listRequest == null) {
                        this.listRequest = new ArrayList<>();
                    }
                    this.listRequest.add(new RequestDTO(rs.getInt("requestID"), rs.getInt("resourceID"),
                            rs.getString("userID"), rs.getInt("quantity"), rs.getDate("createDate"),
                            rs.getString("status")));
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
    }
    
    public void loadRequestIsNewByResoureID(int resourceID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select requestID, resourceID, userID, quantity, createDate, status "
                        + "FROM request WHERE resourceID = ? "
                        + "ORDER BY createDate";
                
                ps = con.prepareStatement(sql);
                ps.setInt(1, resourceID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (this.listRequest == null) {
                        this.listRequest = new ArrayList<>();
                    }
                    this.listRequest.add(new RequestDTO(rs.getInt("requestID"), rs.getInt("resourceID"),
                            rs.getString("userID"), rs.getInt("quantity"), rs.getDate("createDate"),
                            rs.getString("status")));
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
    }

    public boolean insertNewRequest(int resourceID, String userID, Date createDate) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO request(resourceID, userID, quantity, createDate, status) "
                        + "VALUES(?,?,?,?,?)";
                
                ps = con.prepareStatement(sql);
                ps.setInt(1, resourceID);
                ps.setString(2, userID);
                ps.setInt(3, 1);
                ps.setDate(4, createDate);
                ps.setString(5, "new");
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
    
    public boolean updateRequestStatus(int requestID, String status) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE request "
                        + "SET status = ? "
                        + "WHERE requestID = ?";
                
                ps = con.prepareStatement(sql);
                ps.setString(1, status);
                ps.setInt(2, requestID);
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
    public int getTotalByRequestSuccess(int resourceID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT COUNT(resourceID) as totalQuantity "
                        + "FROM request WHERE resourceID = ? "
                        + "AND status = ? ";
                
                ps = con.prepareStatement(sql);
                ps.setInt(1, resourceID);
                ps.setString(2, "accept");
                rs = ps.executeQuery();
                if (rs.next()) {
                    return rs.getInt(("totalQuantity"));
                }
            }
        } finally {
            if (rs!= null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return 0;
    }
    
    public boolean getStatusByReousrceIDAndUserIDIsNew(int resourceID, String userID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT requestID "
                        + "FROM request "
                        + "WHERE resourceID = ? AND userID = ? AND status = ? ";
                
                ps = con.prepareStatement(sql);
                
                ps.setInt(1, resourceID);
                ps.setString(2, userID);
                ps.setString(3, "new");
                
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
}
