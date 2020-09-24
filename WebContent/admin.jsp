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
<%@include file="Components/common_css_javascript.jsp"%>
</head>
<body>
<%@include file="navbar.jsp" %>
<div class="container ">
	<div class="row mt-3">
		<!-- First col -->
		<div class="col-md-4">
			<div class="card" style=" box-shadow: 1px 1px 25px;color: #757575 ;">
				<div class="card-body text-center">
				<div class="container">
						<img src="img/user.jpg" alt="User" class="img-fluid" style="height:9rem;">
					</div>
					<h2>12365</h2>
					<h3 class="text-uppercase text-muted">Users</h3>
				</div>
			</div>
		
		</div>
		
		<!-- Second col -->
		<div class="col-md-4">
		<div class="card" style=" box-shadow: 1px 1px 25px;color: #757575 ;">
				<div class="card-body text-center">
				<div class="container">
						<img src="img/categories.png" alt="User" class="img-fluid" style="height:9rem;">
					</div>
					<h2>12365</h2>
					<h3 class="text-uppercase text-muted">Categories</h3>
				</div>
			</div>
		
		</div>
		
		<!-- Third col -->
		<div class="col-md-4 text-center">
		
		<div class="card " style=" box-shadow: 1px 1px 25px;color: #757575 ;">
				<div class="card-body">
				<div class="container">
						<img src="img/product2.jpg" alt="User" class="img-fluid" style="height:9rem;">
					</div>
					
					<h2>12365</h2>
					<h3 class="text-uppercase text-muted">Products</h3>
				</div>
			</div>
		
		</div>
		
	</div>
	
	<!-- Second Row -->
	<div class="row mt-5">
	<!-- Col 1 -->
		<div class="col-md-6">
			<div class="card box-shadow">
				<div class="card-body text-center">
				<div class="container">
						<img src="img/addCategories.jpg" alt="User" class="img-fluid" style="height:9rem;">
					</div>
					
					
					<h1 class="text-uppercase text-muted">Add Categories</h1>
				</div>
			</div>
		
		</div>
	<!-- Col 2 -->
		<div class="col-md-6">
		
			<div class="card box-shadow">
				<div class="card-body text-center">
				<div class="container">
						<img src="img/addProduct.jpg" alt="User" class="img-fluid" style="height:9rem;">
					</div>
					
					
					<h1 class="text-uppercase text-muted">Add Products</h1>
				</div>
			</div>
		
		</div>
	
	</div>
</div>

</body>
</html>