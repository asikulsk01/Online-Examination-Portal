package com.myproject.onlineexam.controller;

import com.myproject.onlineexam.db.StudentsDao;
import com.myproject.onlineexam.model.Students;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class ValidateStudent
 */
@WebServlet("/com.myproject.onlineexam.controller.ValidateStudent")
public class ValidateStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateStudent() {
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
		
		String studentId = request.getParameter("studentId");
		String password = request.getParameter("password");
		

		
	    Students sd = new Students();
		sd.setStudentId(studentId);
		sd.setPassword(password);
		
	    boolean status = StudentsDao.doValidate(sd);
	    
	    
	    if(status)
	    {
	    	
	    	//Logged in  as student do something (pending)
	    	 HttpSession studentsession = request.getSession();
			 studentsession.setAttribute("studentId", sd.getStudentId());
			 studentsession.setAttribute("name",sd.getName() );
			response.sendRedirect("StudentPanel.jsp");
	    	
	    }
	    else
	    {
	    	String msg = "Invalid Student ID or Password";
	    	response.sendRedirect("StudentLogin.jsp?msg="+msg);
	    
	}

}
}
