<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Adoption Agency | Show My Listings</title>
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
			<li><a href="part3menu.jsp">Part 3 Menu</a></li>
		</ul>
	</nav>
	
	<main>
	<div class="center">
	<table class = table>
		<tr>
		<th>Animal Name</th>
		<th>Species</th>
		<th>Birth Date</th>
		<th>Price</th>
		<th>Traits</th>
		</tr>
	</table>
<%@ page import ="java.sql.*" %>
<%@ page import = "javax.sql.*" %>

<%
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection connect = DriverManager
  .getConnection("jdbc:mysql://127.0.0.1:3306/dogAdoptionDB?"
      + "user=john&password=pass1234");
Statement st = connect.createStatement();


String query = "SELECT * FROM loggedinuser;";
ResultSet rs = st.executeQuery(query);

while(rs.next())
{
	String user = rs.getString("username");
	query = "SELECT * FROM ANIMALS WHERE username = " + '"'+ user+'"' + ";";
}

rs = st.executeQuery(query);

while(rs.next()){
%>	
	<table class=table>
	<tr>
    <td><%=rs.getString("name") %></td>
    <td><%=rs.getString("species") %></td>
    <td><%=rs.getString("birthdate") %></td>
    <td><%=rs.getInt("price") %></td>
    <td><%=rs.getString("traits") %></td>
   
    </tr>
    </table>
    
<% 
}
%>	
	
	</div>
	</main>
</body>
</html>