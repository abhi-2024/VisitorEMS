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

import com.dao.visitorDao;
import com.entities.msg;
import com.entities.visitors;
import com.helper.connectionProvider;

/**
 * Servlet implementation class newEntryServ
 */
@WebServlet("/newEntryServ")
@MultipartConfig
public class newEntryServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newEntryServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String vname = request.getParameter("vName");
		String gender= request.getParameter("gender");
		String vemail= request.getParameter("vEmail");
		String address= request.getParameter("vAddress");
		String vocc= request.getParameter("vOccupation");
		String hname= request.getParameter("hName");
		String hocc= request.getParameter("hOccupation");
		String vreason= request.getParameter("vReason");
		String eDate= request.getParameter("eDate");
		int vno = Integer.parseInt(request.getParameter("vNumber"));
		
		PrintWriter out = response.getWriter();
		
		visitors visitor = new visitors(vname, gender, vemail, address, vocc, hname, hocc, vreason, vno, eDate);
		
		visitorDao dao = new visitorDao(connectionProvider.getConnection());
		
		if(dao.saveVisitor(visitor)) {
			out.print("Done!");
			msg m2 = new msg("Visitor Added!!", "success", "alert-success");
			HttpSession session = request.getSession();
			session.setAttribute("vMsg", m2);
		}
		else {
			out.print("Error!!");
		}
		
	}

}
