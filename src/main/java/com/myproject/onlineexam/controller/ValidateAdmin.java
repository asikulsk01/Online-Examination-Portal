package com.myproject.onlineexam.controller;

import com.myproject.onlineexam.db.AdminsDao;
import com.myproject.onlineexam.model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class ValidateAdmin
 */
@WebServlet("/com.myproject.onlineexam.controller.ValidateAdmin")
public class ValidateAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String adminId = request.getParameter("adminId");
		String password = request.getParameter("password");
		

		
		Admins ad = new Admins();
		ad.setAdminId(adminId);
		ad.setPassword(password);
		
	    boolean status = AdminsDao.doValidate(ad);
	    
	    if(status)
	    {
	    	//Logged in  as admin do something (pending)
	    	 HttpSession adSession = request.getSession();
			 adSession.setAttribute("adminId", ad.getAdminId());
			 adSession.setAttribute("adminName", ad.getAdminName());
			 response.sendRedirect("AdminPanel.jsp");
	    }
	    else
	    {
	    	String msg2 = "Invalid Admin Id or Password";
	    	response.sendRedirect("AdminLogin.jsp?msg2="+msg2);
	    }
		
		
	}

}
