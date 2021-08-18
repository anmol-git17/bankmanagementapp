<%@ page import="java.sql.*" %>
<html>
<head>
<%
if(session.getAttribute("adminid") == null)
{
response.sendRedirect("index.jsp");
}

%>
	<title> View Panel </title> 
	<style> @import url('https://fonts.googleapis.com/css2?family=Archivo+Black&display=swap');
		*{font-family: 'Archivo Black', sans-serif;text-decoration:none;margin:0px;padding:0px;}
		.upper{background-color:#39434d;color:white;padding-top:18px;padding-bottom:13px;margin-bottom:2.5%;}
		table{width:80%;}
		td,th{border:2px solid black; font-size:20px;cell-padding:2px;text-align:center;}
		th{background-color:#31c766;}
		td{background-color:#39434d;color:white;}
		.button{background-color:#31c766;color:white;height:60px ; width:200px;font-size:20px;margin:18px;} 
	</style>
</head>
<body>
<center>
	<div class=upper>
	<h1> All users' details</h1>
	</div>
	<table> 	
		<tr>
			<th>User ID</th>
			<th>User Name</th>
			<th>Account Balance</th>
		</tr>
		<%
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost/","root","");

String sql = "select * from peoples_bank.users";
Statement st  =  con.createStatement();
ResultSet rs = st.executeQuery(sql);
while(rs.next()){
int uid =rs.getInt(1) ;
String name = rs.getString(3);
int bal = rs.getInt(4); 
		%>
		<tr>
			<td> <%=" "+uid%> </td>
			<td> <%=" "+name%> </td>
			<td> Rs.<%=" "+bal%> </td>
		</tr>
<%
}
}
catch(Exception e)
{
out.println(e.getMessage());
}
%>
	</table>
	<br>
	<a href="adminpanel.jsp"><button class="button">BACK</button></a>

</center>
</body>
</html>