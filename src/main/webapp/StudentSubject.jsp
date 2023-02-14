<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.myproject.onlineexam.db.*"%>
            <%@page import="com.myproject.onlineexam.model.*"%>
            <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>View Subjects</title>
<style>
body{
background-image:url('pic.jpg');
 background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}
table {
  background:  ;
  border-radius: 2.5 em;
  border-collapse: collapse;
  margin: 2.7rem;
  width: 90%;
}
th,td{
 font-family:"times new roman","times","serif";
color:white;
font-size:12pt;
text-align:center;
font-style:normal;
font-weight:bold;
padding: 0.65em 1em;
background-color: rgb(0,0,0,0.8);
border-collapse: collapse;
border:2px solid white;
}
h2 {
  width: 500px;
  margin:auto;
  padding: 10px 0px 10px 0px;
  background-color: rgb(0,0,0,0.6);
  font-family: "times new roman","times","serif";
  color:white;
  font-style: normal;
  font-weight: bold;
  text-align: center;
  text-decoration: none;
  border-radius:15px 15px 15px 15px;
  }

a:link {
  text-decoration: none;
}
</style>
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
   String username = StudentsDao.getStudentName(session.getAttribute("studentId").toString());
%>

     <h2> Welcome <% out.println(username); %> , your Subjects are</h2>


<table >
    <tr>
        <th >Subject Code</th>
        <th>Subject Name</th>
        <th >Take Quiz</th>
        <th>Status</th>
    </tr>
    <%
        ArrayList<Subjects> subjectList= SubjectsDao.getAllRecords();
        for(Subjects subject : subjectList) {
    %>
    <tr>
        <td><%=subject.getSubjectcode()%></td>
        <td><%=subject.getSubjectname()%></td>
        <td><a href="StudentInstructions.jsp?subcode=<%=subject.getSubjectcode()%>&subname=<%=subject.getSubjectname()%>" style="color: yellow"  >Go to Instruction Page</td>
        <td><font color="Green">Active</font></td>

    </tr>
    <%
        }
    %>


</table>
</body>
</html>