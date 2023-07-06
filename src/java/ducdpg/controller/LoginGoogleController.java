/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ducdpg.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import ducdpg.users.Constants;
import ducdpg.users.UserDAO;
import ducdpg.users.UserDTO;
import ducdpg.users.UserGoogleDTO;
import java.security.SecureRandom;
import javax.servlet.http.HttpSession;

/**
 *
 * @author giadu
 */
@WebServlet(name="LoginGoogleController", urlPatterns={"/LoginGoogleController"})
public class LoginGoogleController extends HttpServlet {
    private static final String LOGIN_PAGE = "login.jsp";
    private static final String US = "US";
    private static final String USER_PAGE = "user.jsp";
    private static final String AD = "AD";
    private static final String ADMIN_PAGE = "admin.jsp";
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String code = request.getParameter("code");
            String accessToken = getToken(code);
            UserGoogleDTO userGoogle = getUserInfo(accessToken);
            String googleID = userGoogle.getId();
            String email = userGoogle.getEmail();
            HttpSession session = request.getSession();
            String currentPage = (String) session.getAttribute("CurrentPage");
            UserDAO dao = new UserDAO();
            
            UserDTO loginUserGoogle = dao.checkLoginGoogle(googleID, email);
            
            if (loginUserGoogle == null) {
                String tmp[] = userGoogle.getEmail().split("@");
                String userID = tmp[0];
                String fullName = userGoogle.getName();
                String password = getRandomNumber(6);
                String roleID = "US";
                String avatar = userGoogle.getPicture();
                UserDTO newUser = new UserDTO(userID, fullName, password, roleID, "", googleID, email, avatar);
                boolean checkInsert = dao.insertGoogle(newUser);
                if (checkInsert) {
                    session = request.getSession();
                    newUser.setPassword("******");
                    session.setAttribute("LOGIN_USER", newUser);
                    url = USER_PAGE;
                }
            } else {
                session = request.getSession();
                session.setAttribute("LOGIN_USER", loginUserGoogle);
                String roleID = loginUserGoogle.getRoleID();
                if (AD.equals(roleID)){
                    url = ADMIN_PAGE;
                } else if (US.equals(roleID)){
                    if (currentPage != null) {
                        url = currentPage;
                        session.setAttribute("CurrentPage", null);
                    } else {
                        url = USER_PAGE;
                    }
                } else {
                    request.setAttribute("ERROR", "Your role is not support");
                    url = LOGIN_PAGE;
                }
            }
            
        } catch (Exception e){
            log("Error at LoginGoogleController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
        
    }
    
    public static String getToken(String code) throws ClientProtocolException, IOException {
		// call api to get token
		String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
				.bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
						.add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
						.add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
						.add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
				.execute().returnContent().asString();

		JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
		String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
		return accessToken;
	}

	public static UserGoogleDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
		String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
		String response = Request.Get(link).execute().returnContent().asString();

		UserGoogleDTO googlePojo = new Gson().fromJson(response, UserGoogleDTO.class);

		return googlePojo;
	}
        
        public static String getRandomNumber(int len) {
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(len);
        String chars = "0123456789";
        for (int i = 0; i < len; i++) {
            int randomIndex = random.nextInt(chars.length());
            char randomChar = chars.charAt(randomIndex);
            sb.append(randomChar);
        }
        return sb.toString();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
