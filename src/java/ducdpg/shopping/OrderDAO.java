/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ducdpg.shopping;

import ducdpg.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 *
 * @author giadu
 */
public class OrderDAO {
    
    private static final String ADD_ORDER = "INSERT INTO tblOrders(orderCode, userID, order_date, total, status, payment_method) "
            + "VALUES(?,?,?,?,?,?) ";
    private static final String UPDATE_ORDER = "UPDATE tblOrders SET payment_date=?, status=? WHERE orderCode=?";


    public int addOrder(OrderDTO order) throws SQLException {
        // get current time
        java.sql.Date order_date = new java.sql.Date(order.getOrderDate().getTime());
        
        int lastInsertID = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet generatedKeys = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(ADD_ORDER, Statement.RETURN_GENERATED_KEYS);
            ptm.setString(1, order.getOrderCode());
            ptm.setString(2, order.getUserID());
            ptm.setDate(3, order_date);
            ptm.setInt(4, order.getTotal());
            ptm.setString(5, order.getStatus());
            ptm.setString(6, order.getPayment_method());
            
            int rowsAffected = ptm.executeUpdate();
            if (rowsAffected > 0) {
                generatedKeys = ptm.getGeneratedKeys();
                if (generatedKeys.next()) {
                    lastInsertID = generatedKeys.getInt(1);
                }
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (generatedKeys != null) generatedKeys.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return lastInsertID;
    }
    
    public boolean updateOrder(String vnp_TxnRef, String vnp_PayDate, String status) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
                LocalDateTime dateTime = LocalDateTime.parse(vnp_PayDate, formatter);
                java.sql.Timestamp timestamp = java.sql.Timestamp.valueOf(dateTime);

                ptm = conn.prepareStatement(UPDATE_ORDER);
                ptm.setObject(1, timestamp);
                ptm.setString(2, status);
                ptm.setString(3, vnp_TxnRef);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }
    
}
