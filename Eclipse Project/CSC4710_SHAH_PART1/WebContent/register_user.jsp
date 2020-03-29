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
		
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection connect = DriverManager
		 		.getConnection("jdbc:mysql://127.0.0.1:3306/dogAdoptionDB?"
		     + "user=john&password=pass1234");
		Statement st = connect.createStatement();
		
		String registerUserSQL = "INSERT INTO users(username, pw, firstname, lastname, email)\r\n" + 
			"VALUES('"+user+"','"+passw+"','"+fName+"','"+lName+"','"+email+"')";
		PreparedStatement preparedStatement;
		preparedStatement = (PreparedStatement) connect.prepareStatement(registerUserSQL);
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
	
	<div class="footer">
		<p>CSC 4710: Winter 2020</p>
	</div>
</body>
</html>