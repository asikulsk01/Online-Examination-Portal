
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.myproject.onlineexam.model.*"%>
 <%@page import="com.myproject.onlineexam.db.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


<HTML>
    <HEAD>
        <TITLE>Examination </TITLE>

      <script>
      <%
      String clock = request.getParameter("clock");
      if(clock == null)
    	  clock = "1000";
      %>
      var timeout = <%=clock %>
      function timer()
      {
    	  if( timeout > 0)
    		  {
    		  timeout--;
    		  document.forma.clock.value ="Time Over";
    	      document.forma.clock.value = timeout;
    		  window.setTimeout("timer()", 300 );
    		  }
    	  else
    		  {
    		  document.forma.clock.value ="Time Over";
    		  formb.submit();
    		  }
      }
      </script>

    <style>
    input[type="radio"] {
      margin-right: 10px;
    }
    label {
      margin-left: 20px;
    }
    table{
        background-color: rgb(0,0,0,0.3);
        width: 700px;
        color: white;
        border-collapse: collapse;
    }
    tr,td{
            background-color: rgb(0,0,0,0.3);
            color: white;
            border-collapse: collapse;
        }
    body{
        background-image: url('quizbook.png');
        background-size: cover;
        background-repeat: no-repeat;

    }
    .button{
    text-align:right;
    padding:8px;
    color:green;

    border:none;
    box-sizing: none;
    font-weight:bold;
    border:3px solid green;
    }
    .button:hover{
    background-color:green;
    color:white;
    }

    </style>

    </HEAD>
<BODY onload="timer()" >
   <form name="forma" action="<%=request.getRequestURL()%>">

     <font color="yellow"><b>Time Left <input size="4" name="clock" id="fno" value="<%=clock%>" style="background: #ffcdd2" readonly></b></font>
  
   </form>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<form action="Result.jsp" name="formb">
<font color="yellow"><strong>Questions Left: </strong></font>

<table align="center" class="table ">

<%
   int i = 1;

   int radioname = 0;
   ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords();
  for(Questions e : allQuestions)
  {

	  %><%=i%><%
  %>
 <tr>   <td><input type="hidden"></td> </tr><tr>   <td></td> </tr> <tr>   <td></td> </tr><tr>   <td></td> </tr><tr>   <td></td> </tr><tr>   <td></td> </tr><tr>   <td></td> </tr><tr>   <td></td> </tr>
  <tr>
      <td><font size="4"> <B><%=i++%>.  <%=e.getQuestion() %><B></font> </td>
  </tr>

   <tr>   <td><label>(a) </label>  <input type="radio" value="a" name="<%=radioname%>"><b><%=e.getA()%></b></td> </tr>
   <tr>   <td><label>(b) </label>  <input type="radio" value="b" name="<%=radioname%>"><b><%=e.getB()%></b></td> </tr>
   <tr>   <td><label>(c) </label>  <input type="radio" value="c" name="<%=radioname%>"><b><%=e.getC()%></b></td> </tr>
   <tr>   <td cellpadding="5"><label>(d) </label>  <input type="radio" value="d" name="<%=radioname%>"><b><%=e.getD()%></b></td> </tr>

   <tr>   <td><input type="hidden"></td> </tr><tr>   <td></td> </tr> <tr>   <td></td> </tr><tr>   <td></td> </tr><tr>   <td></td> </tr><tr>   <td></td> </tr><tr>   <td></td> </tr><tr>   <td></td> </tr>

<tr><input type="radio" value="e" name="<%=radioname %>" checked="checked" name=<%=radioname %>></tr>

  <%
      radioname++;
     }

  %>
  <br>
  </table>
  <td colspan="4">
     <center><input class="button" type="submit" value="Submit"></center>
  </td>

  </form>
    </BODY>
</HTML>