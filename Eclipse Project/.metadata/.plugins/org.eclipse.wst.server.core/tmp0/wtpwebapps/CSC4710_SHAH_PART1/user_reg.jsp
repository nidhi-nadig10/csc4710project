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
			<li class="current-menu-item"><a href="user_reg.jsp">Create Account</a></li>
			<li><a href="login_page.jsp">Log In</a></li>
		</ul>
	</nav>
	
	<main>
	<div class="center">
	<div class="container">
		<h1>Create a New Account</h1>
		<form action="register_user.jsp">	
				<label for="fname">First name:</label><br>
				<input type="text" id="fname" name="fname" value="<c:out value = '${User.firstName}' />"
				
				><br>
				
				<label for="lname">Last name:</label><br>
				<input type="text" id="lname" name="lname"value="<c:out value = '${User.lastName}' />"
				
				><br>
				
				<label for="email">Email Address:</label><br>
				<input type="text" id="email" name="email"value="<c:out value = '${User.email}' />"
				
				><br>
				
				<label for="user">Username:</label><br>
				<input type="text" id="user" name="user" value="<c:out value = '${User.username}' />"
				
				><br>
				
				<label for="passw">Password:</label><br>
				<input type="password" id="passw" name="passw" value="<c:out value = '${User.password}' />"
				
				><br>
				
				<input type="submit" value="Create Account"> 
				
			</form>
			<p>Already a User?</p> <a href="login_page.jsp">Log In</a>

	</div>
	</div>
	
	<div class="footer">
		<p>CSC 4710: Winter 2020</p>
	</div>
	</main>
	
</body>
</html>