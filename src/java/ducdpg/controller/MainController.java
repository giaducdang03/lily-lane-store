/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ducdpg.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author giadu
 */
public class MainController extends HttpServlet {
    
    private static final String NOT_FOUND = "notFound.html";
    
    private static final String HOME_CONTROLLER = "HomeController";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String CREATE_USER = "Sign Up";
    private static final String CREATE_USER_CONTROLLER = "CreateUserController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    // admin role
    private static final String SEARCH = "Search";
    private static final String SEARCH_USER_CONTROLLER = "SearchUserController";
    private static final String UPDATE_USER = "Update";
    private static final String UPDATE_USER_CONTROLLER = "UpdateUserController";
    private static final String DELETE_USER = "Delete";
    private static final String DELETE_USER_CONTROLLER = "DeleteUserController";
    private static final String ADD_USER = "AddUser";
    private static final String ADD_USER_CONTROLLER = "AddUserController";
    // shopping
    private static final String ADD_TO_CART = "ADD TO CART";
    private static final String ADD_TO_CART_CONTROLLER = "AddToCartController";
    private static final String VIEW_CART = "ViewCart";
    private static final String VIEW_CART_PAGE = "viewCart.jsp";
    private static final String UPDATE_CART = "UpdateCart";
    private static final String UPDATE_CART_CONTROLLER = "UpdateCartController";
    private static final String DELETE_CART = "DeleteCart";
    private static final String DELETE_CART_CONTROLLER = "DeleteCartController";
    private static final String CHECKOUT = "CHECKOUT";
    private static final String CHECKOUT_CONTROLLER = "CheckoutController";
    private static final String PAYMENT = "Payment";
    private static final String PAYMENT_CONTROLLER = "PaymentController";
    private static final String PAYMENT_RESULT = "PaymentResult";
    private static final String PAYMENT_RESULT_CONTROLLER = "PaymentResultController";


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME_CONTROLLER;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = HOME_CONTROLLER;
            } 
            else if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } 
            else if (CREATE_USER.equals(action)) {
                url = CREATE_USER_CONTROLLER;
            } 
            else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } 
            else if (SEARCH.equals(action)) {
                url = SEARCH_USER_CONTROLLER;
            }
            else if (UPDATE_USER.equals(action)) {
                url = UPDATE_USER_CONTROLLER;
            }
            else if (DELETE_USER.equals(action)) {
                url = DELETE_USER_CONTROLLER;
            }
            else if (ADD_TO_CART.equals(action)) {
                url = ADD_TO_CART_CONTROLLER;
            }
            else if (VIEW_CART.equals(action)) {
                url = VIEW_CART_PAGE;
            }
            else if (UPDATE_CART.equals(action)) {
                url = UPDATE_CART_CONTROLLER;
            }
            else if (DELETE_CART.equals(action)) {
                url = DELETE_CART_CONTROLLER;
            }
            else if (CHECKOUT.equals(action)) {
                url = CHECKOUT_CONTROLLER;
            }
            else if (PAYMENT.equals(action)) {
                url = PAYMENT_CONTROLLER;
            }
            else if (PAYMENT_RESULT.equals(action)) {
                url = PAYMENT_RESULT_CONTROLLER;
            }
            else {
                url = NOT_FOUND;
            } 
        } catch (Exception e){
            log("Error at MainController: " + e.toString());
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
