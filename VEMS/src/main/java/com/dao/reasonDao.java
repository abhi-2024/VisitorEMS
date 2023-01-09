package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.entities.reasons;

public class reasonDao {
 private Connection con;
 public reasonDao(Connection con) {
	// TODO Auto-generated constructor stub
	 this.con = con;
}
 
 public boolean saveReason(reasons r) {
	 boolean f = false;
	 try {
		 String s = "insert into reasons(reasonsTitle) values(?)";
		 PreparedStatement st = con.prepareStatement(s);
		 st.setString(1, r.getrName());
		 st.executeUpdate();
		 f=true;
	} catch (Exception e) {
		e.printStackTrace();
		// TODO: handle exception
	}
	 return f;
 }
 
 public ArrayList<reasons> fetchAllReasons(){
	 ArrayList<reasons> list = new ArrayList<reasons>();
	 
	 try {
		String s = "select * from reasons";
		PreparedStatement st = con.prepareStatement(s);
		ResultSet set = st.executeQuery();
		while(set.next()) {
			int id = set.getInt("idreasons");
			String n = set.getString("reasonsTitle");
			reasons r1 = new reasons(id,n);
			list.add(r1);
		}
	} catch (Exception e) {
		e.printStackTrace();
		// TODO: handle exception
	}
	 
	 return list;
 }
 
 public boolean deleteReasons(int id) {
	 boolean f = false;
	 try {
		String s = "delete from reasons where idreasons=?";
		PreparedStatement stmt = con.prepareStatement(s);
		stmt.setInt(1, id);
		stmt.executeUpdate();
		f=true;
	} catch (Exception e) {
		e.printStackTrace();
		// TODO: handle exception
	}
	 return f;
 }
}
