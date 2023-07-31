/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ducdpg.shopping;

import ducdpg.users.UserDTO;
import ducdpg.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author giadu
 */
public class OrderDAO {
    
    private static final String ADD_ORDER = "INSERT INTO tblOrders(orderCode, userID, order_date, total, status, payment_method) "
            + "VALUES(?,?,?,?,?,?) ";
    private static final String UPDATE_ORDER = "UPDATE tblOrders SET payment_date=?, status=? WHERE orderCode=?";
    
    private static final String GET_ALL = "SELECT orderCode, userID, order_date, total, payment_method, payment_date, status FROM tblOrders ORDER BY order_date desc";
    
    private static final String SEARCH = "SELECT orderCode, userID, order_date, total, payment_method, payment_date, status FROM tblOrders WHERE userID= ? ORDER BY order_date desc";
    
    private static final String UPDATE_STATUS = "UPDATE tblOrders SET payment_date=?, status=? WHERE orderCode=?";




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

    public List<OrderDTO> getAllOrder() throws SQLException {
        List<OrderDTO> order = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_ALL);
            rs = ptm.executeQuery();
            while (rs.next()){
                String orderCode = rs.getString("orderCode");
                String userID = rs.getString("userID");
                Date order_date = rs.getDate("order_date");
                int total = rs.getInt("total");
                String payment_method = rs.getString("payment_method");
                Date payment_date = rs.getDate("payment_date");
                String status = rs.getString("status");
                order.add(new OrderDTO(orderCode, userID, order_date, total, status, payment_method, payment_date));
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return order;
    }

    public List<OrderDTO> searchByUserID(String search) throws SQLException {
        List<OrderDTO> order = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SEARCH);
            ptm.setString(1, search);
            rs = ptm.executeQuery();
            while (rs.next()){
                String orderCode = rs.getString("orderCode");
                String userID = rs.getString("userID");
                Date order_date = rs.getDate("order_date");
                int total = rs.getInt("total");
                String payment_method = rs.getString("payment_method");
                Date payment_date = rs.getDate("payment_date");
                String status = rs.getString("status");
                order.add(new OrderDTO(orderCode, userID, order_date, total, status, payment_method, payment_date));
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return order;
    }

    public boolean updateStatus(String orderCode) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        Timestamp payment_date = new Timestamp(System.currentTimeMillis());
        String status = "COMPLETED";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                
                ptm = conn.prepareStatement(UPDATE_STATUS);
                ptm.setTimestamp(1, payment_date);
                ptm.setString(2, status);
                ptm.setString(3, orderCode);
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
