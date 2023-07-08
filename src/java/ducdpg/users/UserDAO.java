/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ducdpg.users;

import ducdpg.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author giadu
 */
public class UserDAO {
//    Default
    
    private static final String LOGIN = "SELECT fullName, roleID, address, email "
            + "FROM tblUsers "
            + "WHERE userID=? AND password=?";
    private static final String SEARCH = "SELECT userID, fullName, roleID, address, email "
            + "FROM tblUsers "
            + "WHERE fullName like ?";
    private static final String UPDATE = "UPDATE tblUsers SET fullName=?, roleID=? WHERE userID=?";
    private static final String DELETE = "DELETE tblUsers WHERE userID=?";
    private static final String ADD_USER = "INSERT INTO tblUsers (userID, fullName, roleID, password, email, status) "
            + "VALUES(?,?,?,?,?,?)";
    private static final String UPDATE_ADDRESS = "UPDATE tblUsers SET address=? WHERE userID=?";
    
//    Google
    private static final String LOGIN_GOOGLE = "SELECT userID, fullName, roleID, address, avatar "
            + "FROM tblUsers "
            + "WHERE googleID=? and email=?";
    private static final String INSERT_GOOGLE = "INSERT INTO tblUsers (userID, fullName, roleID, password, googleID, email, avatar, status) VALUES(?,?,?,?,?,?,?,?)";


    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(LOGIN);
            ptm.setString(1, userID);
            ptm.setString(2, password);
            rs = ptm.executeQuery();
            if (rs.next()){
                String fullName = rs.getString("fullName");
                String roleID = rs.getString("roleID");
                String address = rs.getString("address");
                String email = rs.getString("email");
                user = new UserDTO(userID, fullName, password, roleID, address, email);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return user;
    }

    public List<UserDTO> getListUser(String search) throws SQLException {
        List<UserDTO> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SEARCH);
            ptm.setString(1, "%"+search+"%");
            rs = ptm.executeQuery();
            while (rs.next()){
                String userID = rs.getString("userID");
                String fullName = rs.getString("fullName");
                String password = "***";
                String roleID = rs.getString("roleID");
                String address = rs.getString("address");
                String email = rs.getString("email");
                listUser.add(new UserDTO(userID, fullName, password, roleID, address, email));
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return listUser;
    }

    public boolean update(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, user.getFullName());
                ptm.setString(2, user.getRoleID());
                ptm.setString(3, user.getUserID());
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
    
    public boolean updateAddress(String userID, String newAddress) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_ADDRESS);
                ptm.setString(1, newAddress);
                ptm.setString(2, userID);
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

    public boolean delete(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, userID);
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
    
    public boolean insert(UserDTO newUser) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                ptm = conn.prepareStatement(ADD_USER);
                ptm.setString(1, newUser.getUserID());
                ptm.setString(2, newUser.getFullName());
                ptm.setString(3, newUser.getRoleID());
                ptm.setString(4, newUser.getPassword());
                ptm.setString(5, newUser.getEmail());
                ptm.setBoolean(6, true);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }
    

    public UserDTO checkLoginGoogle(String googleID, String email) throws ClassNotFoundException, SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(LOGIN_GOOGLE);
            ptm.setString(1, googleID);
            ptm.setString(2, email);
            rs = ptm.executeQuery();
            if (rs.next()){
                String userID = rs.getString("userID");
                String fullName = rs.getString("fullName");
                String roleID = rs.getString("roleID");
                String password = "******";
                String address = rs.getString("address");
                String avatar = rs.getString("avatar");
                user = new UserDTO(userID, fullName, password, roleID, address, googleID, email, avatar);
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return user;
    }

    public boolean insertGoogle(UserDTO newUser) throws ClassNotFoundException, SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_GOOGLE);
                ptm.setString(1, newUser.getUserID());
                ptm.setString(2, newUser.getFullName());
                ptm.setString(3, newUser.getRoleID());
                ptm.setString(4, newUser.getPassword());
                ptm.setString(5, newUser.getGoogleID());
                ptm.setString(6, newUser.getEmail());
                ptm.setString(7, newUser.getAvatar());
                ptm.setBoolean(8, true);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        }
            finally {
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }


    
}
