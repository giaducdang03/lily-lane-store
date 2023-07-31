/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ducdpg.controller;

import ducdpg.message.IconMessage;
import ducdpg.message.MessageDTO;
import ducdpg.shopping.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author giadu
 */
@WebServlet(name = "OrderUpdateController", urlPatterns = {"/OrderUpdateController"})
public class OrderUpdateController extends HttpServlet {
    private static final String ERROR = "OrderSearchController";
    private static final String SUCCESS = "OrderSearchController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String orderCode = request.getParameter("orderCode");
            OrderDAO dao = new OrderDAO();
            boolean checkUpdate = dao.updateStatus(orderCode);
            if (checkUpdate){
                MessageDTO message = new MessageDTO("success", "Manager", IconMessage.SUCCESS, "Update order " + orderCode + " successfully.");
                request.setAttribute("MESSAGE", message);
                url = SUCCESS;
            } else {
                MessageDTO message = new MessageDTO("error", "Manager", IconMessage.ERROR, "Somethings Error. Try again!");
                request.setAttribute("MESSAGE", message);
            }
        } catch (Exception e) {
            log("Error at OrderUpdateController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
