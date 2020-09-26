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
<div class="container-fluid">
<%@include file="Components/message.jsp"%>
</div>
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
		
			<div class="card box-shadow " style=" cursor: pointer;" data-toggle="modal" data-target="#add-product">
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


<!-- Modal for add category -->
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
        <form action="ProductOperationServlet" method="post">
        <input type="hidden" name="operation" value="addCategory">
        <div class="form-group">
    		
    			<input type="text" class="form-control border-top-0 border-left-0 border-right-0" id="category-title"  name="categoryTitle" placeholder="Enter Category Title">
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
  
<!-- Modal for add Product -->
 


<!-- Modal -->
<div class="modal fade" id="add-product" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg">
        <h5 class="modal-title" id="exampleModalLabel">Add Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
      <input type="hidden" name="operation" value="addProduct">
              <div class="form-group">
    		<input type="text" class="form-control border-top-0 border-left-0 border-right-0" id="pName" name="productName" placeholder="Enter Product Name" required="required">
    	</div>
    	<div class="form-group">
    						<textarea class="form-control border-top-0 border-right-0 border-left-0" name="productDescription"placeholder="Enter Product Description" required="required"></textarea>
  		</div >
    	<div class="form-group">
    		
    			<input type="number" class="form-control border-top-0 border-left-0 border-right-0" id="pPrice"  name="productPrice" placeholder="Enter Product Price" required="required">
    	</div>
    	
    	<div class="form-group">
    		
    			<input type="number" class="form-control border-top-0 border-left-0 border-right-0" id="pDiscount"  name="productDiscount" placeholder="Enter Discount on Product">
    	</div>
    	<div class="form-group">
    		
    			<input type="number" class="form-control border-top-0 border-left-0 border-right-0" id="pQuantity"  name="productQuantity" placeholder="Enter Product Quantity" required="required">
    	</div>
    	
    	<% 
    		CategoryDao dao=new CategoryDao(ConnectionProvider.getConnection());
			ArrayList<Category> list=dao.getCategories();
    	%>
    	<div class="form-group text-muted">
    		<select name="cId" class="form-control" required="required">
    			
    			<%for(Category c:list){ 
    			
    			%>
    			<option value="<%=c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
    			<%
    			}
    			%>
    		</select>
    	
    	</div>
    	
    	
    	
    	<div class="input-group mb-3">
  			
  			<div class="custom-file" >
    			<input type="file" class="custom-file-input" id="inputGroupFile01" name="productPic" required="required">
    			<label class="custom-file-label" for="inputGroupFile01">Choose Product Picture</label>
  			</div>
		</div>
		
  			<div class="container text-center">
  			<button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
  			<button type="submit" class="btn btn-outline-dark"> Add Product </button>
  		</div>
		
  		
    	
    	</form>
        
      </div>
     
    </div>
  </div>
</div>


</body>
</html>