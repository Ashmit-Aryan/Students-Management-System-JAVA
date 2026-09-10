package com.ashmitaryan.Model;

public class Users {
	
	String id,username,password,email,created_at;
	
	
	
	public Users() {
		
	}
	
	public Users(String id ,String username,String email,String password,String created_at) {
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.created_at = created_at;
	}

	public void setCreated_At(String created_at) {
		this.created_at = created_at;
	}
	
	public String getCreated_At() {
		return created_at;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
