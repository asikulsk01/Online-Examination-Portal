<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@page import="com.myproject.onlineexam.model.*"%>
<%@page import="com.myproject.onlineexam.db.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	
<title>Update Student</title>
</head>
<body>
<% if(session.getAttribute("adminId") !=null)
	{

	}
else
{
	String msg2 = "Please Login as Admin to Continue";
	response.sendRedirect("AdminLogin.jsp?msg2="+msg2);
}
	%>
<%
		String newStudentId = request.getParameter("studentId");
        String newPassword = request.getParameter("password");
        String newName = request.getParameter("name");
        String newBatch = request.getParameter("batch");
        String newCourse = request.getParameter("course");
        String newRegistrationNo = request.getParameter("registrationNo");
        String newDepartment = request.getParameter("department");
        String newDob = request.getParameter("dob");
        String newEmail = request.getParameter("email");
        String newContactNo = request.getParameter("contactNo");
        String newAddress = request.getParameter("address");
        String newAdmissionYear = request.getParameter("admissionYear");
        String newPassOutYear = request.getParameter("passOutYear");
        String originalstudentId = request.getParameter("studentIdoriginal");

		int status = StudentsDao.doUpdateNowRecord(originalstudentId,newStudentId,newPassword,newName,newBatch,newCourse,newRegistrationNo,newDepartment,newDob,newEmail,newContactNo,newAddress,newAdmissionYear,newPassOutYear);
		if(status > 0)
		{
			response.sendRedirect("StudentList.jsp");
		}
		else if(status == -1)
		{

			out.print("error from databse");

		}
		else
		{
			out.print("excepion occured");
		}

	%>
</body>
</html>