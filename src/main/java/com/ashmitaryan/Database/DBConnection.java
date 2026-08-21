package com.ashmitaryan.Database;
import java.sql.*;


public class DBConnection {	
	
	private static final String jdbcURL = "jdbc:mysql://localhost:3306/Studentdb";
	
	private static final String username = "root";
	
	private static final String password = "Ashmit@123";
	
	public static Connection getConnection() {
		try {
			return DriverManager.getConnection(jdbcURL,username,password);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
