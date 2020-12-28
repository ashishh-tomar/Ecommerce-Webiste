<%@page import="java.util.ArrayList"%>
<%@page import="com.ecomerce.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.ecomerce.helper.ConnectionProvider"%>
<%@page import="com.ecomerce.dao.CategoryDao"%>
<%@page import="com.ecomerce.entities.User"%>
<%
User user=(User)session.getAttribute("currentUser");
if(user==null)
{
	session.setAttribute("message","You are not logged in !! Login First to Checkout");	
	response.sendRedirect("login.jsp");
}
else{

%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check Out</title>
<%@include file="Components/common_css_javascript.jsp"%>
</head>
<body>
<%@include file="navbar.jsp" %>

<div class="container">
	<div class="row mt-5">
		<div class="col-md-6">
			<div class="card">
				<div class="card-body">
				<h3 class="text-center mb-5">Your Cart Items</h3>
					<div class="cart-body"></div>
				</div>
			</div>
		
		
		</div>
		<div class="col-md-6">
		<div class="card">
				<div class="card-body">
				<h3 class="text-center mb-5">Customer Details</h3>
				<form action="CheckoutServlet" method="post">
						<div class="form-group">
    						<input value="<%=user.getUserName() %>"  type="text" class="form-control border-top-0 border-right-0 border-left-0" name="name" placeholder="Full Name" required="required">
  						</div>
  						<div class="form-group">
    						<input value="<%=user.getUserEmail() %>"  type="email" class="form-control border-top-0 border-right-0 border-left-0" name="email" placeholder="Email-Address" required="required">
  						</div>
  						
  						<div class="form-group">
    						<input value="<%=user.getUserPhone() %>"   type="text" class="form-control border-top-0 border-right-0 border-left-0" name="phone" placeholder="Phone Number" required="required">
  						</div>
  						<div class="form-group">
    						<textarea   class="form-control border-top-0 border-right-0 border-left-0" name="address"placeholder="ShippingAdress" required="required"><%=user.getUserAddress()%></textarea>
  						</div >
  						
  						<div  class="mb-2 text-center">
  						<button type="submit" onclick="confirm()" class="btn btn-outline-dark  ">Order Now</button>
						<a href="index.jsp" class="btn btn-outline-dark  ">Continue Shopping</a>
						
						</div>
						
  						
					
				</form>
				</div>
			</div>
		
		</div>
	</div>

</div>





<%@include file="Components/common_modals.jsp"%>
</body>
</html>
<%}%>