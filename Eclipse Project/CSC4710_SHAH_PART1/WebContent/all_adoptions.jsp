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
			<li class="current-menu-item"><a href="show_all.jsp">Show All Listings</a></li>
			<li><a href = "user_adoptions.jsp">Show My Listings</a></li>
		</ul>
	</nav>
	
	<main>
	<div class="center">
	
	<table class = table>
		<tr>
		<td>Animal Name</td>
		<td>Species</td>
		<td>Birth Date</td>
		<td>Price</td>
		<td>Traits</td>
		<td>Review</td>
		<td>View All Reviews</td>
		</tr>
	</table>
	
<%@ page import ="java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "packageDB.User" %>
<%@ page import = "packageDB.Animal" %>

<%
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection connect = DriverManager
  .getConnection("jdbc:mysql://127.0.0.1:3306/dogAdoptionDB?"
      + "user=john&password=pass1234");
Statement st = connect.createStatement();

//Animal animal = new Animal();
//int animal_id = animal.getAnimalID();

//String query = "SELECT * FROM ANIMALS WHERE id = + animal_id +;";
String query = "SELECT * FROM ANIMALS;";

ResultSet rs = st.executeQuery(query);


while(rs.next()){
%>	
	<table class=table>
	<tr>
    <td><%=rs.getString("name") %></td>
    <td><%=rs.getString("species") %></td>
    <td><%=rs.getString("birthdate") %></td>
    <td><%=rs.getInt("price") %></td>
    <td><%=rs.getString("traits") %></td>
    <td><form action = "review.jsp"><input type="submit" value="Review"> </form></td>
    <td><form action = "view_reviews.jsp"><input type="submit" value="View All Reviews"> </form></td>
    </tr>
    </table>
    
<% 
}
%>

	</div>
	<div class="footer">
		<p>CSC 4710: Winter 2020</p>
	</div>
</main>

</body>
</html>