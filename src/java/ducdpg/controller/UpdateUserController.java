/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ducdpg.controller;

import ducdpg.message.IconMessage;
import ducdpg.message.MessageDTO;
import ducdpg.users.UserDAO;
import ducdpg.users.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author giadu
 */
@WebServlet(name = "UpdateUserController", urlPatterns = {"/UpdateUserController"})
public class UpdateUserController extends HttpServlet {
    private static final String ERROR = "SearchUserController";
    private static final String SUCCESS = "SearchUserController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID").toUpperCase();
            if (!roleID.equals("AD") && !roleID.equals("US")){
                System.out.println(roleID);
                MessageDTO message = new MessageDTO("error", "Manager", IconMessage.ERROR, "Role " + roleID + " does not exist.");
                request.setAttribute("MESSAGE", message);
            } else {
                HttpSession session = request.getSession();
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                UserDAO dao = new UserDAO();
                UserDTO user = new UserDTO(userID, fullName, roleID);
                boolean check = dao.update(user);
                if (check) {
                    if (loginUser.getUserID().equals(userID)) {
                        loginUser.setFullName(fullName);
                        loginUser.setRoleID(roleID);
                        session.setAttribute("LOGIN_USER", loginUser);
                        url = SUCCESS;
                    }
                    url = SUCCESS;
                    MessageDTO message = new MessageDTO("success", "Manager", IconMessage.SUCCESS, "Updated successfully.");
                    request.setAttribute("MESSAGE", message);
                } else {
                    MessageDTO message = new MessageDTO("error", "Manager", IconMessage.ERROR, "Can't update user. Try again!");
                    request.setAttribute("MESSAGE", message);
                }
            }
        } catch (Exception e){
            log("Error at UpdateUserController: " + e.toString());
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
