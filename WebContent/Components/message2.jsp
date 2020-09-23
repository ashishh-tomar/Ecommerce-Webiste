<%
	
	String message=(String)session.getAttribute("message");
	
	
		if(message!=null)
		{
			//out.println(message);
			
		%>
		
		<div class="alert alert-danger alert-dismissible fade show mt-1" role="alert">
  		<strong><%=message %></strong> 
  		
		</div>
		<%
			session.removeAttribute("message");
		}
		

%>