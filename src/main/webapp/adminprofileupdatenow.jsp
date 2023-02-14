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
        String newName = request.getParameter("adminName");
        String newPassword = request.getParameter("password");
        String newDob = request.getParameter("adminDob");
        String newGender = request.getParameter("adminGender");
        String newEmail = request.getParameter("adminEmail");
        String newContactNo = request.getParameter("adminContactNo");
        String newAddress = request.getParameter("adminAddress");
        String originalAId = request.getParameter("originaladminId");

		int status = AdminsDao.doUpdateadminprofile(originalAId,newName,newPassword,newDob,newGender,newEmail,newContactNo,newAddress);
		if(status > 0)
		{
			response.sendRedirect("AdminProfile.jsp");
		}
		else if(status == -1)
		{

			out.print("error from database");

		}
		else
		{
			out.print("excepion occured");
		}

	%>
</body>
</html>