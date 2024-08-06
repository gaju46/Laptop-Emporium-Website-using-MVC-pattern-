package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.viewPages;
import service.UserDao;

/**
 * Servlet implementation class EditUserDetail
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/userdetail" })
public class EditUserDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private UserDao dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserDetail() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	try {
			dao = new UserDao();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	super.init();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher(viewPages.EDIT_USER_DETAIL).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
