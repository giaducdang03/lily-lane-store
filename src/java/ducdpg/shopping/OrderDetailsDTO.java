/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ducdpg.shopping;

/**
 *
 * @author giadu
 */
public class OrderDetailsDTO {
    private int orderID;
    private String productID;
    private String price;
    private String quantity;

    public OrderDetailsDTO() {

    }

    public OrderDetailsDTO(int orderID, String productID, String price, String quantity) {
        this.orderID = orderID;
        this.productID = productID;
        this.price = price;
        this.quantity = quantity;
    }

    public int getOrderID() {
        return orderID;
    }

    public String getProductID() {
        return productID;
    }

    public String getPrice() {
        return price;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }
    
    
}
