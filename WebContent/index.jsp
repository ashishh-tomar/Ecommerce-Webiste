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
<div class="row ">
<!--  
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
	

	
	
	<!-- Showe products -->
	
			
				
				<!-- Traversing product -->
				<%
					for(Product p :list)
					{
				%>
				
			       
			  
			       
			       <div class="col-lg-2 col-md-2">
			       <div class="card  mt-4 mb-4 box-shadow " style="width: 14rem;">
                    <img class="card-img-top m-auto" src="img/ProductsImage/<%=p.getpPhoto() %>" style="width:12rem;height:10rem;">
                    <div class="card-body">
                        <div class="d-flex"></div>
                            <h6 class="card-title font-weight-bold"><%=p.getpName() %></h6>
                            <div class="card-subtitle text-muted my-1"><%=Helper.getTenWords(p.getpDescription()) %> </div>
                    
                    <div class="card-text d-flex justify-content-between mt-1 mb-1">
                        
                        <span >
                            <div class="_now h5">&#8377; <%=p.getDiscountPrice() %>/-  <del class="  h6 text-muted">  &#8377;  <%=p.getpPrice()  %>/-</del></div>
                            
                        </span>
                    </div>
                     <div class="text-center">
                    <button class="btn btn-sm btn-block btn-dark text-center  p-2 rounded-5 _cart-btn text-uppercase " onclick="add_to_cart(<%=p.getpId()%> ,'<%=p.getpName()%>' ,<%=p.getDiscountPrice()%>)" >
                        <span>Add To Cart</span>
                       
                    </button>
                    </div>
                        </div>
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