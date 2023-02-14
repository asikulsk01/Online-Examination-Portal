<!DOCTYPE html>
<html>
<head>
<!--link href="bootstrap.min.css" rel="stylesheet" type="text/css"-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<style type="text/css" >
	body{
        padding:0;
        margin:0;
        background-image:url('ovallibrary.jpg');
        background-size: cover;
        background-repeat:no-repeat;
    }
    .loginbox{
        width:320px;
        height:420px;
        background-color: rgba(0,0,0,0.9);
        color:#fff;
        top:50%;
        left:50%;
        position:absolute;
        transform: translate(-50%, -50%);
        box-sizing: border-box;
        padding: 70px 30px;

    }
    .avatar{
        width:100px;
        height:100px;
        border-radius: 50%;
        position:absolute;
        top: -50px;
        left: calc(50% - 50px);
    }
    h1{
        margin:0;
        padding: 0 0 20px;
        text-align: center;
        font-size: 22px;
        font-family:Georgia, 'Times New Roman', Times, serif;
    }
    h4{
        margin:0;
        padding: 0 0 20px;
        text-align:center;
        font-size:15px;
        font-family:Georgia, 'Times New Roman', Times, serif;

    }
    .loginbox p{
        margin:0;
        padding:0;
        font-weight:bold;
        font-family:'Times New Roman', Times, serif;

    }
    .loginbox input{
        width:100%;
        margin-bottom: 20px;
    }
    .loginbox input[type="text"]
    {
        border:none;
        border-bottom:1px solid #fff;
        background:transparent;
        outline:none;
        height:40px;
        color:#fff;
        font-size:16px;
    }
    .loginbox input[type="submit"]
    {
       border:none;
       outline:none;
       height:40px;
       background:#fb2525;
       color:#fff;
       font-size:18px;
       font-weight:bold;
    }
    .loginbox input[type="button"]
    {
        text-align:right;
        color:white;
        border:none;
        box-sizing: none;
        font-weight:bold;
    }
    .loginbox input[type="password"]
    {
        border:none;
        border-bottom:1px solid #fff;
        background:transparent;
        outline:none;
        height:40px;
        color:#fff;
        font-size:16px;
    }


    </style>
<title>Admin Login</title>
</head>
<body>
<center>
<b>
            <font color="red" >
		<%
			if(request.getParameter("msg2") != null)
				out.print(request.getParameter("msg2"));
		%>
		</font>
			<font color="green" >
		<%
			if(request.getParameter("msg1") != null)
				out.print(request.getParameter("msg1"));
		%>
</b>
</center>
		</font>
		<!--AdminID Input-->
                    <div class="loginbox">
                        <img src="4056802.png" class="avatar">
                        <h1>Admin Login</h1>
                        <h4>Login Using Your Credentials</h4>
                        <form action="com.myproject.onlineexam.controller.ValidateAdmin" method="post">
                        <p>ADMIN ID</p>
                       <input type="text" name="adminId"  class="form-input">

                       <p>PASSWORD</p>
                       <input type="password"  name="password"  class="form-input">
                       <input type="submit" value="LOGIN" class="btn btn-primary btn-lg btn-block btn-sm">

                       <input  onclick="location.href='index.html'" type="button" value= "HOME" class="btn btn-link btn-sm float-right">
                       </form>
                    </div>

</body>
</html>