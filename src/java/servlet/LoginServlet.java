/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.RegistrationDAO;
import dto.RegistrationDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import recaptchar.VerifyUtils;

/**
 *
 * @author DELL
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    private final String LOAD_DEFAULT_SERVLET = "LoadDefaultReousrceServlet";
    private final String LOGIN_PAGE = "login.jsp";

    private static final long serialVersionUID = 958900029856081978L;

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
        
        String userID = request.getParameter("userID");
        String password = request.getParameter("password");
        
        String url = LOGIN_PAGE;
        
        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
        boolean valid = VerifyUtils.verify(gRecaptchaResponse);
        try {
            RegistrationDAO dao = new RegistrationDAO();
            RegistrationDTO dto = dao.checkLogin(userID, password);
            if (dto != null) {
                if (valid) {
                    HttpSession session = request.getSession();
                    session.setAttribute("USER", dto);
                    url = LOAD_DEFAULT_SERVLET;
                } else {
                    request.setAttribute("CAPTCHA", "Captcha invalid!");
                }

            } else {
                if (!dao.checkUserByUserID(userID)) {
                    request.setAttribute("FAILEMAIL", "This email does not exist");
                } else {
                    request.setAttribute("FAILPASS", "Incorrect password");
                }
            }
        } catch (NamingException ex) {
            log("LoginServlet_NamingEx: " + ex.getMessage());
        } catch (SQLException ex) {
            log("LoginServlet_SQLEx: " + ex.getMessage());
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
