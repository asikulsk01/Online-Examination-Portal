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
<title>Add Question</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <style>
      html, body {
      min-height: 100%;
      }
      body, div, form, input, select, p {
      padding: 0;
      margin: 0;
      outline: none;
      font-family: Roboto, Arial, sans-serif;
      font-size: 16px;
      color: #eee;
      }
      body {
      background: url("/uploads/media/default/0001/01/b5edc1bad4dc8c20291c8394527cb2c5b43ee13c.jpeg") no-repeat center;
      background-size: cover;
      background-color: #7F525D;
      }
      h1, h2 {
      text-transform: uppercase;
      font-weight: 200;
      }
      h2 {
      margin: 0 0 0 8px;
      }
      .main-block {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      height: 100%;
      padding: 25px;
      background: rgba(0, 0, 0, 0.0);
      }
      .left-part, form {
      padding: 20px;
      }
      .left-part {
      text-align: center;
      }
      .fa-graduation-cap {
      font-size: 65px;
      }
      form {
      background: rgba(0, 0, 0, 0.8);
      }
      .title {
      display: flex;
      align-items: center;
      margin-bottom: 15px;
      }
      .info {
      display: flex;
      flex-direction: column;
      }
      input, select,label {
      padding: 5px;
      margin-bottom: 10px;
      background: transparent;
      border: none;
      border-bottom: 1px solid #eee;
      }
      input::placeholder {
      color: #eee;
      }
      option:focus {
      border: none;
      }
      option {
      background: black;
      border: none;
      }

      @media (min-width: 568px) {
      html, body {
      height: 100%;
      }
      .main-block {
      flex-direction: row;
      height: calc(100% - 50px);
      }
      .left-part, form {
      flex: 1;
      height: auto;
      }
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
    <div class="main-block">
      <div class="left-part">
        <i class="fas fa-graduation-cap"></i>
        <h1>Enter Questions to Respective Subjects</h1>
        <p></p>

      </div>
      <form action="com.myproject.onlineexam.controller.QuestionInsert">
        <div class="title">
          <i class="fas fa-pencil-alt"></i>
          <h2>Enter Your Question Here</h2>
        </div>
          <input type="hidden" name="subjectcode" value="<%out.print(session.getAttribute("subcod"));%>" required> <br>
          <label>Subject Code: <%out.print(session.getAttribute("subcod"));%></label><br>
          <input type="text" name="questionid" placeholder="Question ID" required><br>
          <input type="text" name="question" placeholder="Question" required><br>
          <input type="text" name="option1" placeholder="Option A:" required><br>
          <input type="text" name="option2" placeholder="Option B:" required><br>
          <input type="text" name="option3" placeholder="Option C:" required><br>
          <input type="text" name="option4" placeholder="Option D:" required><br>
           <label>Correct Answer:</label> <select name="answer" required>
                      <option value="a">Option A</option>
                      <option value="b">Option B</option>
                      <option value="c">Option C</option>
                      <option value="d">Option D</option>
           </select>

             <input type="submit" value="Submit" class="btn btn-primary btn-lg btn-block btn-sm">
</div>
</form>
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
</body>
</html>