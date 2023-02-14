
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.myproject.onlineexam.db.*" %>
    <%@page import="com.myproject.onlineexam.model.*" %>
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
		Instructions i = new Instructions();
		i.setInstId(request.getParameter("instid"));
		int status = InstructionsDao.deleteRecord(i);
		if(status > 0)
			response.sendRedirect("InstructionList.jsp");
		else
			out.print("Error");
		
	%>
</body>
</html>