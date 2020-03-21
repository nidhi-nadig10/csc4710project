<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Adoption Agency | Review Form</title>
	<link rel="stylesheet" type="text/css" href="woof.jsp">
</head>

<body>
	<nav id="navigation">
		<ul>
			<li><a href="all_adoptions.jsp">Show All Listings</a></li>
			<li><a href = "user_adoptions.jsp">Show My Listings</a></li>
		</ul>
	</nav>
	
<div class="center">
<div class="container">
	<h1>Find Animal</h1>
	<form action= "find_animals.jsp" method= "post">
	<h3>Choose a Rating</h3>
	<select name = "rating">
		<option></option>
		<option value = "Totes Adorbs">Totes Adorbs</option>
		<option value = "Adorbs">Adorbs</option>
		<option value = "Cray">Cray</option>
		<option value = "Cray-Cray">Cray Cray</option>
	</select>
	<br></br>
	
	<button type="submit" value="Find Animals" class="buttonOne">Find Animals</button>
	</form>
</div>
</div>
</body>
</html>