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

import com.dao.employeeDao;
import com.entities.employee;
import com.helper.connectionProvider;

/**
 * Servlet implementation class updateEServ
 */
@WebServlet("/updateEServ")
@MultipartConfig
public class updateEServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateEServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nName  = request.getParameter("n");
		String nEmail = request.getParameter("e");
		String nDept  = request.getParameter("dep");
		String nDesk  = request.getParameter("des");
		String nAtt   = request.getParameter("att");
		int oId = Integer.parseInt(request.getParameter("id"));
		PrintWriter out = response.getWriter();
		employee e6 = new employee(oId, nName, nEmail, nDept, nDesk, nAtt);
		
		employeeDao dao = new employeeDao(connectionProvider.getConnection());
		
		if(dao.updateEmployee(e6, oId)) {
			out.print("Done!");
			HttpSession s = request.getSession();
			s.setAttribute("currentEmp", e6);
			response.sendRedirect("singleEmployee.jsp");
		}else {
			out.print("error!!");
		}
	}

}
