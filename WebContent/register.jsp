<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register here</title>
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
<%@include file="navbar.jsp"%>

<div class="container">
	<div class="card box-shadow border-0" style="margin-top:10%">
	<%@include file="Components/message.jsp" %>
		<div class="card-body">
  			<div class="container-fluid">
  				<div class="row">
  				<!-- Left Card section -->
  			
  					<div class="col-md-6">
  						<div class="text-center"><h4 class=" mt-2 mb-2 font-weight-light">Sign Up</h4></div>
  						
  						<!-- Form -->
  						<form action="RegisterServlet" method="post">
  						<div class="form-group">
    						<input type="text" class="form-control border-top-0 border-right-0 border-left-0" name="name" placeholder="Full Name" required="required">
  						</div>
  						<div class="form-group">
    						<input type="email" class="form-control border-top-0 border-right-0 border-left-0" name="email" placeholder="Email-Address" required="required">
  						</div>
  						<div class="form-group">
    						<input type="password" class="form-control border-top-0 border-right-0 border-left-0" name="password" placeholder="Password" required="required">
  						</div>
  						<div class="form-group">
    						<input type="text" class="form-control border-top-0 border-right-0 border-left-0" name="phone" placeholder="Phone Number" required="required">
  						</div>
  						<div class="form-group">
    						<textarea class="form-control border-top-0 border-right-0 border-left-0" name="address"placeholder="Adress" required="required"></textarea>
  						</div >
  						
  						<div  class="mb-2"style="margin-left:80%;">
  						<button type="submit" class="btn btn-outline-dark  ">Sign Up</button>
						</div>
						</form>


  					</div>
  				<!-- Right Card section -->
  					<div class="col-md-6">
  						<img alt="" src="img/Card-baground.jpg" width="100%" height="100%" >
  				
  					</div>
  				</div>
  			</div>
    
  		</div>
</div>
</div>

</body>
</html>