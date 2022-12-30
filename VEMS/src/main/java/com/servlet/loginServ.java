package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
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
 * Servlet implementation class loginServ
 */
@WebServlet("/loginServ")
public class loginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("loginEmail");
		String pass = request.getParameter("loginPassword");
		
		PrintWriter out = response.getWriter();
    	adminDao dao = new adminDao(connectionProvider.getConnection());
		admin Admin = dao.getAdminDetails(email, pass);
		
		if(Admin==null) {
			
			msg m = new msg("Invalid Details!!", "error" , "alert-danger");
			HttpSession session = request.getSession();
			session.setAttribute("MSG", m);
			response.sendRedirect("login.jsp");
		}else {
			HttpSession s = request.getSession();
			s.setAttribute("currentUser", Admin);
			response.sendRedirect("index.jsp");
		}
		
	}

}
