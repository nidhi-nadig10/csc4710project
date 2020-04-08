<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Adoption Agency | Totes Adorbs or Adorbs Animals</title>
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
	<h1>All Totes Adorbs and Adorbs Reviewed Animals</h1>
	
	<table class="table">
		<tr>
			<th>Animal Name</th>
			<th>Rating</th>
			<th>Review</th>
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

String adorbs = "Adorbs";
String totesadorbs = "Totes Adorbs";
String query = "SELECT * FROM REVIEWS WHERE rating = " + '"'+ adorbs+'"' + " or rating = " + '"'+ totesadorbs+'"' + ";";

ResultSet rs = st.executeQuery(query);


while(rs.next()){
%>	
	<table class=table>
	<tr>
    <td><%=rs.getString("animalname") %></td>
    <td><%=rs.getString("rating") %></td>
    <td><%=rs.getString("review") %></td>
    </tr>
    </table>
    
<% 
}

%>
	</div>
	</main>
</body>
</html>