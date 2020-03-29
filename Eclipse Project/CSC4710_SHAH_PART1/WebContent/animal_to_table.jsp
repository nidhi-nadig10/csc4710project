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
		</ul>
	</nav>
<%@ page import ="java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<% 
	String name= request.getParameter("name");
	String species= request.getParameter("species");
	String birthdate= request.getParameter("birthdate");
	String price= request.getParameter("price");
	String traits =request.getParameter("traits");
		
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection connect = DriverManager
		 		.getConnection("jdbc:mysql://127.0.0.1:3306/dogAdoptionDB?"
		     + "user=john&password=pass1234");
		Statement st = connect.createStatement();
		
		String registerUserSQL = "INSERT INTO animals(name, species, birthdate, price, traits)\r\n" + 
			"VALUES('"+name+"','"+species+"','"+birthdate+"','"+price+"','"+traits+"')";
		PreparedStatement preparedStatement;
		preparedStatement = (PreparedStatement) connect.prepareStatement(registerUserSQL);
		preparedStatement.executeUpdate();
		out.println("Added to animals table");
		
		String registerUserSQL2 = "INSERT INTO useranimals(name, species, birthdate, price, traits)\r\n" + 
				"VALUES('"+name+"','"+species+"','"+birthdate+"','"+price+"','"+traits+"')";
			PreparedStatement preparedStatement2;
			preparedStatement2 = (PreparedStatement) connect.prepareStatement(registerUserSQL2);
			preparedStatement2.executeUpdate();
			out.println("Added to user animals table");
%>

	<div class="footer">
		<p>CSC 4710: Winter 2020</p>
	</div>
</body>
</html>