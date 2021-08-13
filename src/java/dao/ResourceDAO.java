/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ResourceDTO;
import java.io.Serializable;
import java.sql.Connection;
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
public class ResourceDAO implements Serializable {

    private List<ResourceDTO> listResources;
    private final int PAGINATION = 6;

    public List<ResourceDTO> getListResources() {
        return listResources;
    }

    public void loadDefaultResources(int pageIndex) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            int pageStart = (pageIndex - 1) * PAGINATION;
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select id, name, color,img, usingDate, quantity, categoryID "
                        + "FROM resource WHERE quantity > 0 "
                        + "ORDER BY name OFFSET ? ROWS FETCH NEXT " + PAGINATION + " ROWS ONLY";
                
                ps = con.prepareStatement(sql);
                ps.setInt(1, pageStart);
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (this.listResources == null) {
                        listResources = new ArrayList<>();
                    }
                    listResources.add(new ResourceDTO(rs.getInt("id"), rs.getString("name"),
                            rs.getString("color"), rs.getString("img"), rs.getDate("usingDate"),
                            rs.getInt("quantity"), rs.getString("categoryID")));
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

    public int getTotalRowDefault() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT COUNT(id) AS total "
                        + "FROM resource WHERE quantity > 0";
                
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return (int) Math.ceil((double) rs.getInt("total") / PAGINATION);
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
        return -1;
    }

    public void loadSearchResourcesByNameAndCateAndDate(String value, String cate, String date, int pageIndex) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            int pageStart = (pageIndex - 1) * PAGINATION;
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select id, name, color,img, usingDate, quantity, categoryID "
                        + "FROM resource WHERE name LIKE ? AND categoryID = ? AND usingDate >= ? AND quantity > 0 "
                        + "ORDER BY name OFFSET ? ROWS FETCH NEXT " + PAGINATION + " ROWS ONLY";
                
                ps = con.prepareStatement(sql);
                ps.setString(1, "%" + value + "%");
                ps.setString(2, cate);
                ps.setString(3, date);
                ps.setInt(4, pageStart);
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (this.listResources == null) {
                        listResources = new ArrayList<>();
                    }
                    listResources.add(new ResourceDTO(rs.getInt("id"), rs.getString("name"),
                            rs.getString("color"), rs.getString("img"), rs.getDate("usingDate"),
                            rs.getInt("quantity"), rs.getString("categoryID")));
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

    public int getTotalSearchByNameAndCateAndDate(String value, String cate, String date) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT COUNT(id) AS total "
                        + "FROM resource "
                        + "WHERE name LIKE ? AND categoryID = ? AND usingDate >= ? AND quantity > 0 ";
                
                ps = con.prepareStatement(sql);
                ps.setString(1, "%" + value + "%");
                ps.setString(2, cate);
                ps.setString(3, date);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return (int) Math.ceil((double) rs.getInt("total") / PAGINATION);
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
        return -1;
    }

    public int getTotalQuantityResource(int resourceID) throws NamingException, SQLException{
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT quantity "
                        + "FROM resource WHERE id = ? ";
                
                ps = con.prepareStatement(sql);
                ps.setInt(1, resourceID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return rs.getInt("quantity");
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
        return -1;
    }
    
    
    
}
