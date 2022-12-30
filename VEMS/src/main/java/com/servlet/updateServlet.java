package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.adminDao;
import com.entities.admin;
import com.entities.msg;
import com.helper.connectionProvider;

/**
 * Servlet implementation class updateServlet
 */
@WebServlet("/updateServlet")
@MultipartConfig
public class updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String newName = request.getParameter("newName");
		String newEmail = request.getParameter("newEmail");
		String newPassword = request.getParameter("newPassword");
		PrintWriter out = response.getWriter();
		HttpSession ses = request.getSession();
		
		admin a = (admin) ses.getAttribute("currentUser");
		
		admin a1 = new admin(a.getId(), newName, newEmail, newPassword);
		
		adminDao dao = new adminDao(connectionProvider.getConnection());
		
		if(dao.updateAdmin(a1)) {
			out.print("Done!");
		}
		else {
			System.out.print("no-success");
		}
	}

}
