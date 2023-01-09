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
import com.dao.employeeDao;
import com.entities.departments;
import com.entities.employee;
import com.entities.msg;
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
		
		departmentDao d = new departmentDao(connectionProvider.getConnection());
		
		departments de = d.fetchFloor(eD);
		
		String floor = de.getdFloor();
		
		String Desk = "Desk_" + eDe;
		String FD = Desk.concat(" Floor_"+floor);
		
		PrintWriter out = response.getWriter();
		
		
		employee e1 = new employee(eN, eE, eD, FD, eA);
		
		employeeDao dao = new employeeDao(connectionProvider.getConnection());
		
		if(dao.saveEmployee(e1)) {
			msg m = new msg("Employee Added!!", "success", "alert-success");
			HttpSession s = request.getSession();
			s.setAttribute("EMSG", m);
			response.sendRedirect("addEmployee.jsp");
		}else {
			out.print("error");
		}
		
	}

}
