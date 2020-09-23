<%@page import="com.ecomerce.entities.User"%>
<%

User user=(User)session.getAttribute("currentUser");
if(user==null)
{
	session.setAttribute("message","You are not logged in");	
	response.sendRedirect("login.jsp");
}
else
{
	if(user.getUserType().equalsIgnoreCase("normal"))
	{
		session.setAttribute("message","You are not Admin..You are not granted to access this Page");	
		response.sendRedirect("login.jsp");
		
	}
}

%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
</head>
<body>

</body>
</html>