package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entities.admin;

public class adminDao {
  private Connection con;
  public adminDao(Connection con) {
	  this.con = con;
  }
  
  public boolean saveAdmin(admin a) {

	  boolean f= false;
	   try {
		String s = "insert into admin(adminName,adminEmail,adminPassword) values(?,?,?)";
		PreparedStatement pstmt =  con.prepareStatement(s);
		pstmt.setString(1, a.getName());
		pstmt.setString(2, a.getEmail());
		pstmt.setString(3, a.getPassword());
		
		pstmt.executeUpdate();
		f=true;
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	  
	  return f;
  }
  
  
	/*
	 * public admin getAdminDetails() {
	 * 
	 * }
	 */
}
