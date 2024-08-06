package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import constant.viewPages;
import model.Address;
import service.AddressDao;

/**
 * Servlet implementation class ShippinAddress
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/address" })
public class ShippinAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AddressDao dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShippinAddress() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	try {
			dao = new AddressDao();
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
		request.getRequestDispatcher(viewPages.SHIPPING_ADDRESS).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String street = request.getParameter("street");
		String city = request.getParameter("city");
		String zipcode = request.getParameter("zipcode");
		HttpSession session = request.getSession(false);
		
		String username = (String) session.getAttribute("username");
		
		Address address = new Address();
		address.setStreet(street);
		address.setCity(city);
		address.setZipcode(zipcode);
		try {
			boolean isSuccess = dao.editAddress(address, username);
			if(isSuccess){
				request.getRequestDispatcher(viewPages.PROFILE_PAGE).forward(request, response);
			}
		}
		 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
	}

}
