package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.employeeDao;
import com.helper.connectionProvider;

/**
 * Servlet implementation class delEmpServ
 */
@WebServlet("/delEmpServ")
public class delEmpServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delEmpServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String e = request.getParameter("em");
		
		employeeDao dao = new employeeDao(connectionProvider.getConnection());
		
		if(dao.delEmployee(e)) {
			response.sendRedirect("viewEmployees.jsp");
		}
		else {
			System.out.print("Error!!");
		}
	}

}
