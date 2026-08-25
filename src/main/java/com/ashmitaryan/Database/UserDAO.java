package com.ashmitaryan.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

import com.ashmitaryan.Model.Users;
import at.favre.lib.crypto.bcrypt.*;

public class UserDAO implements UserDAOInterface {

	private static final String INSERT_USER = "INSERT INTO users(id,username,email,password) VALUES(?,?,?,?)";
	private static final String VERIFY_USER = "SELECT id , username , email,password,created_at FROM users WHERE username=?";
	private static final String USERNAME_EXITS = "SELECT id FROM users WHERE username = ?";
	private static final String EMAIL_EXITS = "SELECT id FROM users WHERE email = ?";
	private static final String GET_USER_BY_ID = "SELECT * FROM users WHERE id  = ?";
	
	@Override
	public Users login(String username, String password) throws SQLException {
		Users usr = null;
		try(Connection conn = DBConnection.getConnection();PreparedStatement stmt = conn.prepareStatement(VERIFY_USER)){
			stmt.setString(1, username);
			
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next()) {
				String storedHash = rs.getString("password");
				
				if(BCrypt.verifyer().verify(password.toCharArray(), storedHash).verified) {
					usr = new Users();
					usr.setUsername(rs.getString("username"));
					usr.setPassword(storedHash);
					usr.setEmail(rs.getString("email"));
					usr.setCreated_At(rs.getString("created_at"));
				}
			}
		}
		
		return usr;
	}

	@Override
	public boolean signUp(Users user) throws SQLException {
		
		boolean userCreated = false;
		try(Connection conn = DBConnection.getConnection();PreparedStatement stmt = conn.prepareStatement(INSERT_USER)){
			stmt.setString(1, user.getId());
			stmt.setString(2, user.getUsername());
			stmt.setString(3, user.getEmail());
			String password = BCrypt.withDefaults().hashToString(12, user.getPassword().toCharArray());
			stmt.setString(4, password);
			userCreated = stmt.executeUpdate() > 0 ? true : false;
		}	
		return userCreated;
	}

	@Override
	public boolean usernameExists(String username) throws SQLException {
		// TODO Auto-generated method stub
		try(Connection conn = DBConnection.getConnection();PreparedStatement stmt = conn.prepareStatement(USERNAME_EXITS)){
			stmt.setString(1, username);
			
			ResultSet rs = stmt.executeQuery();
			
			return rs.next();
			
		}
	}

	@Override
	public boolean emailExists(String email) throws SQLException {
		try(Connection conn = DBConnection.getConnection();PreparedStatement stmt = conn.prepareStatement(EMAIL_EXITS)){
			stmt.setString(1, email);
			
			ResultSet rs = stmt.executeQuery();
			
			return rs.next();
			
		}
	}

	@Override
	public Users getUserById(String id) throws SQLException{
		Users usr = null;
		
		try(Connection conn = DBConnection.getConnection();PreparedStatement stmt = conn.prepareStatement(GET_USER_BY_ID)){
			stmt.setString(1, id);
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				usr = new Users(rs.getString("id"),rs.getString("username"),rs.getString("email"),rs.getString("password"),rs.getString("created_at"));
			}
		}
		return usr;
	}

	@Override
	public boolean UpdateUser(Users user) throws SQLException {
		try(Connection conn = DBConnection.getConnection();PreparedStatement stmt = conn.prepareStatement("UPDATE users set username=?,email=? WHERE id = ?")){
			stmt.setString(2, user.getId());
			stmt.setString(3, user.getUsername());
			stmt.setString(1,user.getId());
			
			int row = stmt.executeUpdate();
			if(row > 0) {
				return true;
			}else {
				return false;
			}
		}
	}

}
