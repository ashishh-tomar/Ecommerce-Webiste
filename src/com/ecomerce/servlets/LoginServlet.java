package com.ecomerce.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecomerce.dao.UserDao;
import com.ecomerce.entities.User;
import com.ecomerce.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		//Authenticate User
		
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		User user=dao.getUserbyEmailAndPassword(email, password);
		
		HttpSession session=request.getSession();
		if(user==null)
		{
			session.setAttribute("message","Invalid Details..!! Please fill Carefully");
			response.sendRedirect("login.jsp");
			
			
		}
		else
		{
			//login
			
			session.setAttribute("currentUser",user);
			
			if(user.getUserType().equalsIgnoreCase("admin"))
			{ 
				//Admin page
				response.sendRedirect("admin.jsp");
			}
			else if(user.getUserType().equalsIgnoreCase("normal"))
			{
				//Normal user page
				response.sendRedirect("normal.jsp");
			}
			else
			{
				response.getWriter().println("We have not identified user Type");
			}
			
			
			
			
		}
		
	}

}
