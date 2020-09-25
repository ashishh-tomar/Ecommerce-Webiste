package com.ecomerce.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecomerce.dao.CategoryDao;
import com.ecomerce.entities.Category;
import com.ecomerce.helper.ConnectionProvider;

/**
 * Servlet implementation class ProductOperationServlet
 */
@WebServlet("/ProductOperationServlet")
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String operation=request.getParameter("operation");
		if(operation.trim().equals("addCategory"))
		{
			String categoryTitle=request.getParameter("categoryTitle");
			String categoryDescription=request.getParameter("categoryDescription");
	
			Category c=new Category();
			c.setCategoryDescription(categoryDescription);
			c.setCategoryTitle(categoryTitle);
			
			CategoryDao dao=new CategoryDao(ConnectionProvider.getConnection());
			boolean flag=dao.saveCategory(c);
			
			if(flag==true)
			{
				HttpSession session=request.getSession();
				session.setAttribute("message","Category Added");
				session.setAttribute("color","success");
				
				response.sendRedirect("admin.jsp");
			}
			else
			{
				HttpSession session=request.getSession();
				session.setAttribute("message","Category Not Added");
				session.setAttribute("color","danger");
				
				response.sendRedirect("admin.jsp");
				
			}
		}
		else if(operation.trim().equals("addProduct"))
		{
			
		}
	}

}
