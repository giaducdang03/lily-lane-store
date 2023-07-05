/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ducdpg.shopping;

import java.util.Date;

/**
 *
 * @author giadu
 */
public class OrderDTO {
    private String orderCode;
    private String userID;
    private Date orderDate;
    private int total;
    private String status;
    private String payment_method;
    private Date payment_date;

    public OrderDTO() {
        
    }

    public OrderDTO(String orderCode, String userID, Date orderDate, int total, String status, String payment_method, Date payment_date) {
        this.orderCode = orderCode;
        this.userID = userID;
        this.orderDate = orderDate;
        this.total = total;
        this.status = status;
        this.payment_method = payment_method;
        this.payment_date = payment_date;
    }
    
    public OrderDTO(String orderCode, String userID, int total, String status, String payment_method) {
        this.orderCode = orderCode;
        this.userID = userID;
        this.total = total;
        this.status = status;
        this.payment_method = payment_method;
    }

    public String getOrderCode() {
        return orderCode;
    }

    public String getUserID() {
        return userID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public int getTotal() {
        return total;
    }

    public String getStatus() {
        return status;
    }

    public String getPayment_method() {
        return payment_method;
    }

    public Date getPayment_date() {
        return payment_date;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

    public void setPayment_date(Date payment_date) {
        this.payment_date = payment_date;
    }

    @Override
    public String toString() {
        return "OrderDTO{" + "orderCode=" + orderCode + ", userID=" + userID + ", orderDate=" + orderDate + ", total=" + total + ", status=" + status + ", payment_method=" + payment_method + ", payment_date=" + payment_date + '}';
    }
    
}
