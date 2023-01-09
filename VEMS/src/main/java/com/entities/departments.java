package com.entities;

public class departments {
 int dId;
 String dName;
 String dFloor;
 
public departments() {
	super();
}

public departments(String dName, String dFloor) {
	super();
	this.dName = dName;
	this.dFloor = dFloor;
}

public departments(int dId, String dName, String dFloor) {
	super();
	this.dId = dId;
	this.dName = dName;
	this.dFloor = dFloor;
}

public int getdId() {
	return dId;
}

public void setdId(int dId) {
	this.dId = dId;
}

public String getdName() {
	return dName;
}

public void setdName(String dName) {
	this.dName = dName;
}

public String getdFloor() {
	return dFloor;
}

public void setdFloor(String dFloor) {
	this.dFloor = dFloor;
}
 

 
}
