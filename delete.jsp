<%@ page import="java.sql.*" %>
<html>
<head>
<%
if(session.getAttribute("adminid") == null)
{
response.sendRedirect("index.jsp");
}

%>
	<title> Delete User </title> 
	<style> 
		
		@import url('https://fonts.googleapis.com/css2?family=Archivo+Black&display=swap');
		*{font-family: 'Archivo Black', sans-serif;text-decoration:none;margin:0px;padding:0px;}
		.button{background-color:#31c766;color:white;height:60px ; width:200px;font-size:20px;margin:4px;} 
		.upper{background-color:#39434d;color:white;padding-top:22px;padding-bottom:18px;margin-bottom:8%; }
		input{font-size:30px;}
		
	</style>
</head>
<body>
<center>
	<div class=upper>
	<h1> Delete User</h1><br>
	<h2>Enter the user id of the user you want to remove.</h2>
	</div>
	<br>
	<form>

		<input class=tb type=number name=userid placeholder="	    enter userID" required><br><br>
		<input class=tb type=number name=useridconf placeholder="	   confirm userID" required><br><br>
		<input class=button type=submit name="remove" value="REMOVE"><br><br>
	</form>
	
	<a href="adminpanel.jsp"><button class="button">BACK</button></a><br>
<%

if(request.getParameter("remove") != null)
{

	String u1 = request.getParameter("userid");
	String u2 = request.getParameter("useridconf");
	int uid = Integer.parseInt(request.getParameter("userid"));
	
	if(u1.equals(u2))
	{
		if(uid<=0)
		{
			out.println("Please Enter a Valid UserID!");
		}
		else
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con= DriverManager.getConnection("jdbc:mysql://localhost/","root","");
				String sql = "select * from peoples_bank.users where userID = ?";
				PreparedStatement pst  =  con.prepareStatement(sql);
				pst.setInt(1,uid);
				ResultSet rs = pst.executeQuery();
				
				if(rs.next())
				{
					String sql1 = "Delete from peoples_bank.users where userID = ?";
					PreparedStatement pst1  =  con.prepareStatement(sql1);
					pst1.setInt(1,uid);
					pst1.executeUpdate();
					out.println("User Deleted Successfully!");
				}
				else
				{
					out.println("User with the entered userid does not exist");
				}
			}
			catch(Exception e)
			{
				out.println(e.getMessage());
			}	
		}
	}
	else
	{
		out.println("UserID and Confirmed UserID is not same!");
	}

}

%>	
		
</center>
</body>
</html>

