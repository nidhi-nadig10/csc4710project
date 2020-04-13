<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Adoption Agency | Show All Listings</title>
	<link rel="stylesheet" type="text/css" href="woof.jsp">
</head>
<body>
	<nav id="navigation">
		<ul>
			<li class="current-menu-item"><a href="show_all.jsp">Home</a></li>
			<li><a href="add_animal.jsp">Post an Animal</a></li>
			<li><a href="view_favorites.jsp">View Favorites</a></li>
			<li><a href="search_animal.jsp">Search Animals</a></li>
			<li><a href="list_by_price.jsp">List By Price</a></li>
			<li><a href="view_reviews.jsp">View Reviews</a></li>
			<li><a href="part3menu.jsp">Part 3 Menu</a></li>
			<li><a href="login_page.jsp">Sign Out</a></li>
		</ul>
	</nav>
	
<main>
	<div class="center">
	<div class="container">
	
	<h1>List All Adoptions</h1>
		<form action="all_adoptions.jsp">
			<button type="submit" value="List All Adoptions" class="buttonOne">List Adoptions</button>
		</form>
		
	<h1>List My Adoptions</h1>
		<form action="user_adoptions.jsp">
			<button type="submit" value="List My Adoptions" class="buttonOne">List My Adoptions</button>
		</form>
			
	</div>
	</div>
	
	<div class="footer">
		<p>CSC 4710: Winter 2020</p>
	</div>
</main>
	
</body>
</html>