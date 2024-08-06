package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.viewPages;
import model.Product;
import service.ProductDao;

/**
 * Servlet implementation class SearchProduct
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/search" })
public class SearchProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDao dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	try {
			dao = new ProductDao();
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
		
		String searchKey = request.getParameter("search");

		List<Product> products;
		try {
			
			products = dao.serachProducts(searchKey);
			request.setAttribute("keyword", searchKey);
			request.setAttribute("products", products);
			request.getRequestDispatcher(viewPages.SEARCH_PAGE).forward(request, response);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
