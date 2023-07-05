/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package ducdpg.controller;

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
@WebServlet(name="UpdateCartController", urlPatterns={"/UpdateCartController"})
public class UpdateCartController extends HttpServlet {
    private static final String SUCCESS = "viewCart.jsp";
    private static final String ERROR = "viewCart.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String productID = request.getParameter("productID");
            int newQuantity = Integer.parseInt(request.getParameter("quantity"));
            HttpSession session = request.getSession();
            if (session != null){
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart != null){
                    ProductDTO product = cart.getCart().get(productID);
                    ProductDAO pDao = new ProductDAO();
                    ProductDTO db_product = pDao.getBuyProductByID(productID);
                    if (newQuantity > db_product.getQuantity()){
                        MessageDTO message = new MessageDTO("error", "Cart", IconMessage.ERROR, "You can buy " + db_product.getQuantity() + " " + db_product.getName() + " now !");
                        request.setAttribute("MESSAGE", message);
                    } else {
                        product.setQuantity(newQuantity);
                        boolean check = cart.update(productID, product);
                        if (check){
                            session.setAttribute("CART", cart);
                            MessageDTO message = new MessageDTO("success", "Cart", IconMessage.SUCCESS, "Update your cart successfully.");
                            request.setAttribute("MESSAGE", message);
                            url = SUCCESS;
                        }
                    }
                    
                }
            }
        } catch (Exception e){
            log("Error at UpdateCartController: " + e.toString());
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
