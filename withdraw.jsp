<%@ page import="java.sql.*" %>
<html>
<head>
<%
if(session.getAttribute("userid") == null)
{
response.sendRedirect("index.jsp");
}

%>
	<title> Money Withdrawl </title> 
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Archivo+Black&display=swap');
		*{font-family: 'Archivo Black', sans-serif;text-decoration:none;margin:0px;padding:0px;}
		.button{background-color:#31c766;color:white;height:60px ; width:200px;font-size:22px;} 
		.upper{background-color:#39434d;color:white;padding-top:18px;padding-bottom:13px;margin-bottom:120px;}
		input{font-size:40px;}
		.tb{margin:10px;}
	</style>
</head>
<body>
<center>
	<div class=upper>
	<h1> Money Withdrawl</h1>
	<br>
	</div>
	<form method="POST">
		<input class=tb type=number name=amount placeholder="           enter amount" required>
		<br><br><br>
		<input class=button type=submit name=withdraw value="WITHDRAW">
		<br><br>
	</form>
	<a href="userpanel.jsp"><button class="button">BACK</button></a><br>

<%


	if(request.getParameter("withdraw") != null)
	{
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection("jdbc:mysql://localhost/","root","");
		int wamt = Integer.parseInt(request.getParameter("amount"));
		int bal=0 ;
		Integer uid = Integer.parseInt((String)session.getAttribute("userid"));
		String sql  = "select balance from peoples_bank.users where userID = ?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setInt(1,uid);
		ResultSet rs = pst.executeQuery();
		if(rs.next())
		{
		bal = rs.getInt(1);
		}
		
			if(wamt<=bal)
			{
				if(wamt<=0)
				{
				out.println("Enter a valid withdrawl amount!");
				}
				else
				{
				bal = bal - wamt;
				String sql1 = "Update peoples_bank.users set balance = ? where userID = ?";
				PreparedStatement pst1 = con.prepareStatement(sql1);
				pst1.setInt(1,bal);
				pst1.setInt(2,uid);
				pst1.executeUpdate();
				response.sendRedirect("userpanel.jsp");
				}
			}
			else
			{
			out.println("Insufficient Account Balance!");
			}
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
	}


%>

</center>
</body>
</html>
