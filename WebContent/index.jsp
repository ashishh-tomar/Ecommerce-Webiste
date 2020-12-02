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

<div class="container-fluid">
<div class="row mt-5">

	<%
		ArrayList<Product> list=null;
		String category=request.getParameter("category");
		ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
		
		 if(category==null || category.trim().equals("all"))
		{
		 list=dao.getAllProducts();
		}
		else
		{
			int cId=Integer.parseInt(category.trim());
			 list=dao.getAllProductsById(cId);
			
		}
		CategoryDao dao2=new CategoryDao(ConnectionProvider.getConnection());
		List<Category> cList=dao2.getCategories();
	%>
	
	<!-- Show Categories -->
	<div class="col-md-3 mt-4">
		<div class="list-group">
  			<a href="index.jsp?category=all" class="list-group-item text-dark list-group-item-action active">
   				<h5> Categories</h5>
  				</a>
  				

	
	<%
		for(Category c:cList)
		{
	%>
			
			<a href="index.jsp?category=<%=c.getCategoryId() %>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle() %></a>
		
	<%
		}
	%>
		</div>
	</div>
	<!-- Showe products -->
	<div class="col-md-8 ml-5">
	
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
							<img class="card-img-top mt-2 " src="img/ProductsImage/<%=p.getpPhoto() %>"  style="max-height:100px;max-width:55%"alt="Card image cap">
						
						</div>
						<div class="card-body">
							<h5 class="card-title"><%=p.getpName() %></h5>
							<p class="card-text"><%=Helper.getTenWords(p.getpDescription()) %></p>
						</div>
						<div class="card-footer">
							<h5>&#8377; <%=p.getDiscountPrice() %>/-</h5>
							<h6 style="font-size:10px;">&#8377;  <%=p.getpPrice()  %>/-    <%=   p.getpDiscount() %>% off   <button class="btn-outline-dark ml-3" onclick="add_to_cart(<%=p.getpId()%> ,'<%=p.getpName()%>' ,<%=p.getDiscountPrice()%>)">Add to Cart</button> </h6>
							
							
							
							
						</div>
					
					</div>
				
				<%
					}
				
				if(list.size()==0)
				{
					%>
						<h5 class="display-4 text-center">No items...</h5>
					<%
				}
				%>
				
				</div>
			</div>
		</div>
	</div>
</div>
</div>


<!-- JavaScript -->
</body>
</html> 