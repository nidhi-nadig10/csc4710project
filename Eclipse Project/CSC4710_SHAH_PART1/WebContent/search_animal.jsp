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
	
	<%@ page import ="java.sql.*" %>
	<%@ page import = "javax.sql.*" %>

		<%
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection connect = DriverManager
		 		.getConnection("jdbc:mysql://127.0.0.1:3306/dogAdoptionDB?"
		     + "user=john&password=pass1234");
		Statement st = connect.createStatement();
		
		String query = "SELECT * FROM animals;";
		ResultSet rs = st.executeQuery(query);
		
		
		
		%>
	
		
<main>
<div class="center">
<div class="container">
	<h1>Find Animal</h1>
	<form action= "find_animals.jsp" method= "post">
	<h3>Choose a Trait</h3>
	<select id = "selectedTrait" name = selectedTrait>
		<option></option>
		<option>adventurous</option>
		<option>angry</option>
		<option>energetic</option>
		<option>fast</option>
		<option>feisty</option>
		<option>fluffy</option>
		<option>happy</option>
		<option>hungry</option>
		<option>slobbery</option>
		<option>spiky</option>
		<option>wiggly</option>
     </select>
	<br></br>
	
	<button type="submit" value="Find Animals" class="buttonOne">Find Animals</button>
	</form>
</div>
</div>
</main>
</body>
</html>