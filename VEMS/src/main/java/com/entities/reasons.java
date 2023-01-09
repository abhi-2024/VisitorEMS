package com.entities;

public class reasons {
 int rId;
 String rName;
 
public reasons() {
	super();
}
public reasons(int rId, String rName) {
	super();
	this.rId = rId;
	this.rName = rName;
}
public reasons(String rName) {
	super();
	this.rName = rName;
}
public int getrId() {
	return rId;
}
public void setrId(int rId) {
	this.rId = rId;
}
public String getrName() {
	return rName;
}
public void setrName(String rName) {
	this.rName = rName;
}
 
 
}
