<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.myproject.onlineexam.model.*"%>
<%@page import="com.myproject.onlineexam.db.*"%>
<%@page import="java.util.ArrayList"%>
<!doctype html>
<html>
<head>
 <meta charset='utf-8'>
 <meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Admin Profile</title>
<link href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css' rel='stylesheet'>
<link href='https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css' rel='stylesheet'>
<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style>
body {
    background-color: #f9f9fa;
    background-image: url("bg.png");
    background-repeat: no-repeat;
    background-size: cover;
}

.padding {
    padding: 2rem; !important
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
    border-radius: 5px 0 0 5px;
}

.bg-c-lite-green {
    background: -webkit-gradient(linear, left top, right top, from(#360033), to(#0b8793));
    background: linear-gradient(to right, #360033, #0b8793);
}

.user-profile {
    padding: 10px 0;
}

.card-block {
    padding: 1rem;
}

.m-b-25 {
    margin-bottom: 25px;
}

.img-radius {
    border-radius: 5px;
}

h6 {
    font-size: 14px;
}

.card .card-block p {
    line-height: 25px;
}

@media only screen and (min-width: 1400px) {
    p {
        font-size: 14px;
    }
}

.card-block {
    padding: 1.25rem;
}

.b-b-default {
    border-bottom: 1px solid #e0e0e0;
}

.m-b-20 {
    margin-bottom: 10px;
}

.p-b-5 {
    padding-bottom: 5px; !important
}

.card .card-block p {
    line-height: 15px;
}

.m-b-10 {
    margin-bottom: 15px;
}

.text-muted {
    color: #919aa3; !important
}

.b-b-default {
    border-bottom: 1px solid #e0e0e0;
}

.f-w-600 {
    font-weight: 600;
}

.m-b-20 {
    margin-bottom: 20px;
}



.p-b-5 {
    padding-bottom: 5px; !important
}

.m-b-10 {
    margin-bottom: 10px;
}




</style>
</head>
<body oncontextmenu='return false' class='snippet-body'>
<% if(session.getAttribute("adminId") !=null)
	{

	}
else
{
	String msg2 = "Please Login as Admin to Continue";
	response.sendRedirect("AdminLogin.jsp?msg2="+msg2);
}
	%>
<%
   String adminId = AdminsDao.getAdminName(session.getAttribute("adminId").toString());
%>
 <div class="page-content page-container" id="page-content">
    <div class="padding">
        <div class="row container d-flex justify-content-center">
            <div class="col-xl-6 col-md-12">
                <div class="card user-card-full">
                    <div class="row m-l-0 m-r-0">
                        <div class="col-sm-4 bg-c-lite-green user-profile">
                            <div class="card-block text-center text-white">
                                <div class="m-b-25"> <img src="https://img.icons8.com/fluent/100/000000/admin-settings-male.png" class="img-radius" alt="User-Profile-Image"> </div>
                                <h4 class="f-w-600"><% out.println(adminId +"'s Profile");%></h4>

                            </div>
                        </div>
      <%
            ArrayList<Admins> adminList= AdminsDao.getAllRecords();
            for(Admins ad : adminList) {
            if(adminId.equals(ad.getAdminName()))
                      {
        %>
    <div class="col-sm-8">
                                <div class="card-block">
                                    <h6 class="m-b-20 p-b-5 b-b-default f-w-600"> Admin  ID:  <%=ad.getAdminId()%></h6>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Name</p>
                                            <h6 class="text-muted f-w-400"><%=ad.getAdminName()%></h6>
                                        </div>
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Password</p>
                                            <h6 class="text-muted f-w-400"><%=ad.getPassword()%></h6>
                                        </div>

                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Date Of Birth</p>
                                            <h6 class="text-muted f-w-400"><%=ad.getAdminDob()%></h6>
                                        </div>
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Gender</p>
                                            <h6 class="text-muted f-w-400"><%=ad.getAdminGender()%></h6>
                                        </div>
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Email</p>
                                            <h6 class="text-muted f-w-400"><%=ad.getAdminEmail()%></h6>
                                        </div>
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Phone</p>
                                            <h6 class="text-muted f-w-400"><%=ad.getAdminContactNo()%></h6>
                                        </div>

                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Address</p>
                                            <h6 class="text-muted f-w-400"><%=ad.getAdminAddress()%></h6>
                                        </div>
                                        <div class="col-sm-6">
                                             <p class="m-b-10 f-w-600"></p>
                                             <h6 class="text-muted f-w-400"> <a href="adminprofileupdate.jsp?adminId=<%=ad.getAdminId()%>">Edit</a></h6>
                                         </div>
                                    </div>

    <%
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