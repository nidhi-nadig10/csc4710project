<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Adoption Agency | Most Reviews</title>
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
	<h1>Users with Most Reviews</h1>
	
	<table class="table">
		<tr>
			<th>User Name</th>
			<th>Number of Reviews</th>
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

String query = "SELECT (SELECT username From reviews), COUNT(username) FROM reviews GROUP BY username order by COUNT(username) desc;";
ResultSet rs = st.executeQuery(query);

while(rs.next()) { %>
	<table class=table>
	<tr>
    <td><%=rs.getString("username") %></td>
    <td><%=rs.getString("count(username)") %></td>
    </tr>
    </table>

    <%
}
%>
	</div>	
	</main>

</body>
</html>