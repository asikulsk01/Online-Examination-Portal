<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="com.myproject.onlineexam.model.*"%>
<%@page import="com.myproject.onlineexam.db.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Student Profile Update </title>
 <link rel="stylesheet" href="./SCstyle.css">
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
        ArrayList<Students> studentList= StudentsDao.getAllRecords();
        for(Students sd : studentList)
        {if(request.getParameter("studentId").equals(sd.getStudentId()))
              {
  %>
		    <div class="container">
		   <center> <p>Update Your Profile </p></center>
		    <form action="StudentProfileUpdateNow.jsp">
		    <input type="hidden" value="<%=sd.getStudentId()%>" type="text" name="originalstudentId">
		    <br> <label for="others" >Password</label>
			<br><input type="text" value= "<%=sd.getPassword()%>" name="password" required ></input>
			<br><label for="others" >Email ID</label>
			<br><input type="text" value= "<%=sd.getEmail()%>"  name="email" required></input>
			<br><label for="others" > Contact No</label>
			<br><input type="text"  value="<%=sd.getContactNo()%>"  name="contactNo" required ></input>
			<br><label for="others" >Address</label>
			<br><input type="text"  value= "<%=sd.getAddress()%>" name="address" required ></input>
			<br><input type="submit" value="UPDATE" class="btn btn-outline-success">

</form>
<%
        }
        }
 %>

  <div class="drops">
    <div class="drop drop-1"></div>
    <div class="drop drop-2"></div>
    <div class="drop drop-3"></div>
    <div class="drop drop-4"></div>
    <div class="drop drop-5"></div>
  </div>
</div>
</body>
</html>