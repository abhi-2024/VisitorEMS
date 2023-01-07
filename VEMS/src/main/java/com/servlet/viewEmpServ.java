package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.employeeDao;
import com.entities.employee;
import com.helper.connectionProvider;

/**
 * Servlet implementation class viewEmpServ
 */
@WebServlet("/viewEmpServ")
public class viewEmpServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewEmpServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("ema");
		employeeDao dao = new employeeDao(connectionProvider.getConnection());
		employee e4 = dao.getEmployeeDetails(email);
		HttpSession session = request.getSession();
		session.setAttribute("currentEmp", e4);
		response.sendRedirect("singleEmployee.jsp");
	}

}
