<html>
<head>
<%
if(session.getAttribute("adminid") == null)
{
response.sendRedirect("index.jsp");
}

%>
	<title> Admin Panel</title>
	<style> 
		
		
		@import url('https://fonts.googleapis.com/css2?family=Archivo+Black&display=swap');
		*{font-family: 'Archivo Black', sans-serif;text-decoration:none;margin:0px;padding:0px;}
		.button{background-color:#31c766;color:white;height:60px ; width:200px;font-size:20px;margin:18px;} 
		.upper{background-color:#39434d;color:white;padding-top:22px;padding-bottom:22px;margin-bottom:20px;}
		div{padding-top:10% ;}
	</style>
</head>
<body>
<center>
<div class=upper>
<h1>Welcome to Admin Panel</h1>
<br>
</div>

<form>
<input class=button type=submit name=add_user value="Add User" >

<input class=button type=submit name=update_user value="Update User " >
<br><br>
<input class=button type=submit name=delete_user value="Delete User" >

<input class=button type=submit name=view_users value="View all Users" >
<br><br>
<input class=button type=submit name=logout value="LOGOUT" >
</form>

<a href="adminlogin.jsp"><button class="button">BACK</button></a>
<br>
<%

if(request.getParameter("view_users") != null)
{
response.sendRedirect("view.jsp");
}
if(request.getParameter("delete_user") != null)
{
response.sendRedirect("delete.jsp");
}
if(request.getParameter("add_user") != null)
{
response.sendRedirect("add.jsp");
}
if(request.getParameter("update_user") != null)
{
response.sendRedirect("update.jsp");
}

if(request.getParameter("logout") != null)
{
session.invalidate();
response.sendRedirect("adminlogin.jsp");
}

%>
<center>
</body>
<html>