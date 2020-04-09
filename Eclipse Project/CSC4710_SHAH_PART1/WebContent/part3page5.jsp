<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Adoption Agency | Ridic Adorbs Animals</title>
	<link rel="stylesheet" type="text/css" href="woof.jsp">
</head>
<body>
<nav id="navigation">
		<ul>
			<li><a href="show_all.jsp">Home</a></li>
			<li><a href="part3menu.jsp">Part 3 Menu</a></li>
		</ul>
	</nav>
	
	<main>
	<div class="center">
	<h1>Ridic Adorbs Animals</h1>
	<h3>Animals with 2+ Totes Adorbs Reviews</h3>
	
	<table class="table">
		<tr>
			<th>Animal Name</th>
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

String query = "SELECT animalname FROM reviews WHERE rating= 'Totes Adorbs' HAVING COUNT(animalname) >= 2;";

ResultSet rs = st.executeQuery(query);

while(rs.next()){
%>	
	<table class=table>
	<tr>
    <td><%=rs.getString("animalname") %></td>
    </tr>
    </table>
    
<% 
}

%>
</div>
	</div>
		<div class="footer">
		<p>CSC 4710: Winter 2020</p>
	</div>
</main>
</body>
</html>