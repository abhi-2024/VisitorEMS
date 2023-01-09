package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.departmentDao;
import com.entities.departments;
import com.entities.msg;
import com.helper.connectionProvider;

/**
 * Servlet implementation class deptServ
 */
@WebServlet("/deptServ")
public class deptServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deptServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String dname = request.getParameter("dept");
		String f = request.getParameter("floor");
		departments d = new departments(dname, f);
		departmentDao dao = new departmentDao(connectionProvider.getConnection());
		PrintWriter out = response.getWriter();
		if(dao.saveDepartment(d)) {
			msg m = new msg("Added Successfully", "alert", "alert-success");
			HttpSession s = request.getSession();
			s.setAttribute("dMSG", m);
			response.sendRedirect("addDepts.jsp");
		}
	}

}
