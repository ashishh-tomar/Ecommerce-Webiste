<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@include file="Components/common_css_javascript.jsp"%>
<style type="text/css">
body{
		background:url("img/Download free png of Gray curve frame template design element 2351377 (1).jpg");
		background-size:cover;
		background-attachment:fixed;
	
	}


</style>
</head>
<body>
<%@include file="navbar.jsp" %>

<div class="container">
<!-- Left Card section -->
<div class="row box-shadow" style="margin-top:10%;">
 	<div class="col-md-6">
  		<img alt="" src="img/Urban Outfitters.jpg" width="100%" height="100%" style="width:40rem; height:27rem;">
  	</div>
  	<div class="col-md-6">
	<div class="card  border-0" style="margin-left:13% ;height:27rem;">
	<%@include file="Components/message.jsp" %>
		<div class="card-body">
  			
  				<!-- Right Card section -->
  			
  					
  						<div class="text-center"><h3 class="mt-0 mb-5">Login</h3></div>
  						<!-- Form -->
  						<form action="LoginServlet" method="post">
  						
  						
  							<div class="form-group">
    							<label for="exampleInputEmail1">Email address</label>
    							<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    							<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  							</div>
  							<div class="form-group">
    							<label for="exampleInputPassword1">Password</label>
    							<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  							</div>
  
						
  						<div  class="mt-5 text-center">
  						<button type="submit" class="btn btn-outline-dark  "><b>Login</b></button>
						</div>
						</form>


  					</div>
  				
  					
  				</div>
  			</div>
    
  		</div>
</div>



</body>
</html>