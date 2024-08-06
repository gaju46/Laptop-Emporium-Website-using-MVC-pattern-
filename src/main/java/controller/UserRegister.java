package controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.viewPages;
import model.User;
import service.UserDao;
import utils.PasswordHash;

/**
 * @author Dipesh
 * Servlet implementation class UserRegister
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			dao = new UserDao();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.getRequestDispatcher(viewPages.USER_REGISTER).forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String username = request.getParameter("username");
		Date birthday = null;
		try {
			birthday = new java.sql.Date(
					new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("birthday")).getTime());
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		long phoneNumber = Long.parseLong(request.getParameter("phoneNumber"));
		String password = request.getParameter("password");
		String reTypePassword = request.getParameter("retypePassword");
		System.out.println(password);
		System.out.println(reTypePassword);
		if (!password.equals(reTypePassword)) {
			request.setAttribute("error", "not matched");
			request.getRequestDispatcher(viewPages.USER_REGISTER).forward(request, response);
		}
		
		else {
			User user = new User();
			user.setFirstName(firstName);
			user.setLastName(lastName);
			user.setUsername(username);
			user.setBirthday(birthday);
			user.setGender(gender);
			user.setEmail(email);
			user.setPhoneNumber(phoneNumber);
			user.setPassword(PasswordHash.getPasswordHash(password));
			
				if (dao.saveUser(user)) {
					
					response.sendRedirect(request.getContextPath()+"/login");
					
				} else {
					request.setAttribute("error", "username or email or phonenumber exist");
					request.getRequestDispatcher(viewPages.USER_REGISTER).forward(request, response);
				}
			
		}
	}

}
