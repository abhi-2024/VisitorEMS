package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entities.admin;

public class adminDao {
	private Connection con;

	public adminDao(Connection con) {
		this.con = con;
	}

	public boolean saveAdmin(admin a) {

		boolean f = false;
		try {
			String s = "insert into admin(adminName,adminEmail,adminPassword) values(?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(s);
			pstmt.setString(1, a.getName());
			pstmt.setString(2, a.getEmail());
			pstmt.setString(3, a.getPassword());

			pstmt.executeUpdate();
			f = true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return f;
	}

	public admin getAdminDetails(String email, String password) {
		admin ad = null;
		try {
			String s = "select * from admin where adminEmail=? and adminPassword=?";
			PreparedStatement pstmt = con.prepareStatement(s);
			pstmt.setString(1, email);
			pstmt.setString(2, password);

			ResultSet set = pstmt.executeQuery();

			if (set.next()) {
				ad = new admin();
				ad.setName(set.getString("adminName"));
				ad.setEmail(set.getString("adminEmail"));
				ad.setPassword(set.getString("adminPassword"));
				ad.setrDate(set.getTimestamp("adminRDate"));
				ad.setId(set.getInt("idadmin"));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ad;
	}
}
