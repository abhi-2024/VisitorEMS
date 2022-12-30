package com.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class connectionProvider {
	private static Connection con;
	
	public static Connection getConnection() {
		try {
			 if(con==null) {
				 Class.forName("com.mysql.cj.jdbc.Driver");
				 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/visitorentry", "root", "root");
			 }
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return con;
	}

}
