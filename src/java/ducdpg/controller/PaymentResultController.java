/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package ducdpg.controller;

import ducdpg.email.BillEmail;
import ducdpg.email.Email;
import ducdpg.message.IconMessage;
import ducdpg.message.MessageDTO;
import ducdpg.payment.PaymentDTO;
import ducdpg.products.ProductDAO;
import ducdpg.products.ProductDTO;
import ducdpg.shopping.Cart;
import ducdpg.shopping.OrderDAO;
import ducdpg.users.UserDTO;
import ducdpg.utils.Utils;
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
@WebServlet(name="PaymentResultController", urlPatterns={"/PaymentResultController"})
public class PaymentResultController extends HttpServlet {
    private static final String SUCCESS = "payment-success.jsp"; 
    private static final String ERROR = "payment-failure.jsp"; 

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            long vnp_Amount = Integer.parseInt(request.getParameter("vnp_Amount"));
            String vnp_BankCode = request.getParameter("vnp_BankCode");
            String vnp_BankTranNo = request.getParameter("vnp_BankTranNo");
            String vnp_CardType = request.getParameter("vnp_CardType");
            String vnp_PayDate = request.getParameter("vnp_PayDate");
            String vnp_OrderInfo = request.getParameter("vnp_OrderInfo");
            String vnp_TransactionNo = request.getParameter("vnp_TransactionNo");
            String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
            String vnp_TxnRef = request.getParameter("vnp_TxnRef");
            PaymentDTO payment = new PaymentDTO(vnp_Amount, vnp_BankCode, vnp_BankTranNo, vnp_CardType, vnp_PayDate, vnp_OrderInfo, vnp_TransactionNo, vnp_ResponseCode, vnp_TxnRef);
            request.setAttribute("PAYMENT", payment);
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            Cart cart = (Cart)session.getAttribute("CHECKOUT");
            ProductDAO pDao = new ProductDAO();
            OrderDAO oDao = new OrderDAO();
            // send email
            String userName = loginUser.getFullName();
            String userAddr = loginUser.getAddress();
            String userEmail = loginUser.getEmail();
            String payment_method = "VNPAY";
            String amount_paid = Utils.formatNumber(vnp_Amount/100);
            String payment_date = Utils.formatDate(vnp_PayDate);
            String billEmail = BillEmail.billEmail(vnp_TxnRef, userName, userAddr, userEmail, payment_method, payment_date, amount_paid);
            //--------------------
            if (vnp_ResponseCode.equals("00")){
                boolean updateOrder = oDao.updateOrder(vnp_TxnRef, vnp_PayDate, "SUCCESS");
                boolean sendMail = Email.sendEmail(userEmail, "Invoice #"+vnp_TxnRef, billEmail);
                if (updateOrder) {
                    if (!sendMail){
                        MessageDTO message = new MessageDTO("error", "My cart", IconMessage.ERROR, "There was an error in sending the email.");
                        request.setAttribute("MESSAGE", message);
                    }
                    url = SUCCESS;
                }
                    
            } else {
                if (cart != null) {
                    for (ProductDTO product: cart.getCart().values()) {
                        pDao.refundQuantity(product);
                    }
                }
                if (vnp_ResponseCode.equals("24")) {
                    boolean updateOrder = oDao.updateOrder(vnp_TxnRef, vnp_PayDate, "CANCELLED");
                }
            }
        } catch (Exception e) {
            log("Error at PaymentResultController: " + e.toString());
        } finally {
            HttpSession session = request.getSession();
            session.setAttribute("CHECKOUT", null);
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
