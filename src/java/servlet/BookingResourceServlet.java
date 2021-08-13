/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.RequestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name = "BookingResourceServlet", urlPatterns = {"/BookingResourceServlet"})
public class BookingResourceServlet extends HttpServlet {

    private final String ERROR_PAGE = "error.jsp";
    private final String LOGIN_PAGE = "login.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String resourceID = request.getParameter("resourceID");
        String userID = request.getParameter("userID");
        String statusString = request.getParameter("status");
        java.util.Date toDay = new java.util.Date();
        Date createDate = new Date(toDay.getTime());
        String actionSearch = request.getParameter("btActionSearch");
        String url = ERROR_PAGE;
        boolean status = Boolean.parseBoolean(statusString);
        try {
            if (status) {
                RequestDAO dao = new RequestDAO();
                if (dao.insertNewRequest(Integer.parseInt(resourceID), userID, createDate)) {
                    url = "ServletController?btAction=" + actionSearch;
                }
            } else {
                url = LOGIN_PAGE;
            }

        } catch (SQLException ex) {
            log("BookingResourceSevlet_SQLEx: " + ex.getMessage());
        } catch (NamingException ex) {
            log("BookingResourceSevlet_NamingEx: " + ex.getMessage());
        } finally {
            response.sendRedirect(url);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
