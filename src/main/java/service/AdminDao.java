package service;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DatabaseConnection;

public class AdminDao {
	private Connection conn;
    private PreparedStatement statement;
    private ResultSet resultSet;
    
    public AdminDao() throws ClassNotFoundException, SQLException {
        conn = DatabaseConnection.getDatabaseConnection(); 
    }

    

    public boolean adminLogin(String username, String password) throws SQLException {
		statement = conn.prepareStatement("select username,password from admin where username=?");
		statement.setString(1, username);
		resultSet = statement.executeQuery();
		boolean isSuccess = false;
		
		
		
		if (resultSet.next()) {
			String passwordFromDb = resultSet.getString("password");

			if (password.equals(passwordFromDb)) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		}
		return isSuccess;

	}

}



