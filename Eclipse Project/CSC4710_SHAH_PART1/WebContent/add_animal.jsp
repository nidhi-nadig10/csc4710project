<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Adoption Agency | Post an Animal</title>
	<link rel="stylesheet" type="text/css" href="woof.jsp">
</head>
<body>
	<nav id="navigation">
		<ul>
			<li><a href="show_all.jsp">Home</a></li>
			<li class="current-menu-item"><a href="add_animal.jsp">Post an Animal</a></li>
			<li><a href="view_favorites.jsp">View Favorites</a></li>
			<li><a href="search_animal.jsp">Search Animals</a></li>
			<li><a href="list_by_price.jsp">List By Price</a></li>
			<li><a href="view_reviews.jsp">View Reviews</a></li>
			<li><a href="part3menu.jsp">Part 3 Menu</a></li>
		</ul>
	</nav>
	
	<main>
	<div class="center">
	<div class="container">
	
	<h1>Animal Details </h1>
		<form action="animal_to_table.jsp">
			<label for="name">Name:</label><br>
				<input type="text" id="name" name="name">
				<br>
			
			<label for="species">Species:</label><br>
				<input type="text" id="species" name="species" >
				<br>
				
			<label for="birthdate">Birthdate (year-month-date):</label><br>
				<input type="text" id="birthdate" name="birthdate">
				<br>
				
			<label for="price">Price:</label><br>
				<input type="number" id="price" name="price">
				<br>
				
			<label for="traits">Traits:</label><br>
				<input type="text" id="traits" name="traits">
				<br>
				
				<input type="submit" value="Submit">
		</form>
			
	</div>
	</div>
	
	<div class="footer">
		<p>CSC 4710: Winter 2020</p>
	</div>
</main>

</body>
</html>