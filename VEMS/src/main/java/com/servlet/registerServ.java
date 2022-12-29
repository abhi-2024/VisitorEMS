package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.adminDao;
import com.entities.admin;
import com.helper.connectionProvider;

/**
 * Servlet implementation class registerServ
 */
@WebServlet("/registerServ")
@MultipartConfig
public class registerServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("adminName");
		
		String email = request.getParameter("adminEmail");
		
		String password = request.getParameter("adminPassword");
		
		PrintWriter out = response.getWriter();
		
		admin a = new admin(name, email, password);
		
		adminDao dao = new adminDao(connectionProvider.getConnection());
		
		if(dao.saveAdmin(a)) {
			out.print("Done!");
		}
		else {
			out.print("Error");
		}
	}

}
