package config;

import java.sql.*;
import com.mysql.jdbc.Driver;

public class Connect {
	
	public static Statement declaracaoQuery() {
		Statement st = null;

		try {
			st = conectar().createStatement();

		} catch (SQLException e) {
			System.out.println(e.getCause());
		}

		return st;
	} 	
	
	private static Connection conectar() throws SQLException {
		
		Connection con;
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/javaweb?useTimezone=true&serverTimezone=UTC&user=root&password=admin");
		
		} catch (ClassNotFoundException e) {
			throw new RuntimeException();
		}
		
		return con;
	}
	
	

}
