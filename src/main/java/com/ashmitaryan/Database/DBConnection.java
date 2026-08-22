package com.ashmitaryan.Database;
import java.sql.*;


public class DBConnection {	
	
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private static final String jdbcURL = "jdbc:mysql://localhost:3306/StudentDB";
	
	private static final String username = "root";
	
	private static final String password = "Ashmit@123";
	
	public static Connection getConnection() {
		try {
			return DriverManager.getConnection(jdbcURL,username,password);
		} catch (SQLException e) {
			System.out.println("JDBC Error");
			e.printStackTrace();
			return null;
		}
	}
}
