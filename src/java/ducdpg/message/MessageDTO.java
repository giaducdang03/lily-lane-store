/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ducdpg.message;

/**
 *
 * @author giadu
 */
public class MessageDTO {
     private String type;
    private String title;
    private String icon;
    private String message;

    public MessageDTO() {
    }

    public MessageDTO(String type, String title, String icon, String message) {
        this.type = type;
        this.title = title;
        this.icon = icon;
        this.message = message;
    }
    

    public String getType() {
        return type;
    }

    public String getTitle() {
        return title;
    }

    public String getIcon() {
        return icon;
    }

    public String getMessage() {
        return message;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
