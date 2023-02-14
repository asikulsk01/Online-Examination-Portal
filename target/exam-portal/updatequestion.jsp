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
<title>Update Question</title>
<style>
body{
    background-image:url('laptop.jpg');
    background-size: cover;
}
h3{
  width: 500px;
  padding: 10px 0px 10px 0px;
    position:absolute;
    top:10%;
    left:30%;
  background-color:rgb(0,0,0,0.8);
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
top:18%;
left:30%;
 font-family: sans-serif;
  color: white;
  font-size: 10pt;
  font-style: normal;
  font-weight: bold;
  text-align:center;
 background-color: rgb(0,0,0,0.8);
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
<h3>Update questions</h3>
<%

   ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords();
  for(Questions e : allQuestions)
  {  if(request.getParameter("ques").equals(e.getQuestion()))
	{
      %>
            <table align="center" cellpadding="10">
			<form action="updatequestionnow.jsp">
			<input type="hidden" value="<%=e.getQuestion()%>" type="text" name="quesoriginal">
			<input type="hidden" value="<%=e.getSubjectCode()%>" type="text" name="orgsubcode">
            <tr>
            <td> <label for="other">QUESTION:<font color="red">*</font></label></td>
			<td> <input type="text" value="<%=e.getQuestion()%>" name="quesmodified"></input> </td>
			</tr>
			<tr>
			<td><label for="other">OPTION A:<font color="red">*</font></label></td>
			<td> <input type="text" value=<%=e.getA() %> name="opta" ></input></td>
			</tr>
			<tr>
			<td><label for="other">OPTION B:<font color="red">*</font></label></td>
			<td> <input type="text" value=<%=e.getB() %> name="optb" ></input></td>
			</tr>
			<tr>
			<td><label for="other">NAME:<font color="red">*</font></label></td>
			<td> <input type="text" value=<%=e.getC() %> name="optc" ></input></td>
			</tr>
			<tr>
			<td><label for="other">NAME:<font color="red">*</font></label></td>
			<td> <input type="text" value=<%=e.getD() %> name="optd" ></input></td>
			</tr>
			<tr>
			<td><label for="other">NAME:<font color="red">*</font></label></td>
			<td> <input type="text" value=<%=e.getAnswer() %> name="ans" ></input></td>
			</tr>
			<tr>
			<td colspan="10" align="center">
			<input type="submit" value="Update" class="btn btn-outline-success">
			</tr>
			</form>
			</table>

    <%	
	}
	else
	{ 
	%> <%--  <tr>
  <td><%=i++%></td>
  <td><%=e.getQuestion() %></td>
  <td><%=e.getA()%></td>
  <td><%=e.getB()%></td>
  <td><%=e.getC()%></td>
  <td><%=e.getD()%></td>
  <td><%=e.getAnswer()%></td>
  <td><a href="updatequestion.jsp?ques=<%=e.getQuestion()%>">Update</a></td>
  </tr> --%>
  <%
  }
  }
  %>


</body>
</html>