<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Adoption Agency | User Registration</title>
	<link rel="stylesheet" type="text/css" href="woof.jsp">
</head>

<body>
	<nav id="navigation">
		<ul>
			<li><a href="user_reg.jsp">Create Account</a></li>
			<li class="current-menu-item"><a href="login_page.jsp">Log In</a></li>
		</ul>
	</nav>
	
	<main>
	<div class="center">
	<div class="container">
		<h1>Log In</h1>
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
	</main>

</body>
</html>