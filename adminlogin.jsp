<%@ page import="java.sql.*" %>
<html>
<head>
	<title>Admin Login </title> 
	<style>
		
		@import url('https://fonts.googleapis.com/css2?family=Archivo+Black&display=swap');
		*{font-family: 'Archivo Black', sans-serif;text-decoration:none;margin:0px;padding:0px;}
		.button{background-color:#31c766;color:white;height:60px ; width:200px;font-size:20px;} 
		.upper{background-color:#39434d;color:white;padding-top:18px;padding-bottom:18px; }
		input{font-size:30px;}
		div{padding-top:10% ;}
	</style>
<head>
<body>
<center>
<div class=upper>
<h1> Admin Login</h1>
</div>
<div>
<form method="POST">
<input class=textbox type=number name=admin_id placeholder="          enter admin id" required>
<br><br><br>
<input class=textbox type=password name=admin_password placeholder="          enter password" required>
<br><br><br>
<input class=button type=submit name="admin_signin" value="SIGN IN">
<br><br><br>
</form>
<a href="index.jsp"><button class="button">BACK</button></a>
<br><br><br><br>
</div>
<%
if(request.getParameter("admin_signin") != null)
{
Integer aid = Integer.parseInt(request.getParameter("admin_id"));
String pw = request.getParameter("admin_password");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost/","root","");



String sql = "select * from peoples_bank.admins where adminID = ?";
PreparedStatement pst = con.prepareStatement(sql);
pst.setInt(1,aid);
ResultSet rs = pst.executeQuery();
if(rs.next())
{
String pw_db = rs.getString(2);
if(pw.equals(pw_db))
{
request.getSession().setAttribute("adminid",aid.toString());
response.sendRedirect("adminpanel.jsp");
}
else
{
%>
<script>
alert("Incorrect Password");
</script>
<%
}

}
else
{
%>
<script>
alert("Admin user does not exist");
</script>
<%
}

}
catch(Exception e)
{
out.println("There is some problem connecting to the database");
e.getMessage();
}
}
%>
</form>
</center>
<body>
<html>