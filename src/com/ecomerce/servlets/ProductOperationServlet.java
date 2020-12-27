package com.ecomerce.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.ecomerce.dao.CategoryDao;
import com.ecomerce.dao.ProductDao;
import com.ecomerce.entities.Category;
import com.ecomerce.entities.Product;
import com.ecomerce.helper.ConnectionProvider;

/**
 * Servlet implementation class ProductOperationServlet
 */
@WebServlet("/ProductOperationServlet")
@MultipartConfig
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
			String pName=request.getParameter("productName");
			String pDescription=request.getParameter("productDescription");
			int pPrice=Integer.parseInt(request.getParameter("productPrice"));
			int pDiscount=Integer.parseInt(request.getParameter("productDiscount"));
			int pQuantity=Integer.parseInt(request.getParameter("productQuantity"));
			int cId=Integer.parseInt(request.getParameter("cId"));
			
			Part part=request.getPart("productPic");
			
			
			Product p=new Product();
			p.setpName(pName);
			p.setpDescription(pDescription);
			p.setpPrice(pPrice);
			p.setpDiscount(pDiscount);
			p.setpQuantity(pQuantity);
			p.setpPhoto(part.getSubmittedFileName());
			
			CategoryDao dao=new CategoryDao(ConnectionProvider.getConnection());
			Category c=dao.getCategoryByid(cId);
			p.setcId(c);
			
			ProductDao pd=new ProductDao(ConnectionProvider.getConnection());
			boolean flag=pd.saveProduct(p);
			
			//--------------------------------------------------Pic Upload -----------------------------------------------------------------------
			//Find out the path to upload photo
			
			//String path=request.getRealPath("img")+File.separator+"ProductsImage"+File.separator+part.getSubmittedFileName();
			
			
			String path="C:"+File.separator+"Users"+File.separator+"Ashish"+File.separator+"eclipse-workspace"+File.separator+"E-commerce"+File.separator+"WebContent"+File.separator+"img"+File.separator+"ProductsImage"+File.separator+part.getSubmittedFileName();
			System.out.println(path);
			//Now we are writing imge using file i/o in particular folder
			try {
			FileOutputStream fos=new FileOutputStream(path);
			
			
			InputStream is=part.getInputStream();
			
			//Reading data
			
			byte[] data=new byte[is.available()];
			is.read(data);
			
			//Writing data
			
			fos.write(data);
			fos.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		
			
			System.out.println("success");
			HttpSession session=request.getSession();
			session.setAttribute("message","Product Added");
			session.setAttribute("color","success");
			
			response.sendRedirect("admin.jsp");
		}
	}

}
