<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Panel</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="sidestyle.css">
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
    <iframe name="header" src="studentpanelheader.html" width="100%" height="15%" style="border:none;"></iframe>
    <iframe name="menu_page" src="studentmenu.html" style="border:none;" width="15%" height="85%" align="left"></iframe>
	<iframe name="main_page" align="left" height="85%" width="85%" style="border:none;"></iframe>
</body>
</html>