<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="com.myproject.onlineexam.db.*"%>
        <%@page import="com.myproject.onlineexam.model.*"%>
        <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Question List</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<style type="text/css">

*, *:before, *:after {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  background: #1a89ab;
  font-family: 'Open Sans', sans-serif;
}
table {
  background: #02516b;
  border-radius: 0.25em;
  border-collapse: collapse;
  margin: 1em;
}
.center {
  margin-left: auto;
  margin-right: auto;
}
th {
  border-bottom: 1px solid #364043;
  color: #E2B842;
  font-size: 1em;
  font-weight: 600;
  padding: 0.5em 1em;
  text-align: left;
}
td {
  color: #fff;
  font-weight: 400;
  padding: 0.65em 1em;
}
.disabled td {
  color: #4F5F64;
}
tbody tr {
  transition: background 0.25s ease;
}
tbody tr:hover {
  background: #014055;
}
</style>
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
<center><h3><pre><font color="White">Questions are listed Below</font></pre></h3></center>
<table class="center">
<th><input type="hidden"></th><th><input type="hidden"></th><th><input type="hidden"></th><th><input type="hidden"></th><th><input type="hidden"></th><th><input type="hidden"></th>
<th><input type="hidden"></th><th><input type="hidden"></th><th>
<th colspan="4"><input type="button" value="Add Question" class="btn btn-success float-left" onclick="location.href='AddQuestion.jsp'"></th>

<th colspan="4">
<tr>
  <th>Sl No.</th>
  <th>Question ID</th>
  <th>Subject Code</th>
  <th>Question</th>
  <th>Option A </th>
  <th>Option B </th>
  <th>Option C </th>
  <th>Option D </th>
  <th>Correct Answer</th>
  <th>Update</th>
  <th>Delete</th>
</tr>
<tr>
<%
   session.setAttribute("subcod", request.getParameter("subcode"));
   int i = 1;
   ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords();
  for(Questions e : allQuestions)
  {   if(request.getParameter("subcode").equals(e.getSubjectCode()))
      {
  %>
   <tr>
          <input type="hidden" value="<%=e.getSubjectCode()%>" type="text" name="subcode">
          <td><%=i++%></td>
          <td><%=e.getQuestionId() %></td>
          <td><%=e.getSubjectCode() %></td>
          <td><%=e.getQuestion() %></td>
          <td><%=e.getA()%></td>
          <td><%=e.getB()%></td>
          <td><%=e.getC()%></td>
          <td><%=e.getD()%></td>
          <td><%=e.getAnswer()%></td>
          <td><a href="updatequestion.jsp?ques=<%=e.getQuestion()%>">Update</a></td>
          <td><a href="deletequestion.jsp?quesid=<%=e.getQuestionId()%>&subcode=<%=e.getSubjectCode()%>">Delete</a></td>
          </tr>
 <%
        }
        else{
        }
     }
     %>

</table>
</body>
</html>