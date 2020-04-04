<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title> </title>
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
	String trait= request.getParameter("selectedTrait");
		
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection connect = DriverManager
	 		.getConnection("jdbc:mysql://127.0.0.1:3306/dogAdoptionDB?"
	     + "user=john&password=pass1234");
	Statement st = connect.createStatement();
	
	String findAnimalSQL = "SELECT * FROM animals WHERE traits LIKE " + "'%" + trait +"%';";
		
	ResultSet rs = st.executeQuery(findAnimalSQL);
	out.println("Search results for '" + trait + "'");
			
	%>
	<div class="center">
		<table class = table>
		<tr>
		<th>Name</th>
		<th>Species</th>
		<th>Traits</th>
		</tr>
		</table>
		<%		
	while(rs.next()){
	%>	
		
		
	
	
	
		<table class=table>
		<tr>
	    <td><%=rs.getString("name") %></td>
	    <td><%=rs.getString("species") %></td>
	    <td><%=rs.getString("traits") %></td>
	    </tr>
	    </table>
	    
	<% 
	}
	%>	
	</div>
	<div class="footer">
		<p>CSC 4710: Winter 2020</p>
	</div>
</body>
</html>