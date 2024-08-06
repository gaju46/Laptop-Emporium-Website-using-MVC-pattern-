package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Address;
import model.Product;
import utils.DatabaseConnection;

public class AddressDao {
	private Connection conn;
    private PreparedStatement st;
    private ResultSet resultSet;
    
    public AddressDao() throws ClassNotFoundException, SQLException {
        conn = DatabaseConnection.getDatabaseConnection(); 
    }

    

    public boolean editAddress(Address address, String username) throws SQLException {
		st = conn.prepareStatement("select username from address where username=?");
		
		st.setString(1, username);
		resultSet = st.executeQuery();
		boolean isSuccess;
		
		
		
		if (resultSet.next()) {

			String updateQuery = "UPDATE address SET street=?,city=?,zipcode=? where username =?";
			st = conn.prepareStatement(updateQuery);
			st.setString(1, address.getStreet());
			st.setString(2, address.getCity());
			st.setString(3, address.getZipcode());
	        st.setString(4, username);
			
			int rowsAffected = st.executeUpdate();
			
			if(rowsAffected>0) {
				isSuccess= true;
			} else {
				isSuccess = false;
			}
	} else {
		String insertQuery = "Insert into address (username,street,city,zipcode) values (?,?,?,?)";
		st = conn.prepareStatement(insertQuery);
		st.setString(1, username);
		st.setString(2, address.getStreet());
		st.setString(3, address.getCity());
		st.setString(4, address.getZipcode());
        
		
		int rowsAffected = st.executeUpdate();
		
		if(rowsAffected>0) {
			isSuccess= true;
		} else {
			isSuccess = false;
		}
	}
		return isSuccess;
}

   

	public Product getAddressUsingUsername(String username) throws SQLException {
		List<Address> addresses =  getAddress();
		
		for (Address address : addresses) {
	        if (address.getUsername() == username) {
	        	
	        }
	    }
		return null;
	}



	private List<Address> getAddress() throws SQLException {
		// TODO Auto-generated method stub
		List<Address> addresses = new ArrayList<Address>();
		st = conn.prepareStatement("select * from address");
		resultSet = st.executeQuery();
		
		while (resultSet.next()) {
			Address address = new Address();
			int id=resultSet.getInt("addressId");
			String username = resultSet.getString("username");
			String street = resultSet.getString("street");
			String city = resultSet.getString("city");
			String zipcode = resultSet.getString("zipcode");

			address.setAddressId(id);
			address.setUsername(username);
			address.setStreet(street);
			address.setCity(city);
			address.setZipcode(zipcode);
			
			addresses.add(address);
		}
		return null;
	}
	
	
	
}
