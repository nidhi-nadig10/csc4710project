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
	
<%String animal = request.getParameter("selectedAnimal"); %>

Reviewing <%out.println(animal);%>

<div class="center">
<div class="container">
	<h1>Write A Review</h1>
	<form action= "save_review.jsp" method= "post">
	<h3>Choose a Rating</h3>
	<h2 id = ratedAnimal name><%out.println(animal); %></h2>
	<select name = "rating">
		<option></option>
		<option value = "Totes Adorbs">Totes Adorbs</option>
		<option value = "Adorbs">Adorbs</option>
		<option value = "Cray">Cray</option>
		<option value = "Cray-Cray">Cray Cray</option>
	</select>
	<br></br>
	<h3>Enter a Short Review</h3>
	<textarea rows = "3" name = "review"></textarea>
	<input type="submit"/>
	</form>
</div>
</div>
</body>
</html>