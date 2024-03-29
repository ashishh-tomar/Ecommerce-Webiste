<%@page import="com.ecomerce.entities.User"%>
<%@page import="com.ecomerce.helper.Helper"%>
<%@page import="com.ecomerce.entities.Category"%>
<%@page import="com.ecomerce.dao.CategoryDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecomerce.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.ecomerce.dao.ProductDao"%>
<%@page import="com.ecomerce.helper.ConnectionProvider"%>
<%
User user1=(User)session.getAttribute("currentUser");
%>

<%
		ArrayList<Product> l=null;
		String ca=request.getParameter("category");
		ProductDao d=new ProductDao(ConnectionProvider.getConnection());
		
		 if(ca==null || ca.trim().equals("all"))
		{
		 l=d.getAllProducts();
		}
		else
		{
			int cId=Integer.parseInt(ca.trim());
			 l=d.getAllProductsById(cId);
			
		}
		CategoryDao d2=new CategoryDao(ConnectionProvider.getConnection());
		List<Category> cL=d2.getCategories();
	%>



<nav class="navbar navbar-expand-lg navbar-light bg-light custom-bg">
  <div class="container">
   <i class="fa fa-snowflake-o fa-lg text-primary mr-2"></i>
  	<a class="navbar-brand" href="homepage.jsp"><strong>Shockeens</strong></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="homepage.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Shop now <span class="sr-only">(current)</span></a>
      </li>
      
     
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        <%
		for(Category x:cL)
		{
		%>
        
          <a class="dropdown-item" href="index.jsp?category=<%=x.getCategoryId() %>" ><%=x.getCategoryTitle() %></a>
       <%
		}
	%>
        </div>
      </li>
       <li class="nav-item active">
        <a class="nav-link" href="about.jsp">About Us <span class="sr-only">(current)</span></a>
      </li>
      
    </ul>
    <ul class="navbar-nav ml-auto">
    <li class="nav-item active">
        <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus" style="font-size:20px;"></i> <span class="ml-0 cart-items" >(0)</span></a>
      </li>
      
      <%		if(user1==null)
      { 
      %>
    	<li class="nav-item active">
        <a class="nav-link" href="login.jsp">Login </a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="register.jsp">Register</a>
      </li>
      <%
      }
      else{
    	    	  
      %>
      
      <li class="nav-item active">
        <a class="nav-link" href="<%=user1.getUserType().equalsIgnoreCase("admin")?"admin.jsp":"#"%>"><%=user1.getUserName() %> </a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="LogoutServlet">Logout</a>
      </li>
      <%
      }
      %>
    </ul>
  </div>
  </div>
</nav>