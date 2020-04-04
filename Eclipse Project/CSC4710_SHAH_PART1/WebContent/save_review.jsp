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
<%@ page import ="java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%
	String animal = request.getParameter("animalselection");
	String rating= request.getParameter("rating");
	String review= request.getParameter("review");
	
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection connect = DriverManager
	 		.getConnection("jdbc:mysql://127.0.0.1:3306/dogAdoptionDB?"
	     + "user=john&password=pass1234");
	Statement st = connect.createStatement();
	
	String query = "SELECT * FROM loggedinuser;";
	ResultSet rs = st.executeQuery(query);
	
	while(rs.next())
	{	String user = rs.getString("username");
	
	String registerUserSQL = "INSERT INTO REVIEWS(animalname,rating, review, username)\r\n" + 
			"VALUES('"+animal+"','"+rating+"','"+review+"','"+user+"')";
	PreparedStatement preparedStatement;
	preparedStatement = (PreparedStatement) connect.prepareStatement(registerUserSQL);
	preparedStatement.executeUpdate();
	}
	
	
	
	out.println("Thank you for rating!");
	out.println("You rated: " + animal);

	
%>
	<div class="footer">
		<p>CSC 4710: Winter 2020</p>
	</div>
</body>
</html>