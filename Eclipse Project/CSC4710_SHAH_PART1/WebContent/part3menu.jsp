<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Adoption Agency | Part 3 Menu</title>
	<link rel="stylesheet" type="text/css" href="woof.jsp">
</head>

<body>
	<nav id="navigation">
		<ul>
			<li><a href="show_all.jsp">Home</a></li>
			<li><a href="add_animal.jsp">Post an Animal</a></li>
			<li><a href="view_favorites.jsp">View Favorites</a></li>
			<li><a href="search_animal.jsp">Search Animals</a></li>
			<li><a href="list_by_price.jsp">List By Price</a></li>
			<li><a href="view_reviews.jsp">View Reviews</a></li>
			<li class="current-menu-item"><a href="part3menu.jsp">Part 3 Menu</a></li>
		</ul>
	</nav>
	
	<main>
	<div class="center">
	
	<table class = table>
		<tr>
			<th>Page Name</th>
			<th>Description</th>
			<th>Go to Page</th>
		</tr>
		<tr>
			<td>Users With Two Species</td>
			<td>List users who have placed two animals up for adoption for different species.</td>
			<td>
				<form action="part3page1.jsp" method="post">
					<button type="submit" value="Page 1" class="buttonTwo">Page 1</button> 
				</form>
			</td>
		</tr>
		<tr>
			<td>Totes Adorbs or Adorbs Animals</td>
			<td>Lists all Animals with a Totes Adorbs or Adorbs Review</td>
			<td>
				<form action="part3page2.jsp" method="post">
					<button type="submit" value="Page 2" class="buttonTwo">Page 2</button> 
				</form>
			</td>
		</tr>
		<tr>
			<td>Most Reviews</td>
			<td>Lists users who have given the most reviews</td>
			<td>
				<form action="part3page3.jsp" method="post">
					<button type="submit" value="Page 3" class="buttonTwo">Page 3</button> 
				</form>
			</td>
		</tr>
		<tr>
			<td>Shared Favorite Animals</td>
			<td>For any user, lists the favorite animals in common with a second user.</td>
			<td>
				<form action="part3page4.jsp" method="post">
					<button type="submit" value="Page 4" class="buttonTwo">Page 4</button> 
				</form>
			</td>
		</tr>
		<tr>
			<td>Ridic Adorbs Animals</td>
			<td>Lists animals with 2+ Totes Adorbs Reviews</td>
			<td>
				<form action="part3page5.jsp" method="post">
					<button type="submit" value="Page 5" class="buttonTwo">Page 5</button> 
				</form>
			</td>
		</tr>
		<tr>
			<td>Users w/ No Cray-Cray Reviews</td>
			<td>List users who have never posted a Cray-Cray Review.</td>
			<td>
				<form action="part3page6.jsp" method="post">
					<button type="submit" value="Page 6" class="buttonTwo">Page 6</button> 
				</form>
			</td>
		</tr>
		<tr>
			<td>Only Cray/Cray-Cray Reviews</td>
			<td>Lists users who have only given Cray or Cray-Cray reviews.</td>
			<td>
				<form action="part3page7.jsp" method="post">
					<button type="submit" value="Page 7" class="buttonTwo">Page 7</button> 
				</form>
			</td>
		</tr>
		<tr>
			<td>Animals with No Cray-Cray Reviews</td>
			<td>Lists Users who have posted animals which don't have Cray or Cray-Cray reviews.</td>
			<td>
				<form action="part3page8.jsp" method="post">
					<button type="submit" value="Page 8" class="buttonTwo">Page 8</button> 
				</form>
			</td>
		</tr>
	</table>
	
	</div>
	</main>
</body>
</html>