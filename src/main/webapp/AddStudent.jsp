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


<title>Student Registration</title>

<style>
body{
background-image:url('leaves.jpg');
background-size: cover;
}

    h2{
      width: 500px;
     padding: 10px 0px 10px 0px;
    margin:auto;
  background-color: rgb(0,0,0,0.6);
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
margin:auto;
font-family: sans-serif;
  color:white;
  font-size: 10pt;
  font-style: normal;
  font-weight: bold;
  text-align: center;
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
<form action="com.myproject.onlineexam.controller.StudentInsert">
<h2>STUDENT REGISTRATION</h2>


<table text-align="center" cellpadding = "3">


<tr>
<td><label for="other">NAME:<font color="red">*</font></label></td>
<td><input type="text" name="name" required/>
</td>
</tr>

<tr>
<td><label for="other">STUDENT ID:<font color="red">*</font></label></td>
<td><input type="text" name="studentId" required/>
</td>
</tr>

<tr>
<td><label for="other">PASSWORD:<font color="red">*</font></label></td>
<td><input type="text" name="password" required/>
</td>
</tr>

<tr>
<td><label for="other">BATCH:<font color="red">*</font></label></td>
<td><input type="text" name="batch" required/>
</td>
</tr>

<tr>
<td><label for="other">COURSE:<font color="red">*</font></label></td>
<td><input type="text" name="course" required/>
</td>
</tr>

<tr>
<td><label for="other">REGISTRATION NO:<font color="red">*</font></label></td>
<td><input type="text" name="registrationNo" required/>
</td>
</tr>

<tr>
<td><label for="other">DEPARTMENT:<font color="red">*</font></label></td>
<td><input type="text" name="department" required/>
</td>
</tr>


<tr>
<td><label for="other">DATE OF BIRTH:<font color="red">*</font></label></td>
<td><input type="text" name="dob" required/>
</td>
</tr>

<tr>
<td><label for="other">GENDER:<font color="red">*</font></label></td>
<td>
<input type="radio" name="gender" value="Male" required/> Male
<input type="radio" name="gender" value="Female" required/> Female
<input type="radio" name="gender" value="Others" required/> Others
</td>
</tr>


<tr>
<td><label for="other">EMAIL ID:<font color="red">*</font></label></td>
<td><input type="text" name="email" required/></td>
</tr>


<tr>
<td><label for="other">MOBILE NUMBER:<font color="red">*</font></label></td>
<td>
<input type="text" name="contactNo" required/>
</td>
</tr>

<tr>
<td><label for="other">ADDRESS:<font color="red">*</font></label></td>
<td><input type="text" name="address" required/></td>
</tr>

<tr>
<td><label for="other">ADMISSION YEAR:<font color="red">*</font></label></td>
<td><input type="text" name="admissionYear" required/>
</td>
</tr>

<tr>
<td><label for="other">PASSOUT YEAR:<font color="red">*</font></label></td>
<td><input type="text" name="passOutYear" required/>
</td>
</tr>

<tr>
<td colspan="10" align="center">
<input type="submit" value="Register" class="btn btn btn-outline-success">


</td>
</tr>
</table>

</form>

</body>
</html>

        </form>
    </div>

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