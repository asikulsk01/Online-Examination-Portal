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
<title>Admin Entry</title>
<style>
body{
    background-image:url('1.jpg');
}
    h1{
          width: 400px;
          position:relative;
          top:90px;
          left:450px;
          padding: 10px 0px 10px 0px;
          background-image:url('1.jpg');
          font-family: "times new roman","times","serif";
          font-size: 25px;
          color: #ffffff;
          font-style: normal;
          font-weight: bold;
          text-align: center;
          text-decoration: none;
          border: 3px solid black;

    }
table{
  width: 400px;
  position: relative;
  top:80px;
  left: 450px;
  font-family: "times new roman","times","serif";
  color:white;
  font-size: 10pt;
  font-style: normal;
  font-weight: bold;
  text-align: center;
  background-image:url('blue.jpg');
  background-size: cover;
  border-collapse: collapse;
  border: 2px solid black;
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
<form action="com.myproject.onlineexam.controller.AdminInsert">
<h1>Enter Admin Details</h1>
<table text-align="center" padding="30">
<td>
<td>
<tr>
<td><label for="other">ADMIN ID:<font color="red">*</font></label></td>
<td><input type="text" name="adminId" required/>
</td>
</tr>

<tr>
<td><label for="other">PASSWORD:<font color="red">*</font></label></td>
<td><input type="text" name="password" required/>
</td>
</tr>
<tr>
<td><label for="other">ADMIN NAME:<font color="red">*</font></label></td>
<td><input type="text" name="adminName" required/>
</td>
</tr>
<tr>
<td><label for="other">EMAIL:<font color="red">*</font></label></td>
<td><input type="text" name="adminEmail" required/>
</td>
</tr>
<tr>
<td><label for="other">CONTACT NO:<font color="red">*</font></label></td>
<td><input type="text" name="adminContactNo" required/>
</td>
</tr>
<tr>
<td><label for="other">ADDRESS:<font color="red">*</font></label></td>
<td><input type="text" name="adminAddress" required/>
</td>
</tr>
<tr>
<td><label for="other">DATE OF BIRTH:<font color="red">*</font></label></td>
<td><input type="text" name="adminDob" required/>
</td>
</tr>
<tr>
<td><label for="other">GENDER:<font color="red">*</font></label></td>
<td>
<input type="radio" name="adminGender" value="Male" required/> MALE
<input type="radio" name="adminGender" value="Female" required/> FEMALE
<input type="radio" name="adminGender" value="OTHERS" required/> OTHERS
</td>
</tr>
</td>
</td>

<td>
<td>
<td>
<tr>
<td colspan="20" align="center">
<input type="submit" value="ADD" class="btn btn btn-outline-success">
</td>
</tr>
</td>
</td>
</td>

</form>
<center>
<b>
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
</b>
</center>
</center>
</body>
</html>