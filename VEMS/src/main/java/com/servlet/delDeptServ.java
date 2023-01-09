package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.departmentDao;
import com.entities.msg;
import com.helper.connectionProvider;

/**
 * Servlet implementation class delDeptServ
 */
@WebServlet("/delDeptServ")
public class delDeptServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delDeptServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("i"));
		
		departmentDao dao = new departmentDao(connectionProvider.getConnection());
		
		if(dao.delDepts(id)) {
			msg m = new msg("Deleted Successfully!!", "alert", "alert-success");
			HttpSession s = request.getSession();
			s.setAttribute("dMSG", m);
			response.sendRedirect("addDepts.jsp");
		}else {
			System.out.print("Error!!");
		}
	}

}
