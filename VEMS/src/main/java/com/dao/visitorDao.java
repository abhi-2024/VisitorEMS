package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entities.visitors;

public class visitorDao {
	
 private Connection con;
 
 public visitorDao(Connection con) {
	 this.con = con;
 }
 
 public boolean saveVisitor(visitors v) {
	 boolean f = false;
	 
	  try {
		
         String s = "insert into visitors(visitorName,visitorGender,visitorEmail,visitorAddress,visitorOccupation,hostName,hostOccupation,visitorReason,visitorVisitNo) values(?,?,?,?,?,?,?,?,?)";
         PreparedStatement pstmt = con.prepareStatement(s);
         pstmt.setString(1, v.getVname());
         pstmt.setString(2, v.getGender());
         pstmt.setString(3, v.getVemail());
         pstmt.setString(4, v.getAddress());
         pstmt.setString(5, v.getVocc());
         pstmt.setString(6, v.getHname());
         pstmt.setString(7, v.getHocc());
         pstmt.setString(8, v.getVreason());
         pstmt.setInt(9, v.getVno());
         
         pstmt.executeUpdate();
         f=true;
		  
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	 
	 return f;
 }
		 
}
