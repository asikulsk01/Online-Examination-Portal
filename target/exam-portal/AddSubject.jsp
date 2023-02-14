<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Subject Insertion</title>
<style>
body{
background-image:url('books.jpg')
}
h1{
      width: 500px;
     padding: 10px 0px 10px 0px;
    position:absolute;
    top:10%;
    left:30%;
  background-color: rgb(0,0,0,0.5);
  font-family: "times new roman","times","serif";
  color:white;
  font-style: normal;
  font-weight: bold;

  text-align: center;
  text-decoration: none;
  border-radius:15px 15px 0px 0px;
}

table{
width: 500px;
position:absolute;
top:20%;
left:30%;
font-family: sans-serif;
  color:white;
  font-size: 10pt;
  font-style: normal;
  font-weight: bold;
  text-align: center;
 background-color: rgb(0,0,0,0.5);
  border-collapse: collapse;
  border-radius:0px 0px 15px 15px;

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
<h1>Add New Subject</h1>
<form action="com.myproject.onlineexam.controller.SubjectInsert">
<table align="center" cellpadding="15">
<tr>
<td><label for="other">Subject ID: <font color="red">*</font></label></td>
<td><input type="text" name="subid" required></td>
</tr>

<tr>
<td><label for="other">Subject Code: <font color="red">*</font></label></td>
<td><input type="text" name="subcode" required></td>
</tr>

<tr>
<td><label for="other">Subject Name: <font color="red">*</font></label></td>
<td><input type="text" name="subname" required></td>
</tr>

<tr>
<td colspan="10" align="center"><input type="submit" value="Add" class="btn btn-outline-success"></td>
</tr>
</table>

</form>

<center>
<b>
<div>
<font color="red" >
		<%
			if(request.getParameter("msg2") != null)
				out.print(request.getParameter("msg2"));
		%>
		</font>
			<font color="white" >
		<%
			if(request.getParameter("msg1") != null)
				out.print(request.getParameter("msg1"));
		%>
		</font>
		</div>
</b>
</center>
</center>
</body>
</html>