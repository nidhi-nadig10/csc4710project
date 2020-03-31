<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Adoption Agency | Favorites</title>
	<link rel="stylesheet" type="text/css" href="woof.jsp">
</head>
<body>
	<nav id="navigation">
		<ul>
			<li><a href="show_all.jsp">Home</a></li>
			<li><a href="add_animal.jsp">Post an Animal</a></li>
			<li class="current-menu-item"><a href="view_favorites.jsp">View Favorites</a></li>
			<li><a href="search_animal.jsp">Search Animals</a></li>
			<li><a href="list_by_price.jsp">List By Price</a></li>
		</ul>
	</nav>
	
	<main>
	<div class="center">
	<table class = table>
		<tr>
		<th>Favorite Breeders</th>
		<th>Remove From List</th>
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

String query = "SELECT * FROM FAVBREEDERS;";

ResultSet rs = st.executeQuery(query);


while(rs.next()){
%>	
	<table class=table>
	<tr>
    <td><%=rs.getString("favUser") %></td>
    <td><form action = "remove_breeder"><input type="submit" value="Remove Breeder"> </form></td>
    </tr>
    </table>
    
<% 
}
%>	
	<table class = table>
		<tr>
		<td>Favorite Animals</td>
		<td>Remove From List</td>
		</tr>
	</table>
	
<%@ page import ="java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection connect2 = DriverManager
  .getConnection("jdbc:mysql://127.0.0.1:3306/dogAdoptionDB?"
      + "user=john&password=pass1234");
Statement st2 = connect2.createStatement();

String query2 = "SELECT * FROM FAVANIMALS;";

ResultSet rs2 = st2.executeQuery(query2);


while(rs2.next()){
%>	
	<table class=table>
	<tr>
    <td><%=rs2.getString("favAnimal") %></td>
    <td><form action = "remove_animal.jsp"><input type="submit" value="Remove Animal"> </form></td>
    </tr>
    </table>
    
<% 
}
%>
</div>	
	</main>
	<div class="footer">
		<p>CSC 4710: Winter 2020</p>
	</div>
</body>
</html>