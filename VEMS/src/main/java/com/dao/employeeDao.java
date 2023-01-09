package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.entities.employee;

public class employeeDao {

	private Connection con;
	
	public employeeDao(Connection con) {
		// TODO Auto-generated constructor stub
		this.con = con;
	}
	
	public boolean saveEmployee(employee e2) {
		boolean f=false;
		 
		try {
			
			String s = "insert into employees(employeeName, employeeEmail, employeeDept, employeeDesk, employeePresent) values(?,?,?,?,?)";
			
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setString(1, e2.getEname());
			stmt.setString(2, e2.getEemail());
			stmt.setString(3, e2.getEdept());
			stmt.setString(4, e2.getEdesk());
			stmt.setString(5, e2.getEatt());
			
			stmt.executeUpdate();
			
			f=true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
	
	public ArrayList<employee> fetchAllEmp(){
		ArrayList<employee> list = new  ArrayList<employee>();
		
		try {
			String s = "select * from employees";
			PreparedStatement stmt = con.prepareStatement(s);
		    ResultSet set = stmt.executeQuery();
		    
		    while(set.next()) {
		    	String fName  = set.getString("employeeName");
		    	String fEmail = set.getString("employeeEmail");
		    	String fDept  = set.getString("employeeDept");
		    	String fDesk  = set.getString("employeeDesk");
		    	String fAtt   = set.getString("employeePresent");
		    	int fidx = set.getInt("idemployees");
		    	employee e3 = new employee(fidx, fName, fEmail, fDept, fDesk, fAtt);
		    	list.add(e3);
		    }
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}

	public boolean delEmployee(String email) {
		boolean f = false;
		
		try {
			String s = "delete from employees where employeeEmail=?";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setString(1, email);
			stmt.executeUpdate();
			f=true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}

    public employee getEmployeeDetails(String email) {
    	employee em = null;
    	
    	try {
			
    		String s = "select * from employees where employeeEmail=?";
    		PreparedStatement stmt = con.prepareStatement(s);
    		stmt.setString(1, email);
    		ResultSet set = stmt.executeQuery();
    		while(set.next()) {
    			em = new employee();
    			em.setEid(set.getInt("idemployees"));
    			em.setEname(set.getString("employeeName"));
    			em.setEemail(set.getString("employeeEmail"));
    			em.setEdept(set.getString("employeeDept"));
    			em.setEdesk(set.getString("employeeDesk"));
    			em.setEatt(set.getString("employeePresent"));
    		}
    		
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
    	
    	return em;
    }
    
    public boolean updateEmployee(employee e7, int idx) {
    	boolean f = false;
    	
    	try {
			
    		String s = "update employees set employeeName=?, employeeEmail=?, employeeDept=?, employeeDesk=?, employeePresent=? where idemployees=?";
    		
    		PreparedStatement stmt = con.prepareStatement(s);
    		stmt.setString(1, e7.getEname());
    		stmt.setString(2, e7.getEemail());
    		stmt.setString(3, e7.getEdept());
    		stmt.setString(4, e7.getEdesk());
    		stmt.setString(5, e7.getEatt());
    		stmt.setInt(6, idx);
    		stmt.executeUpdate();
    		f=true;
    		
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
    	
    	return f;
    }
    
    public employee fetchEmployeeNameDept(int id) {
    	employee e10 = null;
    	
    	try {
			String s = "select * from employees where idemployees=?";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setInt(1, id);
			ResultSet set = stmt.executeQuery();
			while(set.next()) {
				e10 = new employee();
    			e10.setEid(set.getInt("idemployees"));
    			e10.setEname(set.getString("employeeName"));
    			e10.setEemail(set.getString("employeeEmail"));
    			e10.setEdept(set.getString("employeeDept"));
    			e10.setEdesk(set.getString("employeeDesk"));
    			e10.setEatt(set.getString("employeePresent"));
    			e10.setEemail(set.getString("employeeEmail"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
    	
    	return e10;
    }
    public employee fetchEmployeeNameDept(String email) {
    	employee e10 = null;
    	
    	try {
			String s = "select * from employees where employeeEmail=?";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setString(1, email);
			ResultSet set = stmt.executeQuery();
			while(set.next()) {
				e10 = new employee();
    			e10.setEid(set.getInt("idemployees"));
    			e10.setEname(set.getString("employeeName"));
    			e10.setEemail(set.getString("employeeEmail"));
    			e10.setEdept(set.getString("employeeDept"));
    			e10.setEdesk(set.getString("employeeDesk"));
    			e10.setEatt(set.getString("employeePresent"));
    			e10.setEemail(set.getString("employeeEmail"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
    	
    	return e10;
    }

}

