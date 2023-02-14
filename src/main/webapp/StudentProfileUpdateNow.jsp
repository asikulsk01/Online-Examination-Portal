<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@page import="com.myproject.onlineexam.model.*"%>
<%@page import="com.myproject.onlineexam.db.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Update Student Profile Now</title>
</head>
<body>
<% if(session.getAttribute("studentId") !=null)
	{

	}
else
{
	String msg2 = "Please Login as Student to Continue";
	response.sendRedirect("StudentLogin.jsp?msg1="+msg2);
}
	%>
<%
        String newPassword = request.getParameter("password");
        String newEmail = request.getParameter("email");
        String newContactNo = request.getParameter("contactNo");
        String newAddress = request.getParameter("address");
        String originalSId = request.getParameter("originalstudentId");
		int status = StudentsDao.doUpdatestudentprofile(originalSId,newPassword,newEmail,newContactNo,newAddress);
		if(status > 0)
		{
			response.sendRedirect("StudentProfile.jsp");
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