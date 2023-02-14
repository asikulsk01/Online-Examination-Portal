<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
                <%@page import="com.myproject.onlineexam.model.*"%>
<%@page import="com.myproject.onlineexam.db.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
		String instidoriginal = request.getParameter("instidoriginal");

		String instidmodified = request.getParameter("instidmodified");
		String subcodemodified = request.getParameter("subcodemodified");
		String instmodified = request.getParameter("instmodified");
		String ttlmarksmodified = request.getParameter("totalmarksmodified");
		String durationmodified = request.getParameter("durmodified");
		String datemodified = request.getParameter("datemodified");

     
		int status = InstructionsDao.doUpdateNowRecord(instidoriginal,instidmodified,subcodemodified,instmodified,ttlmarksmodified,durationmodified,datemodified);
		if(status > 0)
		{
			response.sendRedirect("InstructionList.jsp");
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