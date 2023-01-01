package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.visitorDao;
import com.helper.connectionProvider;

/**
 * Servlet implementation class delVisServ
 */
@WebServlet("/delVisServ")
public class delVisServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delVisServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int delId = Integer.parseInt(request.getParameter("id"));
		PrintWriter out = response.getWriter();
		
		visitorDao dao = new visitorDao(connectionProvider.getConnection());
		
		if(dao.deleteVisitor(delId)) {
			out.print("Done!");
			response.sendRedirect("viewVisitors.jsp");
		}
		else {
			out.print("Error!");
		}
	}

}
