<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="com.myproject.onlineexam.db.*"%>
        <%@page import="com.myproject.onlineexam.model.*"%>
        <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<title>Results</title>
<style>
body{
background-image:url('kbook.jpg');
 background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;

}
table {

  margin: 1.5em;
  margin-left:27%;
  margin-right:15%;
  width: 45%;
}
th,td{
 font-family:"times new roman","times","serif";
color:white;
font-size:13pt;
text-align:center;
font-style:normal;
font-weight:bold;
padding: 0.65em 2em;
background-color: rgb(0,0,0,0.8);
border-collapse: collapse;
border:2px solid white;
}
h2 {
  font-size: 30px;
  color: white;
  margin: 20px 0;
  font-weight: bolder;
  text-align: center;
  }
  p {
    font-size: 25px;
    color: white;
    font-weight: bolder ;
    margin: 20px 0;
    text-align: center;
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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<%
String[] dbans = new String[100];
ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords();
int i = 0;
int size = allQuestions.size();
int noans=0;
for(Questions e : allQuestions)
{

        dbans[i] = e.getAnswer();
          i++;


}


String[] userans = new String[100];

for(int j = 0 ; j < size ; j++)
{
	userans[j] = request.getParameter(Integer.toString(j));
}

int correctanswer=0;
int unattempted = 0;
int wronganswer=0;
for(int k = 0 ; k< size; k++)
{
	if(userans[k].equalsIgnoreCase(dbans[k]))
	{
		correctanswer++;
	}
	else if(userans[k].equals("e"))
	{
		unattempted++;
	}
	else
	{
		wronganswer++;
	}
}
int attemped = size - unattempted;
%>
 <h2> REPORT CARD </h2>
<%


%>
<table>
  <thead >
    <tr >
      <th colspan="2" scope="col"><p>Name: <%=session.getAttribute("name") %>  &ensp; ID : <%=session.getAttribute("studentId") %></p></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Total No. of Questions</td>
      <td><%=size %></td>
    </tr>
    <tr>
      <td>Number Of Questions Attempted</td>
      <td><%=attemped %></td>
    </tr>
    <tr>
      <td  >Number of Correct Answers</td>
      <td ><font color="yellow"><%=correctanswer %></font></td>
    </tr>
     <tr>
      <td>Number of Wrong Answers</td>
      <td ><font color="red"><%=attemped-correctanswer %></font></td>
    </tr>
  </tbody>
</table>
<center>
<input  onclick="location.href='StudentSubject.jsp'" type="button" value="Back" class="btn btn btn-danger btn-lg">
</center>

</body>
</html>