package com.entities;

public class employee {
 int eid;
 String ename;
 String eemail;
 String edept;
 String edesk;
 String eatt;
public employee() {
	super();
}
public employee(String ename, String eemail, String edept, String edesk, String eatt) {
	super();
	this.ename = ename;
	this.eemail = eemail;
	this.edept = edept;
	this.edesk = edesk;
	this.eatt = eatt;
}


public employee(int eid, String ename, String eemail, String edept, String edesk, String eatt) {
	super();
	this.eid = eid;
	this.ename = ename;
	this.eemail = eemail;
	this.edept = edept;
	this.edesk = edesk;
	this.eatt = eatt;
}
public int getEid() {
	return eid;
}
public void setEid(int eid) {
	this.eid = eid;
}
public String getEname() {
	return ename;
}
public void setEname(String ename) {
	this.ename = ename;
}
public String getEemail() {
	return eemail;
}
public void setEemail(String eemail) {
	this.eemail = eemail;
}
public String getEdept() {
	return edept;
}
public void setEdept(String edept) {
	this.edept = edept;
}
public String getEdesk() {
	return edesk;
}
public void setEdesk(String edesk) {
	this.edesk = edesk;
}
public String getEatt() {
	return eatt;
}
public void setEatt(String eatt) {
	this.eatt = eatt;
}
 
}
