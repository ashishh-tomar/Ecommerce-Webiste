<%
	
	String message=(String)session.getAttribute("message");
	String color=(String)session.getAttribute("color");
	
		if(message!=null)
		{
			//out.println(message);
			
		%>
		
		<div class="alert alert-<%=color %> alert-dismissible fade show" role="alert">
  		<strong><%=message %></strong> <a href="login.jsp" class="btn btn-outline-dark ml-3">Login</a>
  		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    		<span aria-hidden="true">&times;</span>
  		</button>
		</div>
		<%
			session.removeAttribute("message");
		}
		

%>