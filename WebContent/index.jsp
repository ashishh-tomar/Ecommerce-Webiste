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
<title>Welcome to Shockeens</title>
<%@include file="Components/common_css_javascript.jsp"%>
</head>
<body>
<!-- Navbar Start -->
<%@include file="navbar.jsp"%>
<!-- Navbar end -->


<!-- Carosel Start -->
<div class="container-fluid">
<div class="row  mb-4 mt-4">




<!-- Right Column -->
<div class="col-md-10 offset-1">
	
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100 " src="img/carousel-1.jpg"     style="height:30rem;" alt="First slide">
    	<div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Men Fashion</h1>
                                    <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Lorem rebum magna amet lorem magna erat diam stet. Sadips duo stet amet amet ndiam elitr ipsum diam</p>
                                    <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="index.jsp">Shop Now</a>
                                </div>
                            </div>
   		 </div>
   		 
   		 
    <div class="carousel-item">
      <img class="d-block w-100" src="img/carousel-2.jpg" style="height:30rem;" alt="Second slide">
    	 <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Women Fashion</h1>
                                    <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Lorem rebum magna amet lorem magna erat diam stet. Sadips duo stet amet amet ndiam elitr ipsum diam</p>
                                    <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="index.jsp">Shop Now</a>
                                </div>
                            </div>
    </div>
    
    
    
    <div class="carousel-item">
      <img class="d-block w-100" src="img/carousel-3.jpg" style="height:30rem;" alt="Third slide">
    	 <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Kids Fashion</h1>
                                    <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Lorem rebum magna amet lorem magna erat diam stet. Sadips duo stet amet amet ndiam elitr ipsum diam</p>
                                    <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="index.jsp">Shop Now</a>
                                </div>
                            </div>
    </div>
    
    
     <div class="carousel-item">
      <img class="d-block w-100" src="img/static_Images/lab_no25_banner_linajpg.jpg" style="height:30rem;" alt="Second slide">
    	<div class="carousel-caption d-none d-md-block">
    		<h1 class="display-3 ">Up To 50% - 60% Off</h1>
    		
   		 </div>
    </div>
    
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
		
	
	
	</div>
</div>


</div>



<!-- Carosel End -->
 <!-- Categories Start -->
    <div class="container-fluid pt-5">
        <h1 class="font-weight-semi-bold ml-5 mt-3 mb-5">Categories</h1>
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <a class="text-decoration-none" href="">
                    <div class="cat-item d-flex align-items-center mb-4">
                        <div class="overflow-hidden" style="width: 100px; height: 100px;">
                            <img class="img-fluid" src="img/cat-1.jpg" alt="">
                        </div>
                        <div class="flex-fill pl-3">
                            <h6>Ladies</h6>
                            <small class="text-body">35 Products</small>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <a class="text-decoration-none" href="">
                    <div class="cat-item img-zoom d-flex align-items-center mb-4">
                        <div class="overflow-hidden" style="width: 100px; height: 100px;">
                            <img class="img-fluid" src="img/cat-2.jpg" alt="">
                        </div>
                        <div class="flex-fill pl-3">
                            <h6>Cameras</h6>
                            <small class="text-body">60 Products</small>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <a class="text-decoration-none" href="">
                    <div class="cat-item img-zoom d-flex align-items-center mb-4">
                        <div class="overflow-hidden" style="width: 100px; height: 100px;">
                            <img class="img-fluid" src="img/cat-3.jpg" alt="">
                        </div>
                        <div class="flex-fill pl-3">
                            <h6>Shoes</h6>
                            <small class="text-body">50 Products</small>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <a class="text-decoration-none" href="">
                    <div class="cat-item img-zoom d-flex align-items-center mb-4">
                        <div class="overflow-hidden" style="width: 100px; height: 100px;">
                            <img class="img-fluid" src="img/cat-4.jpg" alt="">
                        </div>
                        <div class="flex-fill pl-3">
                            <h6>Cosmetics</h6>
                            <small class="text-body">85 Products</small>
                        </div>
                    </div>
                </a>
            </div>
            
        </div>
    </div>
    <!-- Categories End -->




<div class="container-fluid">
<div class="row ">
  
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
	


   <!-- Offer Start -->
    <div class="container-fluid pt-5 pb-3">
        <div class="row px-xl-5 mb-5">
            <div class="col-md-6">
                <div class="product-offer mb-30" style="height: 300px;">
                    <img class="img-fluid" src="img/offer-1.jpg" alt="">
                    
                </div>
            </div>
            <div class="col-md-6">
                <div class="product-offer mb-30" style="height: 300px;">
                    <img class="img-fluid" src="img/offer-2.jpg" alt="">
                   
                </div>
            </div>
        </div>
    </div>
    <!-- Offer End -->

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
					<li><a href="about.jsp">About Us</a></li>
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
					Address : XYX, New Delhi, India. <br>Pin-Code : 11111 <span><img style="width:15px;height:15px; margin-bottom:3px" src="icons/placeholder.svg" ></span>
				</div>
				<div class="contact-numbers">
				Phone : +91 8766209527	<span><img style="width:15px;height:15px; margin-bottom:3px" src="icons/phone.svg" ></span>
				</div>
				<div class="contact-email">
				E-Mail : info.shockeens@gmail.com <span><img style="width:15px;height:15px; margin-bottom:3px" src="icons/gmail.svg" ></span>
				</div>
				<div class="social-widgets ">
					<a href="https://www.facebook.com/Shockeens/"><span><img style="width:20px;height:20px; margin-bottom:3px fill:#000;" src="icons/facebook.svg" ></span></a>
					<a href="https://www.instagram.com/shopshockeens/"><span><img style="width:20px;height:20px; margin-bottom:3px" src="icons/instagram.svg" ></span></a>
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