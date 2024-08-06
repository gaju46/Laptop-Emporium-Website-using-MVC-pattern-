package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

		private static Connection connection;

		public static Connection getDatabaseConnection() throws ClassNotFoundException, SQLException

		{

			Class.forName("com.mysql.cj.jdbc.Driver");

			String url="jdbc:mysql://localhost:3306/laptop_emporium";

			String user="root";

			String password="";

			connection=DriverManager.getConnection(url,user,password);

			return connection;

		}
	
}
