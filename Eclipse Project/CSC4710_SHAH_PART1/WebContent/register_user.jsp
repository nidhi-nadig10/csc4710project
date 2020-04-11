 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title> </title>
	<link rel="stylesheet" type="text/css" href="woof.jsp">
</head>
		
<body>
	<nav id="navigation">
		<ul>
			<li><a href="user_reg.html">Create Account</a></li>
			<li><a href="login_page.jsp">Log In</a></li>
		</ul>
	</nav>
<%@ page import ="java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<% 
	String fName= request.getParameter("fname");
	String lName= request.getParameter("lname");
	String email= request.getParameter("email");
	String user= request.getParameter("user");
	String passw =request.getParameter("passw");
	
	boolean emailTaken = false, usernameTaken = false;
		
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection connect = DriverManager
		 		.getConnection("jdbc:mysql://127.0.0.1:3306/dogAdoptionDB?"
		     + "user=john&password=pass1234");
		Statement st = connect.createStatement();
		
		PreparedStatement preparedStatement;

		
		
	
	String query = "SELECT email from users where email = '" + email + "';";
	preparedStatement = (PreparedStatement) connect.prepareStatement(query);
	ResultSet rs = preparedStatement.executeQuery(query);
	
	if(rs.next())
	{
		emailTaken = true;
	}
	
	
	query = "SELECT username from users where username = '" + user + "';";
	preparedStatement = (PreparedStatement) connect.prepareStatement(query);
	rs = preparedStatement.executeQuery(query);
	
	if(rs.next())
	{
		usernameTaken = true;
	}
	
	
	if(emailTaken == true && usernameTaken == true)
	{
		out.println("UNSUCCESSFUL REGISTRATION: EMAIL AND USERNAME ALREADY TAKEN");
		out.println("Redirecting to Registration Page");
					
		%>
				<head>  
				<title>HTML Redirect</title>  
				<meta http-equiv="refresh"content="3; url = user_reg.jsp" /> 
				</head>  
		<%	
	}	
	else if(emailTaken == true)
	{
		out.println("UNSUCCESSFUL REGISTRATION: EMAIL ALREADY TAKEN");
		out.println("Redirecting to Registration Page");
					
		%>
				<head>  
				<title>HTML Redirect</title>  
				<meta http-equiv="refresh"content="3; url = user_reg.jsp" /> 
				</head>  
		<%	
	}
	else if(usernameTaken == true)
	{
		out.println("UNSUCCESSFUL REGISTRATION: USERNAME ALREADY TAKEN");
		out.println("Redirecting to Registration Page");
					
		%>
				<head>  
				<title>HTML Redirect</title>  
				<meta http-equiv="refresh"content="3; url = user_reg.jsp" /> 
				</head>  
		<%	
	}
	else
	{	
	
		
		query = "INSERT INTO users(username, pw, firstname, lastname, email)\r\n" + 
			"VALUES('"+user+"','"+passw+"','"+fName+"','"+lName+"','"+email+"')";
		preparedStatement = (PreparedStatement) connect.prepareStatement(query);
		preparedStatement.executeUpdate();
		//out.println("You are Registered!");		
%>
	<div class="center">
	<div class="container">
		<h1>You are Registered!</h1>
			<form action = "checkInfo.jsp">
				<label for="user">Username:</label><br>
				<input type="text" id="user" name="user"><br>
				
				<label for="passw">Password:</label><br>
				<input type="password" id="passw" name="passw"><br>
				<input type="submit" value="Log In">
			</form>
	</div>
	</div>
	<%
	}

	%>
	
	<div class="footer">
		<p>CSC 4710: Winter 2020</p>
	</div>
</body>
</html>