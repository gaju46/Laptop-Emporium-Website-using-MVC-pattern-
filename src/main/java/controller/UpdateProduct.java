package controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import constant.viewPages;
import model.Product;
import service.ProductDao;

/**
 * Servlet implementation class UpdateProduct
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/update" })
@MultipartConfig
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDao dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProduct() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	try {
			dao=new ProductDao();
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String processor = request.getParameter("processor");
        String ram = request.getParameter("ram");
        String storage = request.getParameter("storage");
        String display = request.getParameter("display");
        String graphic = request.getParameter("graphic");
        int stock = Integer.parseInt(request.getParameter("stock"));
        String category = request.getParameter("category");
        Part imagePart = request.getPart("image");
        
        
        // Convert imagePart to a byte array
        byte[] imageByte = convertPartToByteArray(imagePart);

        // Create a new product object
        Product product = new Product();
        product.setName(name);
        product.setPrice(price);
        product.setProcessor(processor);
        product.setRam(ram);
        product.setStorage(storage);
        product.setDisplay(display);
        product.setGraphic(graphic);
        product.setStock(stock);
        product.setCategory(category);
        product.setImageUrlFromPart(imageByte);
		
        try {
			dao.editProduct(product);
			response.sendRedirect(request.getContextPath()+"/list");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
		doGet(request, response);
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
