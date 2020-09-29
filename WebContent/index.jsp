<%@page import="com.ecomerce.helper.Helper"%>
<%@page import="com.ecomerce.entities.Category"%>
<%@page import="com.ecomerce.dao.CategoryDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecomerce.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.ecomerce.dao.ProductDao"%>
<%@page import="com.ecomerce.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to Business Bustle</title>
<%@include file="Components/common_css_javascript.jsp"%>
</head>
<body>
<!-- Navbar Start -->
<%@include file="navbar.jsp"%>
<!-- Navbar end -->


<div class="row mt-5">

	<%
		ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
		ArrayList<Product> list=dao.getAllProducts();
		CategoryDao dao2=new CategoryDao(ConnectionProvider.getConnection());
		List<Category> cList=dao2.getCategories();
	%>
	
	<!-- Show Categories -->
	<div class="col-md-4 mt-4">
		<div class="list-group">
  			<a href="#" class="list-group-item list-group-item-action active">
   				 Categories
  				</a>
  				

	
	<%
		for(Category c:cList)
		{
	%>
			
			<a href="#" class="list-group-item list-group-item-action"><%=c.getCategoryTitle() %></a>
		
	<%
		}
	%>
		</div>
	</div>
	<!-- Showe products -->
	<div class="col-md-8">
	
		<div class="row mt-4">
			<div class="col-md-12">
				<div class="card-columns">
				
				<!-- Traversing product -->
				<%
					for(Product p :list)
					{
				%>
					<div class="card">
						<div class="container text-center">
							<img class="card-img-top " src="img/ProductsImage/<%=p.getpPhoto() %>"  style="max-height:250px;max-width:100%"alt="Card image cap">
						
						</div>
						<div class="card-body">
							<h5 class="card-title"><%=p.getpName() %></h5>
							<p class="card-text"><%=Helper.getTenWords(p.getpDescription()) %></p>
						</div>
						<div class="card-footer">
							<button class="btn-outline-dark">Add to Cart</button>
							<button class="btn-outline-dark" disabled> &#8377; <%=p.getpPrice() %></button>
						</div>
					
					</div>
				
				<%
					}
				%>
				
				</div>
			</div>
		</div>
	</div>
</div>



<!-- JavaScript -->
</body>
</html>