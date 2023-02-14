<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.myproject.onlineexam.model.*"%>
<%@page import="com.myproject.onlineexam.db.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student List</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style type="text/css">

*, *:before, *:after {
  margin: 0;
  padding: 10;
  box-sizing: border-box;
}

body {
    background-image: url("image1.jpeg");
    background-position: 30px 0px;
    <!--background-repeat: no-repeat;-->
  font-family: 'Open Sans', sans-serif;
}
table {
  background:  linear-gradient(to right, #1f4037 0%, #99f2c8 100%);
  border-radius: 2.5 em;
  border-collapse: collapse;
  margin: 1.5rem;
  width: 70%;
}
.center {
  margin-left: auto;
  margin-right: auto;
}
th {
  border-bottom: 2px solid #364043;
  color: #E2B842;
  font-size: 1.5 em;
  font-weight: 600;
  padding: 0.5em 1em;
  text-align: left;
}
td {
  color: #fff;
  font-weight: 400;
  padding: 0.65em 1em;
}
.disabled td {
  color: #4F5F64;
}
tbody tr {
  transition: background 0.35s ease;
}
tbody tr:hover {
  background: #014055;
}
</style>
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
<center><h3><font color="Yellow" face = "ROMAN" size = "7" ><b>List of all Students</b></font></h3></center>
<table class="center">
<tr>

 <th>Sl No.</th>
 <th>Student ID</th>
 <th>Name</th>
 <th>Password</th>
 <th>Batch</th>
 <th>Update</th>
 <th>Delete</th>
</tr>
<tr>
<%
   int i = 1;
   ArrayList<Students> allstudents = StudentsDao.getAllRecords();
  for(Students e : allstudents)
  {   
	  
  
  %>
   <tr>
  <td><%=i++%></td>
  <td><%=e.getStudentId() %></td>
  <td><%=e.getName()%></td>
  <td><%=e.getPassword() %></td>
  <td><%=e.getBatch() %></td>

  <td><a href="updatestudent.jsp?studentId=<%=e.getStudentId()%>">Update</a></td>
  <td><a href="deletestudent.jsp?studentId=<%=e.getStudentId()%>">Delete</a></td>
  </tr>
  <%
  }
  %>

</table>

</body>
</html>