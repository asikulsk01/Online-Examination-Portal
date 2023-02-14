package com.myproject.onlineexam.controller;

import com.myproject.onlineexam.db.StudentsDao;
import com.myproject.onlineexam.model.Students;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class StudentInsert
 */
@WebServlet("/com.myproject.onlineexam.controller.StudentInsert")
public class StudentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentInsert() {
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
		
		String studentId = request.getParameter("studentId");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String batch = request.getParameter("batch");
		String course = request.getParameter("course");
		String registrationNo = request.getParameter("registrationNo");
		String department = request.getParameter("department");
		String dob = request.getParameter("dob");
		String gender= request.getParameter("gender");
		String email = request.getParameter("email");
		String contactNo = request.getParameter("contactNo");
		String address= request.getParameter("address");
		String admissionYear= request.getParameter("admissionYear");
		String passOutYear= request.getParameter("passOutYear");

		
		Students st = new Students();
		st.setStudentId(studentId);
		st.setPassword(password);
		st.setName(name);
		st.setBatch(batch);
		st.setCourse(course);
		st.setRegistrationNo(registrationNo);
		st.setDepartment(department);
		st.setDob(dob);
		st.setGender(gender);
		st.setEmail(email);
		st.setContactNo(contactNo);
		st.setAddress(address);
		st.setAdmissionYear(admissionYear);
		st.setPassOutYear(passOutYear);


		boolean status = StudentsDao.insertStudent(st);
		if(status)
		{
			String msg1 = "Student Added Successfully";
	    	response.sendRedirect("AddStudent.jsp?msg1="+msg1);
		}
		else
		{
			String msg2 = "Student Not Added";
	    	response.sendRedirect("AddStudent.jsp?msg2="+msg2);
		}
		
	}

}
