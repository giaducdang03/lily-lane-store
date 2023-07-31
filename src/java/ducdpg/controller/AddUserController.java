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
import ducdpg.users.UserError;
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
@WebServlet(name = "AddUserController", urlPatterns = {"/AddUserController"})
public class AddUserController extends HttpServlet {
    private static final String ERROR = "SearchUserController";
    private static final String SUCCESS = "SearchUserController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        UserError userError = new UserError();
        UserDAO dao = new UserDAO();
        String type = "add";
        String url = ERROR;
        try {
            boolean checkValidation = true;
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String avt = request.getParameter("avt");
            String roleID = request.getParameter("roleID");
            String password = "123456";
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            if (userID.length()<2 || userID.length() > 20){
                userError.setUserIDError("UserID must be 2 - 20 characters");
                checkValidation = false;
            }
            if (fullName.length() < 5 || fullName.length() > 40){
                userError.setFullNameError("Full name must be 5 - 40 charaters");
                checkValidation = false;
            }
            if (checkValidation){
                UserDTO newUser = new UserDTO(userID, fullName, password, roleID, address, email, avt);
                boolean checkInsert = dao.addUser(newUser);
                if (checkInsert){
                    MessageDTO message = new MessageDTO("success", "Manager", IconMessage.SUCCESS, "Add account " + userID + " successfully!");
                    request.setAttribute("MESSAGE", message);
                    url = SUCCESS;
                } else {
                    userError.setError("Unknow error.");
                    request.setAttribute("USER_ERROR", userError);
                    request.setAttribute("TYPE", type);
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
                request.setAttribute("TYPE", type);
            }
            
        } catch (Exception e) {
            log("Error at AddUserController: " + e.toString());
            if (e.toString().contains("duplicate")){
                userError.setUserIDError("User ID already exist.");
                request.setAttribute("USER_ERROR", userError);
                request.setAttribute("TYPE", type);
            }
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
