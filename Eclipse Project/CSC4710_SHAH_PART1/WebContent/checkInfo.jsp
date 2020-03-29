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