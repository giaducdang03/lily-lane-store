/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ducdpg.products;

import ducdpg.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author giadu
 */
public class ProductDAO {
    private static final String GET_LIST_PRODUCT = "SELECT productID, name, price, quantity, img FROM tblProducts";

    public List<ProductDTO> getListProduct() throws SQLException {
        List<ProductDTO> product = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LIST_PRODUCT);
            rs = ptm.executeQuery();
            while (rs.next()){
                String ID = rs.getString("productID");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                String img = rs.getString("img");
                if (quantity > 0) {
                    product.add(new ProductDTO(ID, name, price, quantity, img));
                }
//                product.add(new ProductDTO(ID, name, price, quantity, img));
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return product;
    }
}
