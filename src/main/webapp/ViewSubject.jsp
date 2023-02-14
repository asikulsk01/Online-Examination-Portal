<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.myproject.onlineexam.db.*"%>
            <%@page import="com.myproject.onlineexam.model.*"%>
            <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>View Subjects</title>
<style>
body{
background-image:url('bookshelf.jpg');
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
background-color: rgb(0,0,0,0.7);
border-collapse: collapse;
border:2px solid white;
}
h1{
  width: 500px;
  margin:auto;
  background-color: rgb(0,0,0,0.06);
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
<h1>Subject List</h1>

<table class="table table-bordered">
<input type="button" value="All Questions" class="btn btn-success float-right" onclick="location.href='AllQuestions.jsp'">

    <tr>
        <th>Subject ID</th>
        <th>Subject Code</th>
        <th>Subject Name</th>
        <th>Add Questions</th>
        <th>Modify</th>
        <th>Remove</th>
    </tr>
    <%
        ArrayList<Subjects> subjectList= SubjectsDao.getAllRecords();
        for(Subjects subject : subjectList) {
    %>
    <tr>
        <td><%=subject.getSubjectID()%></td>
        <td><%=subject.getSubjectcode()%></td>
        <td><%=subject.getSubjectname()%></td>


        <td><a href="QuestionList.jsp?subcode=<%=subject.getSubjectcode()%>">Add Questions</td>
        <td><a href="updatesubject.jsp?subid=<%=subject.getSubjectID()%>">Edit</td>
        <td><a href="deletesubject.jsp?subcode=<%=subject.getSubjectcode()%>">Delete</td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>