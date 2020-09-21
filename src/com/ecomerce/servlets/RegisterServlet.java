package com.ecomerce.servlets;

import java.io.IOException;
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
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		
		User user=new User(name,email,password,phone,"default.jpg",address,"normal");
		
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		boolean flag=dao.saveUser(user);
		if(flag==true)
		{
			HttpSession session=request.getSession();
			session.setAttribute("message","Registration Successfull");
			session.setAttribute("color","success");
			
			response.sendRedirect("register.jsp");
		}
		else
		{
			HttpSession session=request.getSession();
			session.setAttribute("message","Registration Failed");
			session.setAttribute("color","danger");
			
			response.sendRedirect("register.jsp");
		}
		
		
		System.out.println(name+email+password+phone);
	}

}
