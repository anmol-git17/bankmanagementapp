<%@ page import="java.sql.*" %>

<html>
<head>
<%
if(session.getAttribute("userid") == null)
{
response.sendRedirect("index.jsp");
}

%>
	<title> User Panel </title> 
	<style> 
		@import url('https://fonts.googleapis.com/css2?family=Archivo+Black&display=swap');
		*{font-family: 'Archivo Black', sans-serif;text-decoration:none;margin:0px;padding:0px;}
		.button{background-color:#31c766;color:white;height:60px ; width:200px;font-size:20px;} 
		.upper{background-color:#39434d;color:white;padding-top:18px;padding-bottom:13px;margin-bottom:2.5%;}
		#withdrawbtn{font-size:17px;}
		.info{font-size:35px;}
		</style>
</head>
<body>

<center>

<%
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost/","root","");

String sql ="select * from peoples_bank.users where userID = ?";
PreparedStatement pst  = con.prepareStatement(sql);
Integer id = Integer.parseInt((String)session.getAttribute("userid"));
pst.setInt(1,id);
ResultSet rs = pst.executeQuery();
if(rs.next())
{
String name = rs.getString(3);
Integer bal = rs.getInt(4);
%>
<div class=upper>
<h1>Hello! <%= name  %></h1><br>
<h2> The following are your banking details</h2>
</div>
	<div class=info><p> Name:<%= name %> <br><br>User id:<%= session.getAttribute("userid") %> <br><br>Balance:<%= bal %><br><br>
	</p></div>
	<form method="POST">
		<input class=button id=withdrawbtn type=submit name=withdraw_money value="WITHDRAW MONEY">
		<input class=button type=submit name=logout value="LOGOUT">
	</form><br>
	<a href="userlogin.jsp"><button class="button">BACK</button></a>
<%
}
}
catch(Exception e)
{
e.getMessage();
}
if(request.getParameter("withdraw_money") != null)
{
response.sendRedirect("withdraw.jsp");
}
if(request.getParameter("logout") != null)
{
session.invalidate();
response.sendRedirect("index.jsp");
}

%>
	
	
	
	
</center>


</body>
</html>