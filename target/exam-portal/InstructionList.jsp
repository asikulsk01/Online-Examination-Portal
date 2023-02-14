<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="com.myproject.onlineexam.model.*"%>
<%@page import="com.myproject.onlineexam.db.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Instruction List</title>
<style>
body{
background-image:url('shelf.jpg');
background-size: cover;
background-repeat: no-repeat;
}
th,td{
font-family:"Times New Roman",Times,serif;
color:white;
font-size:12pt;
text-align:center;
font-style:normal;
font-weight:bold;
background-color: rgb(0,0,0,0.8);
border-collapse: collapse;
border:2px solid white;
}
h2{
  width: 500px;
  margin:auto;
  background-color: rgb(0,0,0,0.6);
  font-family: "times new roman","times","serif";
  color:white;
  font-style: normal;
  font-weight: bold;
  text-align: center;
  text-decoration: none;
  border-radius:15px 15px 15px 15px;
}
</style>
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
<h2>List of All Instructions</h2>
<table class="table table-bordered">

    <th>Sl No.</th>
    <th>Instruction ID</th>
    <th>Subject Code</th>
    <th>Instruction</th>
    <th>Total Marks</th>
    <th>Duration</th>
    <th>Date</th>
    <th>Operation</th>
    <th>Delete</th>
</tr>
<tr>
<tr>
<%
       int i = 0;
       ArrayList<Instructions> allinsts = InstructionsDao.getAllRecords();
      for(Instructions e : allinsts)
      {
	  
  
%>
   <tr>
  <td><%=++i%></td>
  <td><%=e.getInstId()%></td>
  <td><%=e.getSubjectCode()%></td>
  <td><%=e.getInstruction()%></td>
  <td><%=e.getTotalMarks()%></td>
  <td><%=e.getDuration()%></td>
  <td><%=e.getDate()%></td>
  <td><a href="updateinstruction.jsp?instid=<%=e.getInstId()%>">Update</a></td>
  <td><a href="deleteinstruction.jsp?instid=<%=e.getInstId()%>">Delete</a></td>

  </tr>
  <%
  }
  %>

</table>


</body>
</html>