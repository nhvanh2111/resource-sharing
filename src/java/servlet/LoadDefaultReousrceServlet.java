/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.RequestDAO;
import dao.ResourceDAO;
import dto.RegistrationDTO;
import dto.RequestDTO;
import dto.ResourceDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(name = "LoadDefaultReousrceServlet", urlPatterns = {"/LoadDefaultReousrceServlet"})
public class LoadDefaultReousrceServlet extends HttpServlet {

    private final String HOME_PAGE = "home.jsp";

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
        
        String pageIndexString = request.getParameter("pageIndex");
        HttpSession session = request.getSession();
        RegistrationDTO regisDTO = (RegistrationDTO) session.getAttribute("USER");

        int pageIndex = 1;
        if (pageIndexString != null) {
            pageIndex = Integer.parseInt(pageIndexString);
        }

        try {
            ResourceDAO dao = new ResourceDAO();
            RequestDAO reqDAO = new RequestDAO();
            dao.loadDefaultResources(pageIndex);
            List<ResourceDTO> listResource = dao.getListResources();
            if (listResource != null) {
                if (regisDTO != null) {
                    if (regisDTO.isIsManage()) {
                        reqDAO.loadRequestIsNew();
                        List<RequestDTO> listRequest = reqDAO.getListRequest();
                        if (listRequest != null) {
                            for (ResourceDTO dto : listResource) {
                                for (RequestDTO req : listRequest) {
                                    if(dto.getId()==req.getResourceID()){
                                        dto.setBooking(true);
                                    }
                                }
                            }
                        }
                    } else {
                        for (ResourceDTO dto : listResource) {
                            if (reqDAO.getStatusByReousrceIDAndUserIDIsNew(dto.getId(), regisDTO.getUserID())) {
                                dto.setBooking(true);
                            }
                        }
                    }
                }
                int totalPage = dao.getTotalRowDefault();
                request.setAttribute("result", listResource);
                request.setAttribute("pageIndexActive", pageIndex);
                request.setAttribute("totalPage", totalPage);
                request.setAttribute("action", "loadDefaul");
            }
        } catch (NamingException ex) {
            log("LoadDefaultReousrceServlet NamingEx: " + ex.getMessage());
        } catch (SQLException ex) {
            log("LoadDefaultReousrceServlet SQLEx: " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(HOME_PAGE);
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
