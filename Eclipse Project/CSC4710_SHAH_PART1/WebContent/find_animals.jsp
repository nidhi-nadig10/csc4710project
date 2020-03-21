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
			<li><a href="user_reg.html">Create Account</a></li>
			<li><a href="login_page.jsp">Log In</a></li>
		</ul>
	</nav>
	
	<table class = table>
		<tr>
		<td>ID</td>
		<td>Rating</td>
		<td>Review</td>
		</tr>
	</table>
	
<%@ page import ="java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%
	String rating= request.getParameter("rating");
		
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection connect = DriverManager
	 		.getConnection("jdbc:mysql://127.0.0.1:3306/dogAdoptionDB?"
	     + "user=john&password=pass1234");
	Statement st = connect.createStatement();
	
	String findAnimalSQL = "SELECT * FROM reviews WHERE rating = " + '"'+ rating+'"' + ";";
		
	ResultSet rs = st.executeQuery(findAnimalSQL);
	out.println(rating);
	while(rs.next()){
	%>	
		<table class=table>
		<tr>
	    <td><%=rs.getString("rating") %></td>
	    <td><%=rs.getString("review") %></td>
	    </tr>
	    </table>
	    
	<% 
	}
	%>	

	<div class="footer">
		<p>CSC 4710: Winter 2020</p>
	</div>
</body>
</html>