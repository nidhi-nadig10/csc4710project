<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Adoption Agency | Review Form</title>
	<link rel="stylesheet" type="text/css" href="woof.jsp">
</head>

<body>
	<nav id="navigation">
		<ul>
			<li><a href="all_adoptions.jsp">Show All Listings</a></li>
			<li><a href = "user_adoptions.jsp">Show My Listings</a></li>
		</ul>
	</nav>
<form action= "insertReview.jsp" method= "post">

<select name = "rating">
<option></option>
<option value = "Totes Adorbs">Excellent</option>
<option value = "Adorbs">Good</option>
<option value = "Cray">Fair</option>
<option value = "Cray-Cray">Poor</option>
</select>
<br></br>
<a>Enter a Short Review</a>
<br>
<textarea rows = "3" name = "review"></textarea>
<input type= "hidden" name="thisitemid1" value = "<%=request.getParameter("thisitemid")%>"/><br/><br/>
<input type="submit"/>
</form>
</body>
</html>