package com.entities;

public class admin {
  int id;
  String name;
  String email;
  String password;
public admin(String name, String email, String password) {
	super();
	this.name = name;
	this.email = email;
	this.password = password;
}


public admin(int id, String name, String email, String password) {
	super();
	this.id = id;
	this.name = name;
	this.email = email;
	this.password = password;
}


public admin() {
	super();
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


public String getPassword() {
	return password;
}


public void setPassword(String password) {
	this.password = password;
}
  
  
}
