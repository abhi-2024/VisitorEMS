package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.entities.visitors;

public class visitorDao {
	
 private Connection con;
 
 public visitorDao(Connection con) {
	 this.con = con;
 }
 
 public boolean saveVisitor(visitors v) {
	 boolean f = false;
	 
	  try {
		
         String s = "insert into visitors(visitorName,visitorGender,visitorEmail,visitorAddress,visitorOccupation,hostName,hostOccupation,visitorReason,visitorVisitNo,visitorEntryTime) values(?,?,?,?,?,?,?,?,?,?)";
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
         pstmt.setString(10,v.geteDate());
         pstmt.executeUpdate();
         f=true;
		  
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	 
	 return f;
 }

 public ArrayList<visitors> fetchAllVisitors() {
	 ArrayList<visitors> list = new ArrayList<visitors>();
	 
	 try {
		
		 String s = "select * from visitors";
		 PreparedStatement pstmt = con.prepareStatement(s);
		 
		 ResultSet set = pstmt.executeQuery();
		 
		 while(set.next()) {
			 String vname = set.getString("visitorName");
			 String vemail = set.getString("visitorEmail");
			 String edate = set.getString("visitorEntryTime");
			 String host = set.getString("hostName");
			 int vid = set.getInt("idvisitor");
			 visitors v = new visitors(vname, vemail, host, edate, vid);
			 
			 list.add(v);
		 }
		 
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	 
	 return list;
 }
 
 public boolean deleteVisitor(int id) {
	 boolean f = false;
	 
	 try {
		 String s = "delete from visitors where idvisitor=?";
		 
		 PreparedStatement ptsmt = con.prepareStatement(s);
		 
		 ptsmt.setInt(1, id);
		 
		 ptsmt.executeUpdate();
		 
		 f=true;
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	 
	 return f;
 }

 public visitors fetchVisitor(int id) {
	 visitors v = null;
	 try {
		String s = "select * from visitors where idvisitor=?";
		PreparedStatement stmt = con.prepareStatement(s);
		stmt.setInt(1, id);
		ResultSet set = stmt.executeQuery();
		
		while(set.next()) {
			v = new visitors();
			v.setVid(set.getInt("idvisitor"));
			v.setVname(set.getString("visitorName"));
			v.setGender(set.getString("visitorGender"));
			v.setVemail(set.getString("visitorEmail"));
			v.setAddress(set.getString("visitorAddress"));
			v.setVocc(set.getString("visitorOccupation"));
			v.setHname(set.getString("hostName"));
			v.setHocc(set.getString("hostOccupation"));
			v.setVreason(set.getString("visitorReason"));
			v.setVno(set.getInt("visitorVisitNo"));
			v.seteDate(set.getString("visitorEntryTime"));
			v.setExDate(set.getString("visitorExitTime"));
		}
	} catch (Exception e) {
		// TODO: handle exception
	}
	 return v;
 }

 public boolean updateVisitor(int id, visitors v) {
	 boolean f = false;
	 
	 try {
      String s = "update visitors set visitorName=?, visitorEmail=?, visitorAddress=?, visitorOccupation=?, hostName=?, hostOccupation=?, visitorReason=?, visitorVisitNo=?,visitorGender=?,visitorExitTime=?  where idvisitor=?";
      PreparedStatement stmt = con.prepareStatement(s);
      stmt.setString(1, v.getVname());
      stmt.setString(2, v.getVemail());
      stmt.setString(3, v.getAddress());
      stmt.setString(4, v.getVocc());
      stmt.setString(5, v.getHname());
      stmt.setString(6, v.getHocc());
      stmt.setString(7, v.getVreason());
      stmt.setInt(8, v.getVno());
      stmt.setString(9, v.getGender());
      stmt.setString(10, v.getExDate());
      stmt.setInt(11, id);
      
      stmt.executeUpdate();
      f=true;
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	 
	 return f;
 }
}
