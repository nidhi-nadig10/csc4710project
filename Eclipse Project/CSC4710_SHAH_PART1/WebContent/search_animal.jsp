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

<body onload="">
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
	<select name = "trait">
	<c:forEach items="${listAnimal}" var="selectTrait">
		<option value = "">
		<c:if test="${selectTrait.traits eq selectTrait}">selected="selected"</c:if>
                    >
                    ${selectTrait.trait}
		</option>
	</c:forEach>
	</select>
	<br></br>
	
	<button type="submit" value="Find Animals" class="buttonOne">Find Animals</button>
	</form>
</div>
</div>
</main>
</body>
</html>