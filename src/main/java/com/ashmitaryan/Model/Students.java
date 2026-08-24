package com.ashmitaryan.Model;

public class Students {
	
	private int age;
	private String id, name,email,course,batch,phone;
	
	public Students() {
		
	}
	
	public Students(String id, String name,String email,String phone,String course,int age,String batch) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.course = course;
		this.batch = batch;
		this.phone = phone;
		this.age  = age;
	}
	public int getAge() {
		return age;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getId() {
		return id;
	}
	public void setAge(int age) {
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getBatch() {
		return batch;
	}

	public void setBatch(String batch) {
		this.batch = batch;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	
	

}
