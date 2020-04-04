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
			<li class="current-menu-item"><a href="checkInfo.jsp">Home</a></li>
			<li><a href="show_all.jsp">View Adoptions</a></li>
		</ul>
	</nav>

<%@ page import ="java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<% 
	String user = request.getParameter("user");
	String passw = request.getParameter("passw");
		
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection connect = DriverManager
		 		.getConnection("jdbc:mysql://127.0.0.1:3306/dogAdoptionDB?"
		     + "user=john&password=pass1234");
		
		Statement st = connect.createStatement();
		String query = "SELECT * FROM users WHERE username = " + '"'+ user+'"' + ";";
		
		ResultSet rs = st.executeQuery(query);
		
%>
		
		
		<%
		while(rs.next())
		{
			if(user.equals(rs.getString("username")))
			{
				if(passw.equals(rs.getString("pw")))
				{	
					String dropTablesSQL = "DROP TABLE IF EXISTS LOGGEDINUSER;";
					PreparedStatement preparedStatement;
			    	preparedStatement = (PreparedStatement) connect.prepareStatement(dropTablesSQL);
			    	preparedStatement.executeUpdate();
			    	System.out.println("Tables dropped succesfully.");
			    	
			    	
					String tableCreationSQL = " CREATE TABLE LOGGEDINUSER (\r\n" + 
							"   username varchar(255), 	\r\n" + 
						
							"   PRIMARY KEY(username)\r\n" + 
							");\r\n" + 
							"";
						
						preparedStatement = (PreparedStatement) connect.prepareStatement(tableCreationSQL);
						preparedStatement.executeUpdate();
					
					String query2 = "INSERT INTO loggedinuser (username) VALUES ('"+user+"');";
					
					preparedStatement = (PreparedStatement) connect.prepareStatement(query2);
					preparedStatement.executeUpdate();
					 
					out.println("Successful Login!");
					out.println("Redirecting to Home Page");
								
					 
					
		
					%>
							<head>  
    						<title>HTML Redirect</title>  
    						<meta http-equiv="refresh"content="2; url = show_all.jsp" /> 
    						</head>  
					
				<%	
				} 
				else
				{
					out.println("Username or password does not match try logging in again.");
					out.println("Redirecting back to login page");
							%>
							<head>  
    						<title>HTML Redirect</title>  
    						<meta http-equiv="refresh"content="2; url = login_page.jsp" /> 
    						</head> 
    						
				<%			
				}
			}
			else
			{
				out.println("Username or password does not match try logging in again.");
				%>
					<head>  
    						<title>HTML Redirect</title>  
    						<meta http-equiv="refresh"content="2; url = login_page.jsp" /> 
    						</head> 
				<%
			}
			
			
		}
		
%>
	<div class="footer">
		<p>CSC 4710: Winter 2020</p>
	</div>
</body>
</body>