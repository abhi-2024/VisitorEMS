package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.employeeDao;
import com.dao.visitorDao;
import com.entities.employee;
import com.entities.visitors;
import com.helper.connectionProvider;

/**
 * Servlet implementation class updateVServ
 */
@WebServlet("/updateVServ")
@MultipartConfig
public class updateVServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateVServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String newName= request.getParameter("n");
		String newEmail= request.getParameter("e");
		String newAddress= request.getParameter("a");
		String newOccup= request.getParameter("o");
		String newHostMail= request.getParameter("hostVar"); //new host mail
		String newReason= request.getParameter("r");
		String newGender= request.getParameter("g");
		String newExTime= request.getParameter("ex");
		int oldVid = Integer.parseInt(request.getParameter("vid"));
		String oldDate = request.getParameter("vdate");
		int newVisitNo= Integer.parseInt(request.getParameter("vn"));
		
		//String newHName,String newHdesk,String newDepar;//new host name, host desk, host department
		
		employeeDao daoE = new employeeDao(connectionProvider.getConnection());
		
		employee e12 = daoE.fetchEmployeeNameDept(newHostMail);
		
		String newHName = e12.getEname();
		String newHdesk = e12.getEdesk();
		String newDepar = e12.getEdept();
		
		PrintWriter out = response.getWriter();		
		visitors v2 = new visitors(newName, newGender, newEmail, newAddress, newOccup, newHName, newDepar, newReason, newVisitNo, oldVid, oldDate, newExTime, newHdesk, newHostMail);
		
		visitorDao dao = new visitorDao(connectionProvider.getConnection());
		
		HttpSession s = request.getSession();
		
		if(dao.updateVisitor(oldVid, v2)) {
			out.print("Done!");
			s.setAttribute("currentVisitor", v2);
			response.sendRedirect("singleVisitor.jsp");
		}
		else {
			out.print("Data Similar");
			response.sendRedirect("singleVisitor.jsp");
		}
	}

}
