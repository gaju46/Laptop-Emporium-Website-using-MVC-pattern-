package service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import constant.query;
import model.Product;
import model.User;
import utils.DatabaseConnection;
import utils.PasswordHash;

public class UserDao {
    private Connection conn;
    private PreparedStatement statement;
    private ResultSet resultSet;
    private boolean isSuccess;
    
    public UserDao() throws ClassNotFoundException, SQLException {
        conn = DatabaseConnection.getDatabaseConnection(); 
    }

    public boolean saveUser(User user) {
       try {
		statement = conn.prepareStatement(query.SELECT_ALL_QUERY);
		resultSet = statement.executeQuery();
		if(resultSet.next()) {
			if(check(user)) {
				isSuccess=false;
			}
			else {
				int row = setData(user);
				if (row>0) {
					isSuccess = true;
					
				}
				else {
					isSuccess = false;
				}
			}
		}
		else {
			int row = setData(user);
			if(row>0) {
				isSuccess = true;
			}
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		
	}
       return isSuccess;
    }

    public int setData(User user) {
    	int row = 0;
    	try {
			statement = conn.prepareStatement(query.INSERT_QUERY);
			
			statement.setString(1, user.getFirstName());
			statement.setString(2, user.getLastName());
			statement.setString(3, user.getUsername());
			statement.setDate(4, user.getBirthday());
			statement.setString(5, user.getGender());
			statement.setLong(6, user.getPhoneNumber());
			statement.setString(7, user.getEmail());
			statement.setString(8, user.getPassword());
			
			row = statement.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return row;
    }
    
    
    
    public boolean check(User user) {
        boolean userExists = false;
        try {
			statement = conn.prepareStatement(query.CHECK_USER_EXISTENCE_QUERY);
			resultSet = statement.executeQuery();
			
			while (resultSet.next()) {
				if (user.getUsername().equals(resultSet.getString("username"))) {
					userExists = true;
					break;
				}
				else if(user.getEmail().equals(resultSet.getString("email"))) {
					userExists = true;
					break;
				}
				else if(user.getPassword().equals(resultSet.getString("phoneNumber"))) {
					userExists = true;
					break;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return userExists;
    }
//To send success
    public boolean userLogin(String username, String password) throws SQLException {
		statement = conn.prepareStatement("select username,password from user where username=?");
		statement.setString(1, username);
		resultSet = statement.executeQuery();
		boolean isSuccess = false;
		
		
		
		if (resultSet.next()) {
			String passwordFromDb = resultSet.getString("password");

			if (PasswordHash.verifyPassword(password, passwordFromDb)) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		}
		return isSuccess;

	}

    public boolean checkUser(String username) throws SQLException {
		statement = conn.prepareStatement("select username from user where username=?");
		statement.setString(1, username);
		resultSet = statement.executeQuery();
		
		boolean isUser = false;
		if (resultSet.next()) {
			
			isUser=true;
			
		}
		return isUser;
	}
    
    

    public List<User> getAllUser() throws SQLException {
		statement=conn.prepareStatement("select * from user");
		resultSet=statement.executeQuery();
		List<User> userList=new ArrayList<User>();
		while(resultSet.next())
		{
			int id=resultSet.getInt("user_id");
			String firstName=resultSet.getString("firstName");
			String lastName=resultSet.getString("lastName");
			String username=resultSet.getString("username");
			Date birthday=resultSet.getDate("birthday");
			String gender=resultSet.getString("gender");
			String email=resultSet.getString("email");
			long phoneNumber=resultSet.getLong("phoneNumber");
			String password=resultSet.getString("password");
			
			User user=new User();
			user.setUserId(id);
			user.setFirstName(firstName);
			user.setLastName(lastName);
			user.setUsername(username);
			user.setBirthday(birthday);
			user.setGender(gender);
			user.setPhoneNumber(phoneNumber);
			user.setEmail(email);
			user.setPassword(password);
			userList.add(user);
		}
		return userList;
	}

	
    
}
