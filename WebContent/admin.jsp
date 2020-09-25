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
			<div class="card box-shadow" style=" cursor: pointer;" data-toggle="modal" data-target="#add-categories">
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
		
			<div class="card box-shadow" style=" cursor: pointer;">
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

<!-- Modal -->


<!-- Modal -->
<!-- Modal -->
<div class="modal fade" id="add-categories" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg">
        <h5 class="modal-title" id="exampleModalLongTitle">Fill Categories Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="" method="post">
        <div class="form-group">
    		
    			<input type="text" class="form-control border-top-0 border-left-0 border-right-0" id="category-title" aria-describedby="emailHelp" name="categoryTitle" placeholder="Enter Category Title">
    	</div>
  		<div class="form-group">
    						<textarea class="form-control border-top-0 border-right-0 border-left-0" name="categoryDescription"placeholder="Enter Category Description"></textarea>
  		</div >
  		
  		<div class="container text-center">
  			<button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
  			<button type="submit" class="btn btn-outline-dark"> Add Category </button>
  		</div>
        
        </form>
      </div>
     
        
      </div>
    </div>
  </div>
</div>

</body>
</html>