package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.io.ByteArrayOutputStream; // Correct import for ByteArrayOutputStream
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.Product;
import service.ProductDao;
import constant.viewPages;

/**
 * Servlet implementation class ProductManage
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/manage" })
@MultipartConfig
public class ProductManage extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDao dao;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductManage() {
        super();
    }

    @Override
    public void init() throws ServletException {
        super.init();
        try {
			dao = new ProductDao();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest, HttpServletResponse)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(viewPages.PRODUCT_MANAGE_PAGE).forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest, HttpServletResponse)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            boolean isSaved = dao.setProduct(product);  // Save the product
            if (isSaved) {
                doGet(request, response);  // If saved, go back to manage page
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Print stack trace for errors
            System.out.println(e);  // Additional error output
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
