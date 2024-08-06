package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import constant.viewPages;
import service.AdminDao;
import service.UserDao;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDao dao;
    private AdminDao adminDao;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
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
		try {
			adminDao=new AdminDao();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.getRequestDispatcher(viewPages.USER_LOGIN).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginForm = request.getParameter("submit");
		if(loginForm != null) {
			System.out.print("Login form");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String role = request.getParameter("role");
			HttpSession session = request.getSession();
			if(role.equals("admin")) {
				try {
					boolean isSuccess=adminDao.adminLogin(username, password);
					
					if(isSuccess) {
						session.setAttribute("username", username);
						session.setAttribute("role","admin");
						session.setMaxInactiveInterval(10*60);
						
						response.sendRedirect(request.getContextPath()+"/manager");

					}
					
					else {
						
						request.setAttribute("error", "Username or password not found");
						doGet(request, response);
						
					}
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}

			else if(role.equals("user")){
				try {
					//boolean isSuccess = dao.userLogin(username, password);
					boolean userExists = dao.checkUser(username);
					
					if(userExists) {
						if(dao.userLogin(username, password)) {
							
							session.setAttribute("username", username);
							session.setAttribute("role", "user");
							session.setMaxInactiveInterval(10*60);
							response.sendRedirect(request.getContextPath()+"/profile");
						}
						else {
							
								request.setAttribute("error", "Username or password not found");
								doGet(request, response);
							
						}
					}
					else {
						request.setAttribute("error", "User Account does not exist. Create one??");
						doGet(request, response);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		else {
				doGet(request, response);
		}
	}
}


