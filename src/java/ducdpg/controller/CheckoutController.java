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
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name="CheckoutController", urlPatterns={"/CheckoutController"})
public class CheckoutController extends HttpServlet {
    private static final String SUCCESS = "checkout.jsp";
    private static final String ERROR = "viewCart.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            ProductDAO pDao = new ProductDAO();
            if (session != null){
                session.setAttribute("CurrentPage", "CheckoutController");
                Cart cart = (Cart)session.getAttribute("CART");
                ProductDTO productTravesal = new ProductDTO();
                if (cart != null){
                    List<ProductDTO> listError = new ArrayList<>();
                        int totalCart = 0;
                        for (ProductDTO product : cart.getCart().values()) {
                            productTravesal = pDao.getProductUnavaiable(product);
                            if (productTravesal != null){
                                listError.add(productTravesal);
                            }
                            totalCart += (product.getPrice() * product.getQuantity());
                        }
                        if (listError.size() > 0) {
                            MessageDTO message = new MessageDTO("error", "Checkout", IconMessage.ERROR, "Somethings error. Try again!");
                            request.setAttribute("MESSAGE", message);
                            request.setAttribute("PRODUCT_ERROR", listError);
                        }
                        session.setAttribute("CHECKOUT", cart);
                        request.setAttribute("TOTAL_CART", totalCart);
                        url = SUCCESS;
                }
            }
        } catch (Exception e){
            log("Error at CheckoutController: " + e.toString());
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
