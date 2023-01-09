package com.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.reasonDao;
import com.entities.msg;
import com.helper.connectionProvider;

/**
 * Servlet implementation class delReasServ
 */
@WebServlet("/delReasServ")
public class delReasServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delReasServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("rid"));
		
		reasonDao dao = new reasonDao(connectionProvider.getConnection());
		
		if(dao.deleteReasons(id)) {
			msg m = new msg("Deleted Successfully!!", "alert", "alert-success");
			HttpSession s = request.getSession();
			s.setAttribute("rMSG", m);
			response.sendRedirect("addVisitReas.jsp");
		}
		else {
			msg m = new msg("Cannot Delete!!", "alert", "alert-danger");
			HttpSession s = request.getSession();
			s.setAttribute("rMSG", m);
			response.sendRedirect("addVisitReas.jsp");	
		}
	}

}
