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
			<li><a href="search_animal.jsp">Search Animals</a></li>
			<li><a href="list_by_price.jsp">List By Price</a></li>
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

String query = "SELECT * FROM ANIMALS;";

ResultSet rs = st.executeQuery(query);

%>


<div class="center">
<div class="container">
	<h1>Write A Review</h1>
	
	<form action= "save_review.jsp" method= "post" style = "float:center">
	<h3>Choose an Animal</h3>
	<select name = "animalselection">
		<% 
		while (rs.next())
			{ 
				String value = rs.getString("name");
			
			%>
			
			<option> <%= value%> </option>
				
			<% }
			
			%>
     </select>
	<br></br>
	<h3>Choose a Rating</h3>
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
	<br></br>
	<button type="submit" value="Review Animal" class="buttonTwo">Review Animal</button>
	
	</form>
	
	
	
	
	
	
	
	
	
</div>
</div>
</body>
</html>