package com.admin.usermanagement.bean;

public class User {
	protected int id;
	protected String name;
	protected String email;
	protected String userPassword;
	
	public User() {
	}
	
	public User(String name, String email, String userPassword) {
		super();
		this.name = name;
		this.email = email;
		this.userPassword = userPassword;
	}

	public User(int id, String name, String email, String userPassword) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.userPassword = userPassword;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
}
