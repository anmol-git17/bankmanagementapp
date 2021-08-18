<%@ page import="java.sql.*" %>
<html>
<head>
	<title>User Login </title> 
	<style> 
		@import url('https://fonts.googleapis.com/css2?family=Archivo+Black&display=swap');
		*{font-family: 'Archivo Black', sans-serif;text-decoration:none;margin:0px;padding:0px;}
		.button{background-color:#31c766;color:white;height:60px ; width:200px;font-size:20px;} 
		.upper{background-color:#39434d;color:white;padding-top:18px;padding-bottom:13px;margin-bottom:10%;}
		input{font-size:30px;}
		
		
	
	</style>
<head>
<body>
<center>
<div class=upper>
<h1> User Login</h1>
</div>
<div>
<form method="POST">
<input class=tb type=number name=user_id placeholder="           enter user id" required>
<br><br><br>
<input class=tb type=password name=user_password placeholder="         enter password" required>
<br><br><br>
<input class=button type=submit name="user_signin" value="SIGN IN">
<br><br>
</form>
</div>
<a href="index.jsp"><button class="button">BACK</button></a>
<%
if(request.getParameter("user_signin") != null)
{
Integer uid = Integer.parseInt(request.getParameter("user_id"));
String pw = request.getParameter("user_password");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost/","root","");



String sql = "select * from peoples_bank.users where userID = ?";
PreparedStatement pst = con.prepareStatement(sql);
pst.setInt(1,uid);
ResultSet rs = pst.executeQuery();
if(rs.next())
{
String pw_db = rs.getString(2);
if(pw.equals(pw_db))
{
request.getSession().setAttribute("userid",uid.toString());
response.sendRedirect("userpanel.jsp");
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
alert("User does not exist");
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