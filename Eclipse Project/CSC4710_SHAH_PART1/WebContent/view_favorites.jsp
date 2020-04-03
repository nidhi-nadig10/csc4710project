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
			<li><a href="view_reviews.jsp">View Reviews</a></li>
		</ul>
	</nav>
	
	<main>
	<div class="center">
	<table class = table>
		<tr>
		<th>Favorite Breeders</th>
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
    </tr>
    </table>
    
<% 
}
%>	<table class=table>
	<tr class="blank_row">
	<td colspan="2"></td>
	</tr>
	</table>
	
	<table class = table>
		<tr>
		<th>Favorite Animals</th>
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
    </tr>
    </table>
    
<% 
}
%>


<form action= "add_breeder.jsp" method= "post" style ="float:left">
	<h3>Add Fav Breeders</h3>
	<select name = "breeder">
		<option></option>
		<option value = "rootuser">rootuser</option>
		<option value = "Darpan">Darpan</option>
		<option value = "Nidhi">Nidhi</option>
		<option value = "Aubrey">Aubrey</option>
		<option value = "Corey">Corey</option>
	</select>
	<br></br>
	
	<button type="submit" value="Find Animals" class="buttonTwo">Add Fav Breeder</button>
	</form>
	
	<form action= "remove_breeder.jsp" method= "post" style ="float:left">
	<h3>Remove Fav Breeders</h3>
	<select name = "trait">
		<option></option>
		<option value = "Aubrey">Aubrey</option>
		<option value = "Darpan">Darpan</option>
		<option value = "Nidhi">Nidhi</option>
	</select>
	<br></br>
	
	<button type="submit" value="Find Animals" class="buttonTwo">Remove Fav Breeder</button>
	</form>
	
	
	<form action= "add_fav_animal.jsp" method= "post" style ="float:right">
	<h3>Remove Fav Animal</h3>
	<select name = "trait">
		<option></option>
		<option value = "Fido">Fido</option>
		<option value = "Remy">Remy</option>
		<option value = "Baloo">Baloo</option>
	</select>
	<br></br>
	
	<button type="submit" value="Find Animals" class="buttonTwo">Remove Fav Animal</button>
	</form>
	
	
<form action= "remove_animal.jsp" method= "post" style ="float:right">
	<h3>Add Fav Animal</h3>
	<select name = "trait">
		<option></option>
		<option value = "Fido">Fido</option>
		<option value = "Remy">Remy</option>
		<option value = "Peppa">Peppa</option>
		<option value = "Stuart Little">Stuart Little</option>
		<option value = "Cat in the Hat">Cat in the Hat</option>
		<option value = "Sher Khan">Sher Khan</option>
		<option value = "Baloo">Baloo</option>
		<option value = "Bhageera">Bhageera</option>
		<option value = "Sonic">Sonic</option>
		<option value = "Scooby">Scooby</option>
	</select>
	<br></br>
	
	<button type="submit" value="Find Animals" class="buttonTwo">Add Fav Animal</button>
	</form>
	
	
	
	


</div>	
	</main>
	<div class="footer">
		<p>CSC 4710: Winter 2020</p>
	</div>
</body>
</html>