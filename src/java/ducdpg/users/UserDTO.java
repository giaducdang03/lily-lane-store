/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ducdpg.users;

/**
 *
 * @author giadu
 */
public class UserDTO {
    private String userID;
    private String fullName;
    private String password;
    private String roleID;
    private String address;
    private String googleID;
    private String email;
    private String avatar;

    public UserDTO() {
        this.userID = "";
        this.fullName = "";
        this.password = "";
        this.roleID = "";
        this.address = "";
        this.googleID = "";
        this.email = "";
    }

    public UserDTO(String userID, String fullName, String password, String roleID, String address, String googleID, String email, String avatar) {
        this.userID = userID;
        this.fullName = fullName;
        this.password = password;
        this.roleID = roleID;
        this.address = address;
        this.googleID = googleID;
        this.email = email;
        this.avatar = avatar;
    }
    
    public UserDTO(String userID, String fullName, String password, String roleID, String address, String email, String avatar) {
        this.userID = userID;
        this.fullName = fullName;
        this.password = password;
        this.roleID = roleID;
        this.address = address;
        this.email = email;
        if (avatar == null || avatar.isEmpty()) {
            this.avatar = "";
        } else {
            this.avatar = avatar;
        }
    }
    
    public UserDTO(String userID, String fullName, String password, String roleID, String address, String email) {
        this.userID = userID;
        this.fullName = fullName;
        this.password = password;
        this.roleID = roleID;
        this.address = address;
        this.email = email;
    }
    
    public UserDTO(String userID, String fullName, String roleID) {
        this.userID = userID;
        this.fullName = fullName;
        this.roleID = roleID;
    }

    public String getUserID() {
        return userID;
    }

    public String getFullName() {
        return fullName;
    }

    public String getPassword() {
        return password;
    }

    public String getRoleID() {
        return roleID;
    }

    public String getAddress() {
        return address;
    }

    public String getGoogleID() {
        return googleID;
    }

    public String getEmail() {
        return email;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setGoogleID(String googleID) {
        this.googleID = googleID;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getAvatar() {
        return avatar;
    }
    
}
