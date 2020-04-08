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
			<li class="current-menu-item"><a href="view_favorites.jsp">View Favorites</a></li>
			<li><a href="search_animal.jsp">Search Animals</a></li>
			<li><a href="list_by_price.jsp">List By Price</a></li>
			<li><a href="view_reviews.jsp">View Reviews</a></li>
		</ul>
	</nav>
	
	<main>
	<div class="center">
	<table class = table>
		<tr>
		<th>ADOPTION CRATE</th>
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



String addAnimal = request.getParameter("addAnimal");
String removeAnimal = request.getParameter("removeAnimal");

String query;
PreparedStatement preparedStatement;



if(addAnimal!=null)
{
	query = "INSERT IGNORE INTO ADOPTIONCRATE(name)\r\n" + "VALUES('"+addAnimal+"')";
	preparedStatement = (PreparedStatement) connect.prepareStatement(query);
	preparedStatement.executeUpdate();
}



if(removeAnimal!=null)
{
	query = "DELETE FROM ADOPTIONCRATE WHERE name='"+removeAnimal+"';";
	preparedStatement = (PreparedStatement) connect.prepareStatement(query);
	preparedStatement.executeUpdate();
}


query = "SELECT * FROM ADOPTIONCRATE;";

ResultSet rs = st.executeQuery(query);


while(rs.next()){
%>	
	<table class=table>
	<tr>
    <td><%=rs.getString("name") %></td>
    <td><%=rs.getString("species") %></td>
    <td><%=rs.getString("price") %></td>
    </tr>
    </table>
    
<% 
}
%>	



	
	<% 
	query = "SELECT * FROM ADOPTIONCRATE;";
	rs = st.executeQuery(query); 
	
	%>
	<form action= "adoption_crate.jsp" method= "post" style ="float:left">
	<h3>Remove Animal</h3>
	<select name = "removeAnimal">
		<option></option>
		<% 
		while (rs.next())
			{ 
				String value = rs.getString("name");
			
			%>
			
			<option> <%= value%> </option>
				
			<% }
			
			%>
	</select>
	<br></br>
	
	<button type="submit" value="Remove Animal" class="buttonTwo">Remove Animal</button>
	</form>
	
	
<%
	query = "SELECT * FROM ANIMALS;";
	rs = st.executeQuery(query); 
	%>	
	
<form action= "adoption_crate.jsp" method= "post" style ="float:left">
	<h3>Add Animal</h3>
	<select name = "addAnimal">
		<option></option>
		<% 
		while (rs.next())
			{ 
				String value = rs.getString("name");
			
			%>
			
			<option> <%= value%> </option>
				
			<% }
			
			%>
	</select>
	<br></br>
	
	<button type="submit" value="Find Animals" class="buttonTwo">Add Animal</button>
	</form>
	
<br></br><br></br><br></br>
<form action="adoption_complete.jsp" method ="post" style="float:right">
	<button type="submit" value="Checkout" class="buttonTwo">Checkout</button>
	</form>	
	
	
	


</div>	
	</main>
	<div class="footer">
		<p>CSC 4710: Winter 2020</p>
	</div>
</body>
</html>