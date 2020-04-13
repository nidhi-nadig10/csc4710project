<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Adoption Agency | </title>
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
	
<%@ page import ="java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection connect = DriverManager
  .getConnection("jdbc:mysql://127.0.0.1:3306/dogAdoptionDB?"
      + "user=john&password=pass1234");
Statement st = connect.createStatement();

String species1 = request.getParameter("species1");
String species2 = request.getParameter("species2");

String user = null;

String query;
PreparedStatement preparedStatement;
ResultSet rs;

/* 
query = "SELECT * FROM LOGGEDINUSER;";
preparedStatement = (PreparedStatement) connect.prepareStatement(query);
ResultSet rs1 = preparedStatement.executeQuery(query);

if(rs1.next())
{
	user = rs1.getString("username");
} */


if(species1 != null && species2 != null)
{
	query = "SELECT A.species, B.species, A.username FROM animals A, animals B WHERE A.species = '" + species1 + "' AND B.species = '" + species2 + "' AND A.username = B.username GROUP BY A.username;";
	rs = st.executeQuery(query);
	%>
	
	<div class="center">
	<table class = table>
		<tr>
		<th>Users who have posted <% out.print(species1 + " and " + species2);%></th>
		</tr>
	</table>
	
	<%
	
	while(rs.next()){
		%>	
			<table class=table>
			<tr>
		    <td><%=rs.getString("username") %></td>
		    </tr>
		    </table>
		    
		<% 
		}
	
	query = "SELECT * FROM ANIMALS GROUP BY SPECIES;";
	rs = st.executeQuery(query);
	
	%>
	
	<form action= "part3page1.jsp" method= "post" style ="float:center">
	<h3>Species One</h3>
	<select name = "species1" multiple = "multiple" size = 7>
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


	<% 	
	query = "SELECT * FROM ANIMALS GROUP BY SPECIES;";
	rs = st.executeQuery(query);
	%>
	
	<h3>User 2</h3>
	<select name = "species2" multiple = "multiple" size = 7>
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
	
	<button type="submit" value="Find Animals" class="buttonTwo">Compare Users</button>
	</form>

<%	
}
else
{
	
	%>
	<h3>Select Two Species</h3>
	
	<%
	query = "SELECT * FROM ANIMALS GROUP BY SPECIES;";
	rs = st.executeQuery(query);
	
	%>
	
	<form action= "part3page1.jsp" method= "post" style ="float:center">
	<h3>Select Species</h3>
	<select name = "species1" multiple = "multiple" size = 7>
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


	<% 	
	query = "SELECT * FROM ANIMALS GROUP BY SPECIES;";
	rs = st.executeQuery(query);
	%>
	
	
	<select name = "species2" multiple = "multiple" size = 7>
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
	
	<button type="submit" value="Find Users" class="buttonTwo">Find Users</button>
	</form>
	
	<%
}

%>

</div>
</div>	
	</main>
	<div class="footer">
		<p>CSC 4710: Winter 2020</p>
	</div>
</body>
</html>