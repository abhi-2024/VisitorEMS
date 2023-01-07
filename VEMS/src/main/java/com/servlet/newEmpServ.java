package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.employeeDao;
import com.entities.employee;
import com.helper.connectionProvider;

/**
 * Servlet implementation class newEmpServ
 */
@WebServlet("/newEmpServ")
public class newEmpServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newEmpServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String eN  = request.getParameter("empName");
		String eE  = request.getParameter("empEmail");
		String eD  = request.getParameter("empDept");
		String eDe = request.getParameter("empDesk");
		String eA  = request.getParameter("empAtt");
		
		PrintWriter out = response.getWriter();
		
		out.println(eN);
		out.println(eE);
		out.println(eD);
		out.println(eDe);
		out.println(eA);
		
		employee e1 = new employee(eN, eE, eD, eDe, eA);
		
		employeeDao dao = new employeeDao(connectionProvider.getConnection());
		
		if(dao.saveEmployee(e1)) {
			out.print("Done!");
		}else {
			out.print("error");
		}
		
	}

}
