package service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.xdevapi.Statement;

import model.Product;
import utils.DatabaseConnection;
public class ProductDao {

	private Connection conn;
	private PreparedStatement st;
	private ResultSet set;
	private boolean isSaved;
	private boolean isUpdated;
	
	
	public ProductDao() throws ClassNotFoundException, SQLException {
		conn = DatabaseConnection.getDatabaseConnection();
	}
	public List<Product> getProduct() throws SQLException {
		List<Product> products = new ArrayList<Product>();
		st = conn.prepareStatement("select * from product");
		set = st.executeQuery();
		while (set.next()) {
			Product product = new Product();
			int id=set.getInt("product_id");
			String name = set.getString("name");
			int price = set.getInt("price");
			String processor = set.getString("processor");
			String ram = set.getString("ram");
			String storage = set.getString("storage");
			String display = set.getString("display");
			String graphic = set.getString("graphic");
			int stock = set.getInt("stock");
			String category = set.getString("category");
			byte[] imagePart = set.getBytes("url");
			
			product.setName(name);
			product.setProductId(id);
			product.setPrice(price);
			product.setProcessor(processor);
			product.setRam(ram);
			product.setStorage(storage);
			product.setDisplay(display);
			product.setGraphic(graphic);
			product.setStock(stock);
			product.setCategory(category);
			product.setImageUrlFromPart(imagePart);
			products.add(product);
	
		}
		return products;
	}
	public boolean editProduct(Product product) throws SQLException{
		isUpdated = false;
		
		String updateQuery = "UPDATE product SET name=?,price=?,processor=?,ram=?,storage=?,display=?,graphic=?,stock=?,url=?,category=? where product_id =?";

		st.setString(1, product.getName());
        st.setInt(2, product.getPrice());
        st.setString(3, product.getProcessor());
        st.setString(4, product.getRam());
        st.setString(5, product.getStorage());
        st.setString(6, product.getDisplay());
        st.setString(7, product.getGraphic());
        st.setInt(8, product.getStock());
        st.setString(9, product.getCategory());
        st.setBytes(10, product.getImageUrlFromPart());
        st.setInt(11, product.getProductId());
		
		st = conn.prepareStatement(updateQuery);
		
		int rowsAffected = st.executeUpdate();
		
		if(rowsAffected>0) {
			isUpdated= true;
			
		}
		else {
			isUpdated =false;
		}
		
		return isUpdated;
	
	}
	public Product getProductUsingId(int productId) throws SQLException {
	    List<Product> products =  getProduct();// Ideally, this list should be populated with existing products
	    
	    for (Product product : products) {
	        if (product.getProductId() == productId) {
	        	
	            return product; // Return early when you find the matching product
	        }
	    }

	    return null; // Return null or throw an exception if no matching product is found
	}

	 public boolean deleteProduct(int productId) throws SQLException {
	        boolean isDeleted = false;
	        st = conn.prepareStatement("DELETE FROM product WHERE product_id = ?");
	        st.setInt(1, productId);

	        int rowsAffected = st.executeUpdate();

	        if (rowsAffected > 0) {
	            isDeleted = true;
	        }
	        return isDeleted;
	    }
	 
	public boolean setProduct(Product product) throws SQLException {
		String name = product.getName();
		int price = product.getPrice();
		String processor = product.getProcessor();
		String ram = product.getRam();
		String storage = product.getStorage();
		String display = product.getDisplay();
		String graphic = product.getGraphic();
		int stock = product.getStock();
		String category = product.getCategory();
		byte[] imagePart = product.getImageUrlFromPart();
		int row = 0;
		
		st = conn.prepareStatement("insert into product (name,price,processor,ram,storage,display,graphic,stock,category,url) values (?,?,?,?,?,?,?,?,?,?)");
		st.setString(1, name);
		st.setInt(2, price);
		st.setString(3, processor);
		st.setString(4, ram);
		st.setString(5, storage);
		st.setString(6, display);
		st.setString(7, graphic);
		st.setInt(8, stock);
		st.setString(9, category);
		st.setBytes(10, imagePart);
		
		row = st.executeUpdate();
		if(row>0) {
			isSaved = true;
		}
		else {
			isSaved = false;
		}
		
		return isSaved;
	}
	
	public List<Product> serachProducts(String searchName) throws SQLException{
		List<Product> products = new ArrayList<>();
		st = conn.prepareStatement("SELECT * FROM product WHERE name LIKE ? OR price LIKE ?");
		
		
		st.setString(1,searchName);
		st.setString(2,searchName);
		set = st.executeQuery();
		Product product = new Product();
		while(set.next()) {
			
			product.setProductId(set.getInt("product_id"));
			product.setName(set.getString("name"));
			product.setPrice(set.getInt("price"));
			product.setStock(set.getInt("stock"));
			product.setProcessor(set.getString("processor"));
			product.setRam(set.getString("ram"));
			product.setStorage(set.getString("storage"));
			product.setDisplay(set.getString("display"));
			product.setGraphic(set.getString("graphic"));
			product.setImageUrlFromPart(set.getBytes("url"));
			
			products.add(product);
			
		}
		return products;
	}
	
	
	
	
}
