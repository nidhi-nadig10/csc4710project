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
			<li><a href="part3menu.jsp">Part 3 Menu</a></li>
		</ul>
	</nav>
	
	<main>
	<div class="center">
	
	
	
	
<%@ page import ="java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection connect = DriverManager
  .getConnection("jdbc:mysql://127.0.0.1:3306/dogAdoptionDB?"
      + "user=john&password=pass1234");
Statement st = connect.createStatement();


String user1 = request.getParameter("user1");
String user2 = request.getParameter("user2");

String user = null;

String query;
PreparedStatement preparedStatement;
ResultSet rs;

query = "SELECT * FROM LOGGEDINUSER;";
preparedStatement = (PreparedStatement) connect.prepareStatement(query);
ResultSet rs1 = preparedStatement.executeQuery(query);

if(rs1.next())
{
	user = rs1.getString("username");
}



if(user1 != null && user2 != null)
{
	query = "SELECT favanimal, COUNT(*) from FAVANIMALS where username = '" + user1 + "' or username = '" + user2 + "' GROUP BY favanimal HAVING COUNT(*) > 1;";
	rs = st.executeQuery(query);
	%>
	
	<div class="center">
	<table class = table>
		<tr>
		<th>Common Animals for <% out.print(user1 + " and " + user2);%></th>
		</tr>
	</table>
	
	<%
	
	while(rs.next()){
		%>	
			<table class=table>
			<tr>
		    <td><%=rs.getString("favAnimal") %></td>
		    </tr>
		    </table>
		    
		<% 
		}
	
	
	query = "SELECT * FROM USERS;";
	rs = st.executeQuery(query);
	
	%>
	
	<form action= "common_favanimals.jsp" method= "post" style ="float:center">
	<h3>User 1</h3>
	<select name = "user1" multiple = "multiple" size = 7>
		<option></option>
		<% 
		while (rs.next())
			{ 
				String value = rs.getString("username");
			
			%>
			
			<option> <%= value%> </option>
				
			<% }
			
			%>

	</select>


	<% 	
	query = "SELECT * FROM USERS;";
	rs = st.executeQuery(query);
	%>
	
	<h3>User 2</h3>
	<select name = "user2" multiple = "multiple" size = 7>
		<option></option>
		<% 
		while (rs.next())
			{ 
				String value = rs.getString("username");
			
			%>
			
			<option> <%= value%> </option>
				
			<% }
			
			%>

	</select>
	<br></br>
	
	<button type="submit" value="Find Animals" class="buttonTwo">Compare Users</button>
	</form>
	
	
	
	
<%	
}
else
{
	out.println("ENTER TWO USERS TO COMPARE");
	query = "SELECT * FROM USERS;";
	rs = st.executeQuery(query);
	
	%>
	
	<form action= "common_favanimals.jsp" method= "post" style ="float:center">
	<h3>Select USERS</h3>
	<select name = "user1" multiple = "multiple" size = 7>
		<option></option>
		<% 
		while (rs.next())
			{ 
				String value = rs.getString("username");
			
			%>
			
			<option> <%= value%> </option>
				
			<% }
			
			%>

	</select>


	<% 	
	query = "SELECT * FROM USERS;";
	rs = st.executeQuery(query);
	%>
	
	
	<select name = "user2" multiple = "multiple" size = 7>
		<option></option>
		<% 
		while (rs.next())
			{ 
				String value = rs.getString("username");
			
			%>
			
			<option> <%= value%> </option>
				
			<% }
			
			%>

	</select>
	<br></br>
	
	<button type="submit" value="Find Animals" class="buttonTwo">Compare Users</button>
	</form>
	
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