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
		Statement st1 = connect.createStatement();
		
		
		
		
		String query = "SELECT * FROM loggedinuser;";
		ResultSet rs = st.executeQuery(query);
		

		while(rs.next())
		{
			String user = rs.getString("username");
			
			query = "SELECT COUNT(*) FROM animals where username = '"+user+"';";
			ResultSet rs1 = st1.executeQuery(query);
			
				while(rs1.next())
				{
					int count = rs1.getInt("COUNT(*)");
					
					if(count==5)
					{
						out.println("CANNOT ADD ANIMAL: LIMIT = 5");
						%>
						<head>  
						<title>CANNOT ADD ANIMAL LIMIT = 5</title>  
						<meta http-equiv="refresh"content="2; url = user_adoptions.jsp" /> 
						</head>  
						
						
				
			<%	
					} 
					else
					{
						String registerUserSQL = "INSERT INTO animals(name, species, breeder, birthdate, price, traits)\r\n" + 
								"VALUES('"+name+"','"+species+"','"+user+"','"+birthdate+"','"+price+"','"+traits+"');";
							PreparedStatement preparedStatement;
							preparedStatement = (PreparedStatement) connect.prepareStatement(registerUserSQL);
							preparedStatement.executeUpdate();
							out.println("Added to animals table. Redirecting to added animals");
						
								%>
								<head>  
								<title>ANIMAL ADDED</title>  
								<meta http-equiv="refresh"content="2; url = user_adoptions.jsp" /> 
								</head>
								
					<%			
					}
				}
				
		}
				
			
		%>

	<div class="footer">
		<p>CSC 4710: Winter 2020</p>
	</div>
</body>
</html>