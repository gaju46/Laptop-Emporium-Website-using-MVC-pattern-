package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import constant.viewPages;
import model.User;
import service.UserDao;

/**
 * Servlet implementation class UserProfile
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/profile" })
public class UserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		try {
			dao = new UserDao();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
    public UserProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		HttpSession session = request.getSession(false);
		String username = (String) session.getAttribute("username");
		
		
		  try {
			 List<User> users = new ArrayList<User>();
		  User user = new User();
		  users = dao.getAllUser();
		  for (User usera: users) {
			  if (usera.getUsername().equals(username)) {
				  user = usera;
			  }
		  }
		  request.setAttribute("user", user);
		 request.getRequestDispatcher(viewPages.PROFILE_PAGE).forward(request,
		  response);
		  
		  } catch (SQLException e) { // TODO Auto-generated catch block
		  System.out.println(e); e.printStackTrace(); }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
