/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ducdpg.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import ducdpg.message.IconMessage;
import ducdpg.message.MessageDTO;
import ducdpg.products.ProductDAO;
import ducdpg.products.ProductDTO;
import ducdpg.shopping.Cart;
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
@WebServlet(name="AddToCartController", urlPatterns={"/AddToCartController"})
public class AddToCartController extends HttpServlet {
    private static final String SUCCESS = "HomeController";
    private static final String ERROR = "HomeController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // response.setContentType("text/html;charset=UTF-8");
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        String url = ERROR;
        try {
            String productID = request.getParameter("productID");
            int quantity = 1;
            ProductDAO dao = new ProductDAO();
            ProductDTO buyProduct = dao.getBuyProduct(productID, quantity);
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart == null){
                cart = new Cart();
            }
            cart.add(productID, buyProduct);
            session.setAttribute("CART", cart);
            // url = SUCCESS;
           
//            MessageDTO message = new MessageDTO("success", "My cart", IconMessage.SUCCESS, "Add " + quantity + " " + buyProduct.getName() + " successfully.");
            PrintWriter out = response.getWriter();

              out.print("Add " + quantity + " " + buyProduct.getName() + " successfully.");
              
        } catch (Exception e){
            log("Error at AddToCartController: " + e.toString());
            PrintWriter out = response.getWriter();
            out.print("Somethings error");
        } finally {
//            request.getRequestDispatcher(url).forward(request, response);
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
