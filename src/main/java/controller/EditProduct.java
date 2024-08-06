package controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import constant.viewPages;
import model.Product;
import service.ProductDao;

/**
 * Servlet implementation class EditProduct
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/edit" })
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDao productDao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	
    public EditProduct() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	try {
			productDao = new ProductDao();
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
		request.getRequestDispatcher(viewPages.EDIT_PRODUCT).forward(request, response);
	}

	/**
	 * @throws ServletException 
	 * @throws IOException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		// TODO Auto-generated method stub
		int productId = Integer.parseInt(request.getParameter("productid"));
		System.out.println(productId);
			Product product;
			try {
				product = productDao.getProductUsingId(productId);
				request.setAttribute("product", product);
				request.getRequestDispatcher(viewPages.EDIT_PRODUCT).forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println(e);
			}
	}
	
	public static byte[] convertPartToByteArray(Part part) throws IOException {  // Throw IOException
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];  // Buffer for read/write operations
        int bytesRead;

        try (InputStream inputStream = part.getInputStream()) {
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                byteArrayOutputStream.write(buffer, 0, bytesRead);  // Write read data to ByteArrayOutputStream
            }
        }

        return byteArrayOutputStream.toByteArray();  // Return the byte array
    }
	
	}

