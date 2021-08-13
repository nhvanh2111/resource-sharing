/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
public class ServletController extends HttpServlet {

    private final String LOGIN_SERVLET = "LoginServlet";
    private final String LOAD_DEFAULT = "LoadDefaultReousrceServlet";
    private final String LOAD_SEARCH = "LoadSearchResourcesServlet";
    private final String REGISTER_USER_SERVLET = "RegisterUserSerlvet";
    private final String SIGN_OUT_SERVLET = "SignoutSerlvet";
    private final String BOOKING_RESOURCE_SERVLET = "BookingResourceServlet";
    private final String LOAD_REQUEST_BY_RESOURCE_ID_SERVLET = "LoadRequestByResourceIDServlet";
    private final String LOAD_REQUEST_ALL_NEW = "LoadAllRequestNewServlet";
    private final String LOAD_REQUEST_ALL_HISTORY = "LoadAllRequestHistoryServlet";
    private final String LOAD_REQUEST_ALL_HISTORY_USER = "LoadAllRequestHistoryUserIDServlet";
    private final String LOAD_REQUEST_BY_DATE_HISTORY = "LoadAllRequestHistoryByDateServlet";
    private final String UPDATE_STATUS_RESOURCE = "UpdateStatusResourceServlet";

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
        
        String btAction = request.getParameter("btAction");
        String url = "login.jsp";
        try {
            if ("Login".equals(btAction)) {
                url = LOGIN_SERVLET;
            } else if ("loadDefaul".equals(btAction)) {
                url = LOAD_DEFAULT;
            } else if ("loadSearch".equals(btAction)) {
                url = LOAD_SEARCH;
            } else if ("Search".equals(btAction)) {
                url = LOAD_SEARCH;
            } else if ("Register".equals(btAction)) {
                url = REGISTER_USER_SERVLET;
            } else if ("Signout".equals(btAction)) {
                url = SIGN_OUT_SERVLET;
            } else if ("Booking".equals(btAction)) {
                url = BOOKING_RESOURCE_SERVLET;
            } else if ("loadListRequestByID".equals(btAction)) {
                url = LOAD_REQUEST_BY_RESOURCE_ID_SERVLET;
            } else if ("loadAllRequestNew".equals(btAction)) {
                url = LOAD_REQUEST_ALL_NEW;
            } else if ("loadAllRequestHistory".equals(btAction)) {
                url = LOAD_REQUEST_ALL_HISTORY;
            } else if ("loadAllRequestHistoryUserID".equals(btAction)) {
                url = LOAD_REQUEST_ALL_HISTORY_USER;
            } else if ("SearchHistory".equals(btAction)) {
                url = LOAD_REQUEST_BY_DATE_HISTORY;
            } else if ("updateStatusResource".equals(btAction)) {
                url = UPDATE_STATUS_RESOURCE;
            }      
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
