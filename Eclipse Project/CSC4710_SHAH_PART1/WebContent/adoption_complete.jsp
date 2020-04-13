<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Adoption Agency | Adoption Crate</title>
	<link rel="stylesheet" type="text/css" href="woof.jsp">
</head>
<body>

<nav id="navigation">
		<ul>
			<li><a href="show_all.jsp">Home</a></li>
			<li><a href="add_animal.jsp">Post an Animal</a></li>
			<li> <a href="view_favorites.jsp">View Favorites</a></li>
			<li><a href="search_animal.jsp">Search Animals</a></li>
			<li><a href="list_by_price.jsp">List By Price</a></li>
			<li><a href="view_reviews.jsp">View Reviews</a></li>
		</ul>
	</nav>
	
<h1>TRANSACTION COMPLETE</h1>

<%@ page import ="java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection connect = DriverManager
  .getConnection("jdbc:mysql://127.0.0.1:3306/dogAdoptionDB?"
      + "user=john&password=pass1234");
Statement st = connect.createStatement();
Statement st1 = connect.createStatement();





String query,query1;
PreparedStatement preparedStatement;

String species="";
float price = 0;
query = "SELECT * FROM ADOPTIONCRATE;";
ResultSet rs = st.executeQuery(query);
ResultSet rs1;

while(rs.next())
{
	String animal = rs.getString("name");
	
	query1 = "DELETE FROM ANIMALS WHERE name = '" + animal + "';";
	preparedStatement = (PreparedStatement) connect.prepareStatement(query1);
	preparedStatement.executeUpdate();
	
}

query1 = "DELETE FROM ADOPTIONCRATE;";
preparedStatement = (PreparedStatement) connect.prepareStatement(query1);
preparedStatement.executeUpdate();



%>

</body>
</html>