package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.visitorDao;
import com.entities.visitors;
import com.helper.connectionProvider;

/**
 * Servlet implementation class visitorDetailServ
 */
@WebServlet("/visitorDetailServ")
public class visitorDetailServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public visitorDetailServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("did"));
		
		visitorDao dao = new visitorDao(connectionProvider.getConnection());
		visitors vi = dao.fetchVisitor(id);
		
		HttpSession session = request.getSession();
		session.setAttribute("currentVisitor", vi);
		
		
		
		response.sendRedirect("singleVisitor.jsp");
	}

}
