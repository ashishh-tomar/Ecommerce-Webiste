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
<!-- Footer  -->


<footer>
<div class="container wrap">
	<div class="row">
		<div class="col">
			<div class="footer-widget">
				<h4 class="widget-title about-widget">About</h4>
				<p>We strive to have a positive impact on customers, employees, and communities. We are smart, passionate builders with different backgrounds and goals, who share a common desire to always be learning and inventing on behalf of our customers.</p>
				
				<div class="cards">
					
					<img style="width:28px;height:28px;" src="icons/mastercard.svg" alt="" >
					<img style="width:28px;height:28px;" src="icons/paypal.svg" alt="" >
					<img style="width:28px;height:28px;" src="icons/visa.svg" alt="" >
				</div>
				
				<p><span><img style="width:15px;height:12px; margin-bottom:3px" src= "icons/lock.svg"></span>Secure Online Payment </p>
				
			</div>
		</div>
		
		<div class="col">
		<div class="footer-widget">
			<h4 class="widget-title categories-widget">Categories</h4>
				<ul>
					<li><a href="#">Smart Phones</a></li>
					<li><a href="#">Laptops</a></li>
					<li><a href="#">Shoes</a></li>
					<li><a href="#">Clothes</a></li>
					<li><a href="#">Cameras</a></li>
					
				</ul>
		</div>
		</div>
		
		<div class="col">
		<div class="footer-widget">
			<h4 class="widget-title information-widget">Informations</h4>
				<ul>
					<li><a href="#">About Us</a></li>
					<li><a href="#">Contact Us</a></li>
					<li><a href="#">Terms & Conditions</a></li>
					<li><a href="#">Return & Exchange</a></li>
					<li><a href="#">Shipping & Dilivery</a></li>
					
				</ul>
		</div>
		</div>
		
		<div class="col">
			<div class="footer-widget contact-widget">
				<h4 class="widget-title">Contact</h4>
				<div class="contact-address">
					Address : XYX, New Drlhi, India. <br>Pin-Code : 11111 <span><img style="width:15px;height:15px; margin-bottom:3px" src="icons/placeholder.svg" ></span>
				</div>
				<div class="contact-numbers">
				Phone : +91 1234567890	<span><img style="width:15px;height:15px; margin-bottom:3px" src="icons/phone.svg" ></span>
				</div>
				<div class="contact-email">
				E-Mail : XYZ@gmail.com <span><img style="width:15px;height:15px; margin-bottom:3px" src="icons/gmail.svg" ></span>
				</div>
				<div class="social-widgets ">
					<a href="#"><span><img style="width:20px;height:20px; margin-bottom:3px fill:#000;" src="icons/facebook.svg" ></span></a>
					<a href="#"><span><img style="width:20px;height:20px; margin-bottom:3px" src="icons/instagram.svg" ></span></a>
					<a href="#"><span><img style="width:20px;height:20px; margin-bottom:3px" src="icons/twitter.svg" ></span></a>
					<a href="#"><span><img style="width:20px;height:20px; margin-bottom:3px" src="icons/youtube.svg" ></span></a>
				</div>
			
			</div>
		</div>
	
	</div>

<div class="copyright">
	<div class="container">
		<p>Copyright <script type="text/javascript">document.write(new Date().getFullYear());</script>
		All Rights Reserved
		</p>
	</div>
	
</div>

</div>

</footer>

<%@include file="Components/common_modals.jsp"%>
</body>
</html> 