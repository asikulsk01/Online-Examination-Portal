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

<title>Update Student Data</title>
<style>
body{
    background-image:url('green.jpg');
}
h3{
  width: 500px;
  padding: 10px 0px 10px 0px;
    margin:auto;
  background-color:rgb(0,0,0,0.6);
  font-family: "times new roman","times","serif";
  color: white;
  font-style: normal;
  font-weight: bold;
  text-align: center;
  text-decoration: none;
  border-radius:15px 15px 0px 0px;
  }
table{
 width: 500px;
 margin: auto;
 font-family: sans-serif;
  color: white;
  font-size: 10pt;
  font-style: normal;
  font-weight: bold;
  text-align:center;
 background-color: rgb(0,0,0,0.6);
  border-collapse: collapse;
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
<h3>Update Students Data</h3>
<%

   ArrayList<Students> allstudents = StudentsDao.getAllRecords();
  for(Students e : allstudents)
  {  if(request.getParameter("studentId").equals(e.getStudentId()))
	{
      %>
		<table text-align= "center" cellpadding= "3">
			<form action="updatestudentnow.jsp">
			<input type="hidden" value="<%=e.getStudentId()%>" type="text" name="studentIdoriginal">

			<tr>
			<td><label for="other">NAME:<font color="red">*</font></label></td>
			<td> <input type="text" value=<%=e.getName() %> name="name" required></input>
			</td>
			</tr>
			 <tr>
             <td><label for="other">STUDENT ID:<font color="red">*</font></label></td>
             <td> <input type="text" value="<%=e.getStudentId()%>" name="studentId" required/>
            </td>
            </tr>

			<tr>
			<td><label for="other">PASSWORD:<font color="red">*</font></label></td>
			<td> <input type="text" value=<%=e.getPassword() %> name="password" required></input>
			</td>
			</tr>

			<tr>
			<td><label for="other">BATCH:<font color="red">*</font></label></td>
			<td> <input type="text" value=<%=e.getBatch() %> name="batch" required></input></td>
			</tr>

			<tr>
			<td> <label for:"other">COURSE:<font color="red">*</font></label></td>
			<td> <input type="text" value=<%=e.getCourse() %> name="course" required></input></td>
			</tr>

			<tr>
			<td> <label for:"other">REGISTRATION NO:<font color="red">*</font></label></td>
			<td> <input type="text" value=<%=e.getRegistrationNo() %> name="registrationNo" required></input></td>
			</tr>

			<tr>
			<td> <label for:"other">DEPARTMENT:<font color="red">*</font></label></td>
			<td> <input type="text" value=<%=e.getDepartment() %> name="department" required ></input></td>
			</tr>

			<tr>
			<td> <label for:"other">DATE OF BIRTH:<font color="red">*</font></label></td>
			<td> <input type="text" value=<%=e.getDob() %> name="dob" required></input></td>
			</tr>

			<tr>
			<td> <label for:"other">GENDER:<font color="red">*</font></label></td>
			<td>
			<input type="text" value=<%=e.getGender()%> name="gender" required/>
            </td>
			</tr>

			<tr>
			<td> <label for:"other">EMAIL:<font color="red">*</font></label></td>
			<td> <input type="text" value=<%=e.getEmail() %> name="email" required></input></td>
			</tr>

			<tr>
			<td> <label for:"other">CONTACT NO:<font color="red">*</font></label></td>
			<td> <input type="text" value=<%=e.getContactNo() %> name="contactNo" required></input></td>
			</tr>

			<tr>
			<td> <label for:"other">ADDRESS:<font color="red">*</font></label></td>
			<td> <input type="text" value=<%=e.getAddress() %> name="address" required></input></td>
			</tr>

			<tr>
			<td> <label for:"other">ADMISSION YEAR:<font color="red">*</font></label></td>
			<td> <input type="text" value=<%=e.getAdmissionYear() %> name="admissionYear" required></input></td>
			</tr>

			<tr>
			<td> <label for:"other">PASSOUT YEAR:<font color="red">*</font></label></td>
			<td> <input type="text" value=<%=e.getPassOutYear() %> name="passOutYear" required></input></td>
			</tr>

            <tr>
            <td colspan="15" align="center">
			<input type="submit" value="Update" class="btn btn-outline-success">

			</td>
			</tr>
			</form>
		</table>
    <%
	}
  }
    %>

</table>
</body>
</html>