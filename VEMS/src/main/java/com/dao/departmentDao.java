package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.entities.departments;

public class departmentDao {
 
	private Connection con;
	
	public departmentDao(Connection con) {
		// TODO Auto-generated constructor stub
		this.con = con;
	}
	
	public boolean saveDepartment(departments d) {
		boolean f = false;
		
		try {
			String s = "insert into departments(departmentName, departmentFloor) values(?,?)";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setString(1, d.getdName());
			stmt.setString(2, d.getdFloor());
			stmt.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return f;
	}
	
	public ArrayList<departments> fetchDepts(){
		ArrayList<departments> list = new ArrayList<departments>();
		try {
			String s = "select * from departments";
			PreparedStatement st = con.prepareStatement(s);
			ResultSet set = st.executeQuery();
			while(set.next()) {
				String dname = set.getString("departmentName");
				String dfloor = set.getString("departmentFloor");
				int did = set.getInt("iddepartments");
				departments d1 = new departments(did, dname, dfloor);
				list.add(d1);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return list;
	}
	
	public departments fetchFloor(String Dept) {
		departments res = null;
		try {
			String s = "select * from departments where departmentName=?";
			PreparedStatement st = con.prepareStatement(s);
			st.setString(1, Dept);
			ResultSet set = st.executeQuery();
			while(set.next()) {
				res = new departments();
				res.setdId(set.getInt("iddepartments"));
				res.setdName(set.getString("departmentName"));
				res.setdFloor(set.getString("departmentFloor"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return res;
	}
	
	public boolean delDepts(int id) {
		boolean f = false;
		
		try {
			String s = "delete from departments where iddepartments=?";
			PreparedStatement st = con.prepareStatement(s);
			st.setInt(1, id);
			st.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return f;
	}
}
