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
	
	
	
<%@ page import ="java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection connect = DriverManager
  .getConnection("jdbc:mysql://127.0.0.1:3306/dogAdoptionDB?"
      + "user=john&password=pass1234");
Statement st = connect.createStatement();


String favBreeder = request.getParameter("addBreeder");
String favAnimal = request.getParameter("addAnimal");
String removeBreeder = request.getParameter("removeBreeder");
String removeAnimal = request.getParameter("removeAnimal");
String user = null;

String query;
PreparedStatement preparedStatement;

query = "SELECT * FROM LOGGEDINUSER;";
preparedStatement = (PreparedStatement) connect.prepareStatement(query);
ResultSet rs1 = preparedStatement.executeQuery(query);

if(rs1.next())
{
	user = rs1.getString("username");
}


%>
<main>
	<div class="center">
	<table class = table>
		<tr>
		<th>Favorite Breeders for <% out.print(user);%></th>
		</tr>
	</table>

<%


if(favBreeder!=null)
{
	query = "INSERT INTO FAVBREEDERS(favUser,username)\r\n" + "VALUES('"+favBreeder+"','" + user + "') ON DUPLICATE KEY UPDATE id=id";
	preparedStatement = (PreparedStatement) connect.prepareStatement(query);
	preparedStatement.executeUpdate();
}

if(favAnimal!=null)
{
	query = "INSERT IGNORE INTO FAVANIMALS(favAnimal,username)\r\n" + "VALUES('"+favAnimal+"','" + user + "')";
	preparedStatement = (PreparedStatement) connect.prepareStatement(query);
	preparedStatement.executeUpdate();
}

if(removeBreeder!=null)
{
	query = "DELETE FROM FAVBREEDERS WHERE favUser='"+removeBreeder+"' AND username = '" + user + "';";
	preparedStatement = (PreparedStatement) connect.prepareStatement(query);
	preparedStatement.executeUpdate();
}

if(removeAnimal!=null)
{
	query = "DELETE FROM FAVANIMALS WHERE favAnimal='"+removeAnimal+"' AND username = '" + user + "';";
	preparedStatement = (PreparedStatement) connect.prepareStatement(query);
	preparedStatement.executeUpdate();
}


query = "SELECT * FROM FAVBREEDERS WHERE username ='" + user + "';";
ResultSet rs = st.executeQuery(query);


while(rs.next()){
%>	
	<table class=table>
	<tr>
    <td><%=rs.getString("favUser") %></td>
    </tr>
    </table>
    
<% 
}
%>	<table class=table>
	<tr class="blank_row">
	<td colspan="2"></td>
	</tr>
	</table>
	
	<table class = table>
		<tr>
		<th>Favorite Animals for <% out.print(user);%></th>
		</tr>
	</table>
	

<% 


 query = "SELECT * FROM FAVANIMALS WHERE username ='" + user + "';";
 rs = st.executeQuery(query);
 %>


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


<form action= "view_favorites.jsp" method= "post" style ="float:left">
	<h3>Add Fav Breeder</h3>
	<select name = "addBreeder">
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
	
	<button type="submit" value="Find Animals" class="buttonTwo">Add Fav Breeder</button>
	</form>
	
	<%
	query = "SELECT * FROM FAVBREEDERS WHERE username ='" + user + "';";
	rs = st.executeQuery(query); 
	%>
	
	<form action= "view_favorites.jsp" method= "post" style ="float:left">
	<h3>Remove Fav Breeder</h3>
	<select name = "removeBreeder">
		<option></option>
		<% 
		while (rs.next())
			{ 
				String value = rs.getString("favUser");
			
			%>
			
			<option> <%= value%> </option>
				
			<% }
			
			%>

	</select>
	<br></br>
	
	<button type="submit" value="Find Animals" class="buttonTwo">Remove Fav Breeder</button>
	</form>
	
	<% 
	query = "SELECT * FROM FAVANIMALS WHERE username ='" + user + "';";
	rs = st.executeQuery(query); 
	
	%>
	<form action= "view_favorites.jsp" method= "post" style ="float:right">
	<h3>Remove Fav Animal</h3>
	<select name = "removeAnimal">
		<option></option>
		<% 
		while (rs.next())
			{ 
				String value = rs.getString("favAnimal");
			
			%>
			
			<option> <%= value%> </option>
				
			<% }
			
			%>
	</select>
	<br></br>
	
	<button type="submit" value="Find Animals" class="buttonTwo">Remove Fav Animal</button>
	</form>
	
	
<%
	query = "SELECT * FROM ANIMALS;";
	rs = st.executeQuery(query); 
	%>	
	
<form action= "view_favorites.jsp" method= "post" style ="float:right">
	<h3>Add Fav Animal</h3>
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
	
	<button type="submit" value="Find Animals" class="buttonTwo">Add Fav Animal</button>
	</form>

</div>	
	</main>
	<div class="footer">
		<p>CSC 4710: Winter 2020</p>
	</div>
</body>
</html>