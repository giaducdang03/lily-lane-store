/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ducdpg.shopping;

import ducdpg.products.ProductDTO;
import ducdpg.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author giadu
 */
public class OrderDetailsDAO {
    
    private static final String INSERT = "INSERT INTO tblOrderDetails (orderID, productID, price, quantity) VALUES(?,?,?,?)";


    public boolean insert(ProductDTO product, int orderID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setInt(1, orderID);
                ptm.setString(2, product.getID());
                ptm.setInt(3, product.getPrice());
                ptm.setInt(4, product.getQuantity());
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
