package com.ashmitaryan.Database;

import java.sql.SQLException;

import com.ashmitaryan.Model.Users;

public interface UserDAOInterface {
	
	public Users login(String username,String password) throws SQLException; 
	
	public boolean signUp(Users user) throws SQLException;
	
	boolean usernameExists(String username) throws SQLException;

    boolean emailExists(String email) throws SQLException;

    Users getUserById(String id) throws SQLException;
    
    boolean UpdateUser(Users user) throws SQLException;
    
}
