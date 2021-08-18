<%@ page import="java.sql.*" %>
<html>
<head>
<%
if(session.getAttribute("adminid") == null)
{
response.sendRedirect("index.jsp");
}

%>
	<title> Update User </title> 
	<style> 
		@import url('https://fonts.googleapis.com/css2?family=Archivo+Black&display=swap');
		*{font-family: 'Archivo Black', sans-serif;text-decoration:none;margin:0px;padding:0px;}
		.button{background-color:#31c766;color:white;height:60px ; width:200px;font-size:17px;} 
		.upper{background-color:#39434d;color:white;padding-top:12px;padding-bottom:10px;margin-bottom:20px;}
		input{font-size:20px;}
		.tb{margin-bottom:5px;margin-left:10px;margin-right:10px;}
		
	</style>
</head>
<body>
<center>
	<div class=upper>
	<h1> Update User</h1><br>
	<h2>Enter the details of the user you want to update.</h2>
	<br>
	</div>
	<form method="POST">
		<input class=tb type=number name=userid placeholder="enter userID" required>
		<input class=tb type=number name=useridconf placeholder="confirm userID" required><br><br>
		<input class=tb type=text name=username placeholder="update username" required>
		<input class=tb type=text name=usernameconf placeholder="confirm username" required><br><br>
		<input class=tb type=number name=bal placeholder="update account balance " required>
		<input class=tb type=number name=balconf placeholder="confrim account balance " required><br><br>
		<input class=tb type=password name=pw placeholder="update password " required>
		<input class=tb type=password name=pwconf placeholder="confirm password " required><br><br>
		<input class=button type=submit name="updateuser" value="UPDATE USER INFO">
	</form>
	<br>
	<a href="adminpanel.jsp"><button class="button">BACK</button></a><br>
	
<%
if(request.getParameter("updateuser") != null)
{
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost/","root","");
	int adminid =112233;
	String sql = "select * from peoples_bank.users where userID = ?";
	PreparedStatement pst = con.prepareStatement(sql);
	pst.setInt(1,Integer.parseInt(request.getParameter("userid")));
	ResultSet rs = pst.executeQuery();
	

	int f1 , f2 , f3 , f4 ;
	String un1 = request.getParameter("username") , un2 = request.getParameter("usernameconf");
	int bal1 = Integer.parseInt(request.getParameter("bal")) , bal2 = Integer.parseInt(request.getParameter("balconf"));
	int uid1 = Integer.parseInt(request.getParameter("userid")) , uid2 = Integer.parseInt(request.getParameter("useridconf"));
	String pw1 = request.getParameter("pw") , pw2 = request.getParameter("pwconf");
	
	if(un1.equals(un2)) f1=0; else f1=1;
	if(bal1==bal2) f2=0; else f2=1;
	if(uid1==uid2) f3=0; else f3=1;
	if(pw1.equals(pw2)) f4=0; else f4=1;
	
	if(f3==0)
	{
		if(uid1<1)
		{
			out.println("Enter a Valid Value for UseID!");
		}
		else
		{
			f3=2;
		}
	}
	else
	{
		out.println("UserID and Confirmed UserID are different!");
	
	}

	if(f3==2)
	{
		if(rs.next())
		{
			f3=3;
			out.println("here");
		}
		else
		{
			out.println("User with UserID : "+uid1+" does not exist" );
			
		}	

	}
	

	if(f1==0)
	{
		for(int i=0 ; i<un1.length() ; i++)
		{	
			
			if(un1.charAt(i) == ' ')
			{
				f1 = 2;
			}
		} 
		
		if(f1==2)
		{
			out.println("Username cannot have spaces!");
		}
		else
		{
			f1 = 3;
		}
	}
	else
	{
		out.println("Username and Confirmed username are diferent!");
	}


	if(f2==0)
	{
		if(bal1<1)
		{
			out.println("Enter a Vaild Amount!");
		}
		else
		{
			f2=2;
		}
	}
	else
	{
		out.println("Initial Balance and Confirmed Initial Balance are different!");
	}

	
	



	if(f4==0)
	{
		if(pw1.length()<8 || pw1.length()>15)
		{
			out.println("Password Length should be greater than 8 characters!");
		}
		else
		{
			f4=2;
		}
	}
	else
	{
		out.println("Password and Confirmed Password are different!");
	}


	

	if(f1==3 && f2==2 && f3==3 && f4==2)
	{

		String sql1 = "insert into peoples_bank.users(userID, userPW, userName, balance, adminID) values(?,?,?,?,?)";
		PreparedStatement pst1 = con.prepareStatement(sql1);
		pst1.setInt(1,uid1);
		pst1.setString(2,pw1);
		pst1.setString(3,un1);
		pst1.setInt(4,bal1);
		pst1.setInt(5,adminid);
		pst1.executeUpdate();
		out.println("User Added Successfully!");
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



