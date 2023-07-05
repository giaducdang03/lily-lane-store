/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ducdpg.products;

/**
 *
 * @author giadu
 */
public class ProductDTO {
    private String ID;
    private String name;
    private int price;
    private int quantity;
    private String img;
    
    public ProductDTO() {
        this.ID = "";
        this.name = "";
        this.price = 0;
        this.quantity = 0;
        this.img = "";
    }

    public ProductDTO(String ID, String name, int price, int quantity, String img) {
        this.ID = ID;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.img = img;
    }
    
    public String getID() {
        return ID;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getImg() {
        return img;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "ID=" + ID + ", name=" + name + ", price=" + price + ", quantity=" + quantity + ", img=" + img + '}';
    }
    
    
    
    
}
