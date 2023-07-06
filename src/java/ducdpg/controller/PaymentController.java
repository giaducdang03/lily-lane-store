/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package ducdpg.controller;

import ducdpg.email.BillEmail;
import ducdpg.email.Email;
import ducdpg.message.IconMessage;
import ducdpg.message.MessageDTO;
import ducdpg.payment.Config;
import ducdpg.products.ProductDAO;
import ducdpg.products.ProductDTO;
import ducdpg.shopping.Cart;
import ducdpg.shopping.OrderDAO;
import ducdpg.shopping.OrderDTO;
import ducdpg.shopping.OrderDetailsDAO;
import ducdpg.users.UserDAO;
import ducdpg.users.UserDTO;
import ducdpg.utils.Utils;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
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
@WebServlet(name="PaymentController", urlPatterns={"/PaymentController"})
public class PaymentController extends HttpServlet {
    private static final String VNPAY = "VNPAY";
    private static final String COD = "COD";
    private static final String SUCCESS = "payment-success.jsp";
    private static final String ERROR = "payment-error.jsp";
    private static final String PENDING = "payment-pending.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String userID = loginUser.getUserID();
            String userAddress = loginUser.getAddress();
            String userEmail = loginUser.getEmail();
            String orderCode = Config.getRandomNumber(6);
            String payment_method = request.getParameter("payment-method").toUpperCase();
            String sTotal = request.getParameter("totalPayment");
            Date orderDate = new Date();
            int total_payment = Integer.parseInt(sTotal);
            // address
            UserDAO uDao = new UserDAO();
            if (userAddress == null) {
                String newAddress = request.getParameter("address");
                boolean checUpdatetAddr = uDao.updateAddress(userID, newAddress);
                if (checUpdatetAddr){
                    loginUser.setAddress(newAddress);
                    session.setAttribute("LOGIN_USER", loginUser);
                }
            }
            //------
            //send Email
            String customer = loginUser.getFullName();
            String address = loginUser.getAddress();
            String amount_paid = Utils.formatNumber(total_payment);
            String billEmail = BillEmail.billEmail(orderCode, customer, address, userEmail, payment_method, "-", amount_paid);
            //-----------
            Cart cart = (Cart) session.getAttribute("CHECKOUT");
            String payment_status = "PENDING";
            OrderDTO newOrder = new OrderDTO(orderCode, userID, orderDate, total_payment, "PENDING", payment_method);
            OrderDAO oDao = new OrderDAO();
            ProductDAO pDao = new ProductDAO();
            int lastInsertID = oDao.addOrder(newOrder);
            boolean checkInsert = false;
            boolean checkUpdateQuantity = false;
            if (lastInsertID > 0){
                OrderDetailsDAO oDao2 = new OrderDetailsDAO();
                if (cart != null){
                    for (ProductDTO product : cart.getCart().values()) {
                        checkInsert = oDao2.insert(product, lastInsertID);
                        checkUpdateQuantity = pDao.updateQuantity(product);
                    }
                }
            }
            if (checkInsert && checkUpdateQuantity){
                if (COD.equals(payment_method)){
                    request.setAttribute("ORDER", newOrder);
                    session.setAttribute("CART", null);
                    session.setAttribute("CHECKOUT", null);
                    boolean sendEmail = Email.sendEmail(userEmail, "Invoice #"+orderCode, billEmail);
                    if (!sendEmail) {
                        MessageDTO message = new MessageDTO("error", "Send email", IconMessage.ERROR, "There was an error in sending the email.");
                        request.setAttribute("MESSAGE", message);
                    }
                    url = PENDING;
                    request.getRequestDispatcher(url).forward(request, response);
                }
                if (VNPAY.equals(payment_method)){
                    url = vnpay_payment(orderCode, total_payment, request, response);
                    session.setAttribute("CART", null);
                    response.sendRedirect(url);
                }
            }
            
        } catch (Exception e){
            log("Error at PaymentController: " + e.toString());
        }
        
    }
    private String vnpay_payment (String paymentCode, int price, HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException, IOException {
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "100";
        long amount = price*100;
        String bankCode = "";
        
        String vnp_TxnRef = paymentCode;
        String vnp_IpAddr = Config.getIpAddress(req);
        String vnp_TmnCode = Config.vnp_TmnCode;
        
        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        
        if (bankCode != null && !bankCode.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bankCode);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = req.getParameter("language");
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_Returnurl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
        
        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);
        
        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.vnp_HashSecret, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
        return paymentUrl;
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
