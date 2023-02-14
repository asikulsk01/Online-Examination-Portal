<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="com.myproject.onlineexam.model.*"%>
<%@page import="com.myproject.onlineexam.db.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
 <meta charset='utf-8'>
                                <meta name='viewport' content='width=device-width, initial-scale=1'>
                                <title>Student instruction </title>
                                <link href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css' rel='stylesheet'>
                                <link href='https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css' rel='stylesheet'>
                                <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>

<style>
body {
    background-color: #f9f9fa;
    background-image: url("exam.png");
    background-position: center;
      background-repeat: no-repeat;
      background-size: cover;
      position: relative;
}

.padding {
    padding: 10rem; !important
}

.user-card-full {
    overflow: hidden;
}

.card {
    border-radius: 3px;
    -webkit-box-shadow: 0 1px 20px 0 rgba(69, 90, 100, 0.08);
    box-shadow: 0 1px 20px 0 rgba(69, 90, 100, 0.08);
    border: none;
    margin-bottom: 30px;
}

.m-r-0 {
    margin-right: 0px;
}

.m-l-0 {
    margin-left: 0px;
}

.user-card-full .user-profile {
    border-radius: 10px 0 0 10px;
}

.bg-c-lite-green {
    background: -webkit-gradient(linear, left top, right top, from(#360033), to(#0b8793));
    background: linear-gradient(to right, #ffd1b3, #ff704d);
}

.user-profile {
    padding: 10px 0;
}

.card-block {
    padding: 4.5rem;
}

.m-b-25 {
    margin-bottom: 35px;
}



h6 {
    font-size: 14px;
}

.card .card-block p {
    line-height: 35px;
}

@media only screen and (min-width: 1400px) {
    p {
        font-size: 14px;
    }
}

.card-block {
    padding: 1.0rem;
}

.b-b-default {
    border-bottom: 1px solid #e0e0e0;
}

.m-b-20 {
    margin-bottom: 15px;
}

.p-b-5 {
    padding-bottom: 5px; !important
}

.card .card-block p {
    line-height: 25px;
}

.m-b-10 {
    margin-bottom: 25px;
}

.text-muted {
    color: #919aa3; !important
}

.b-b-default {
    border-bottom: 1px solid #e0e0e0;
}

.f-w-600 {
    font-weight: 500;
}

.m-b-20 {
    margin-bottom: 20px;
}



.p-b-5 {
    padding-bottom: 15px; !important
}

.m-b-10 {
    margin-bottom: 15px;
}

</style>
</head>
<body  oncontextmenu='return false' class='snippet-body'>
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
<%
   int i = 1;
   ArrayList<Instructions> allinsts = InstructionsDao.getAllRecords();
   if(allinsts != null && !allinsts.isEmpty()) {
        for(Instructions e : allinsts) {
         if(request.getParameter("subcode").equals(e.getSubjectCode()))
              {
%>
<input type="hidden" name="subcode" value="<%=e.getSubjectCode() %>">
<div class="page-content page-container" id="page-content">
    <div class="padding">
        <div class="row container d-flex justify-content-center">
            <div class="col-xl-6 col-md-12">
                <div class="card user-card-full">
                    <div class="row m-l-0 m-r-0">
                    <div class="col-sm-4 bg-c-lite-green user-profile">
                      <div class="card-block text-center text-white">
                      <div class="m-b-25"><font color="black"><b><u>INSTRUCTION</u></b></font></div>
                       <h6 ><font color="black"><%=e.getInstruction()%></font></h6>
                        </div>
                        </div>


                        <div class="col-sm-8">
                                <div class="card-block">
                                    <h6 class="m-b-20 p-b-5 b-b-default f-w-600"> Subject Code  <%=e.getSubjectCode()%></h6>
                                    <div class="row">
                                          <div class="col-sm-6">
                                             <p class="m-b-10 f-w-600">Subject Name </p>
                                             <h6 class="text-muted f-w-400"><%=request.getParameter("subname")%></h6>
                                         </div>
                                         <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Marks </p>
                                            <h6 class="text-muted f-w-400"><%=e.getTotalMarks()%></h6>
                                        </div>

                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Duration</p>
                                            <h6 class="text-muted f-w-400"> <%=e.getDuration()%></h6>
                                        </div>
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Date </p>
                                            <h6 class="text-muted f-w-400"> <%=e.getDate()%></h6>

                                        </div>

                                        <div class="col-sm-6">
                                             <p class="m-b-10 f-w-600"></p>
                                             <h6 class="text-muted f-w-400"><button type="button" class="btn btn-outline-success btn-sm float-right" onclick="location.href='Exam.jsp?subcode=<%=request.getParameter("subcode")%>'">Start Test</button></h6>
                                         </div>
                                    </div>
                <%
                }
                else{
                }
        }
  }
  %>
</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>