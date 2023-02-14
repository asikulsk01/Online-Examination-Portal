<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@page import="com.myproject.onlineexam.model.*"%>
<%@page import="com.myproject.onlineexam.db.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	
<title>Update Subject Now</title>
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
        String newsubjectid = request.getParameter("subid");
        String newsubjectcode = request.getParameter("subcode");
        String newsubjectname = request.getParameter("subname");
        String originalsubjectid = request.getParameter("origsubid");

		int status = SubjectsDao.doUpdateNowRecord(originalsubjectid,newsubjectid,newsubjectcode,newsubjectname);

		if(status > 0)
		{ 
			response.sendRedirect("ViewSubject.jsp");
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