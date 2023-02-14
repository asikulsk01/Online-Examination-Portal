package com.myproject.onlineexam.controller;

import com.myproject.onlineexam.db.AdminsDao;
import com.myproject.onlineexam.model.Admins;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class AdminInsert
 */
@WebServlet("/com.myproject.onlineexam.controller.AdminInsert")
public class AdminInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String adminId = request.getParameter("adminId");
		String password = request.getParameter("password");
		String adminName = request.getParameter("adminName");
		String adminEmail = request.getParameter("adminEmail");
		String adminContactNo = request.getParameter("adminContactNo");
		String adminAddress = request.getParameter("adminAddress");
		String adminDob = request.getParameter("adminDob");
		String adminGender = request.getParameter("adminGender");
		
		Admins ad = new Admins();
		ad.setAdminId(adminId);
		ad.setPassword(password);
		ad.setAdminName(adminName);
		ad.setAdminEmail(adminEmail);
		ad.setAdminContactNo(adminContactNo);
		ad.setAdminAddress(adminAddress);
		ad.setAdminDob(adminDob);
		ad.setAdminGender(adminGender);



		boolean status = AdminsDao.insertAdmin(ad);
		if(status)
		{
			String msg1 = "Admin Added Successfully";
	    	response.sendRedirect("AddAdmin.jsp?msg1="+msg1);
		}
		else
		{
			String msg2 = "Admin Not Added";
	    	response.sendRedirect("AddAdmin.jsp?msg2="+msg2);
		}
		
	}

}
