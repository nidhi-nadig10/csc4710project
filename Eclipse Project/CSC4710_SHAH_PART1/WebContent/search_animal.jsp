<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<li><a href="show_all.jsp">Home</a></li>
			<li><a href="add_animal.jsp">Post an Animal</a></li>
			<li><a href="view_favorites.jsp">View Favorites</a></li>
			<li class="current-menu-item"><a href="search_animal.jsp">Search Animals</a></li>
			<li><a href="list_by_price.jsp">List By Price</a></li>
			<li><a href="view_reviews.jsp">View Reviews</a></li>
		</ul>
	</nav>
	
<main>
<div class="center">
<div class="container">
	<h1>Find Animal</h1>
	<form action= "find_animals.jsp" method= "post">
	<h3>Choose a Trait</h3>
	<select name = "traits">
		<option value = "Select a trait">Select a Trait</option>
		<option value = "happy">happy</option>
		<option value = "slobbery">slobbery</option>
		<option value = "wiggly">wiggly</option>
		<option value = "dirty">dirty</option>
		<option value = "adventurous">adventurous</option>
		<option value = "sexy">sexy</option>
		<option value = "flawless">flawless</option>
		<option value = "fluffy">fluffy</option>
		<option value = "angry">angry</option>
		<option value = "feisty">feisty</option>
		<option value = "energetic">energetic</option>
		<option value = "sleepy">sleepy</option>
		<option value = "fast">fast</option>
		<option value = "spiky">spiky</option>
		<option value = "funny">funny</option>
		<option value = "dumb">dumb</option>
		<option value = "hungry">hungry</option>
	</select>
	<br></br>
	
	<button type="submit" value="Find Animals" class="buttonOne">Find Animals</button>
	</form>
</div>
</div>
</main>
</body>
</html>