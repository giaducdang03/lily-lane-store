/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
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
@WebServlet(name="CreateUserController", urlPatterns={"/CreateUserController"})
public class CreateUserController extends HttpServlet {
    private static final String ERROR = "login.jsp";
    private static final String SUCCESS = "login.jsp";

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        UserDAO dao = new UserDAO();
        String type = "right";
        try {
            boolean checkValidation = true;
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            String email = request.getParameter("email");
            if (userID.length()<2 || userID.length() > 10){
                userError.setUserIDError("UserID must be 2 - 10 characters");
                checkValidation = false;
            }
            if (fullName.length() < 5 || fullName.length() > 40){
                userError.setFullNameError("Full name must be 5 - 40 charaters");
                checkValidation = false;
            }
            if (password.length() < 4){
                userError.setPasswordError("Password must be at least 4 characters");
                checkValidation = false;
            }
            if (!password.equals(confirm)){
                userError.setConfirmError("Those password dose not match");
                checkValidation = false;
            }
            if (checkValidation){
                UserDTO newUser = new UserDTO(userID, fullName, password, roleID, "", email);
                boolean checkInsert = dao.insert(newUser);
                if (checkInsert){
                    MessageDTO message = new MessageDTO("success", "Authen", IconMessage.SUCCESS, "Your account is ready. Try to Login.");
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
        } catch (Exception e){
            log("Error at CreateUserController: " + e.toString());
            if (e.toString().contains("duplicate")){
                userError.setUserIDError("Your input user ID already exist.");
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
