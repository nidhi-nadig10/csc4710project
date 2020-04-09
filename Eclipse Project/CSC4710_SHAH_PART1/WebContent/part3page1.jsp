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
	<h1>Users Who Posted 2+ Animals of the Same Species</h1>
	
	<table class="table">
		<tr>
			<th>User Name</th>
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

String animal1 = request.getParameter("animal1");
String animal2 = request.getParameter("animal2");

PreparedStatement preparedStatement;

if(animal1 != null && animal2 != null) {
	String query = "SELECT username FROM animals WHERE species='"+animal1+"' and species='"+animal2+"'"; //SQL STATEMENT TO SELECT USER FROM ANIMALS TABLE THAT HAS POST BOTH SPECIES
	ResultSet rs = st.executeQuery(query);

while(rs.next()){
%>	
	<table class=table>
	<tr>
    <td><%=rs.getString("username") %></td>
    </tr>
    </table>
    
<% 
	}
}
%>

<%
	String query = "SELECT * FROM ANIMALS GROUP BY SPECIES;";
	ResultSet rs = st.executeQuery(query);
%>
	
	<form action="part3page1.jsp" method= "post" style ="float:left">
		<h3>Species 1</h3>
		<select name= "animal1">
		<option></option>
		<% 
		while (rs.next())
			{ 
				String value = rs.getString("species");
			
			%>
			
			<option> <%= value%> </option>
				
			<% }
			
			%>
		</select>
	</form>
	
	<%
	query = "SELECT * FROM ANIMALS GROUP BY SPECIES;";
	rs = st.executeQuery(query); 
	%>
	
	<form action="part3page1.jsp" method= "post" style ="float:right">
		<h3>Species 2</h3>
		<select>
		<option></option>
		<% 
		while (rs.next())
			{ 
				String value = rs.getString("species");
			
			%>
			
			<option> <%= value%> </option>
				
			<% }
			
			%>
		</select>
		<br></br>
		<button type="submit" value="Submit" class="buttonTwo" style ="float:center">Submit</button>
	</form>
	</div>
		</div>
		<div class="footer">
		<p>CSC 4710: Winter 2020</p>
	</div>
	</main>

</body>
</html>