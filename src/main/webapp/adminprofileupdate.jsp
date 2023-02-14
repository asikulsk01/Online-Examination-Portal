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

<title>Admin Profile Update </title>
<style>
body{
    background-image:url('keyboard.jpg');
    background-size:cover;
    background-repeat:no-repeat;
}
h3{
      width: 500px;
      padding: 10px 0px 10px 0px;
      position:absolute;
      top:12%;
      left:30%;
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
     position:absolute;
     top:20%;
     left:30%;
     font-family: sans-serif;
     color: white;
     font-size: 10pt;
     font-style: normal;
     font-weight: bold;
     text-align:center;
     background-color: rgb(0,0,0,0.6);
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

  <h3>Update Your Profile</h3>


    <%
        ArrayList<Admins> adminList= AdminsDao.getAllRecords();
        for(Admins ad : adminList)
        {if(request.getParameter("adminId").equals(ad.getAdminId()))
                  {
    %>
	<table align="center" cellpadding="10">
	    <form action="adminprofileupdatenow.jsp">
		    <input type="hidden" value="<%=ad.getAdminId()%>" type="text" name="originaladminId">

            <tr>
            <td><label for="other">NAME:<font color="red">*</font></label></td>
            <td><input type="text" value=<%=ad.getAdminName()%> name="adminName" ></input></td>
            </tr>

            <tr>
            <td><label for="other">PASSWORD:<font color="red">*</font></label></td>
            <td><input type="text" value=<%=ad.getPassword()%> name="password" ></input></td>
            </tr>

            <tr>
            <td><label for="other">DATE OF BIRTH:<font color="red">*</font></label></td>
            <td><input type="text" value=<%=ad.getAdminDob()%> name="adminDob" ></input></td>
            </tr>

            <tr>
            <td><label for="other">GENDER:<font color="red">*</font></label></td>
            <td><input type="text" value=<%=ad.getAdminGender()%> name="adminGender" ></input></td>
            </tr>

            <tr>
            <td><label for="other">EMAIL:<font color="red">*</font></label></td>
            <td><input type="text" value=<%=ad.getAdminEmail()%> name="adminEmail"></input></td>
            </tr>

            <tr>
            <td><label for="other">CONTACT NO:<font color="red">*</font></label></td>
            <td><input type="text" value=<%=ad.getAdminContactNo()%> name="adminContactNo" ></input></td>
            </tr>

            <tr>
            <td><label for="other">ADDRESS:<font color="red">*</font></label></td>
            <td><input type="text" value=<%=ad.getAdminAddress()%> name="adminAddress" ></input></td>
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