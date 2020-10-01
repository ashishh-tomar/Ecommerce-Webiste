package com.ecomerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ecomerce.entities.Category;
import com.ecomerce.entities.Product;

public class ProductDao {
private Connection con;
	
	public ProductDao(Connection con)
	{
		this.con=con;
	}
	public boolean saveProduct(Product p)
	{
		boolean flag=false;
		String sql="insert into product(pName,pDiscription,pPhoto,pPrice,pDiscount,pQuantity,cId) values(?,?,?,?,?,?,?)";
		try {
			
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,p.getpName());
			pst.setString(2,p.getpDescription());
			pst.setString(3, p.getpPhoto());
			pst.setInt(4,p.getpPrice());
			pst.setInt(5,p.getpDiscount());
			pst.setInt(6,p.getpQuantity());
			pst.setInt(7,p.getcategory().getCategoryId());
			int i=pst.executeUpdate();
			if(i!=0)
			{
			flag=true;
			}
			else
			{
				flag=false;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return flag;
	}
	
	
	//Get All Products
	
	public ArrayList <Product> getAllProducts()
	{
		ArrayList<Product> list=new ArrayList<Product>();
		
		String sql="select * from product";
		try {
			PreparedStatement pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				int pId=rs.getInt(1);
				String pName=rs.getString(2);
				String pDescription=rs.getString(3);
				String pPhoto=rs.getString(4);
				int pPrice=rs.getInt(5);
				int pDiscount=rs.getInt(6);
				int pQuantity=rs.getInt(7);
				int cId=rs.getInt(8);
				Category c=new Category();
				c.setCategoryId(cId);
				
				Product p=new Product();
				p.setpId(pId);
				p.setpName(pName);
				p.setpDescription(pDescription);
				p.setpPhoto(pPhoto);;
				p.setpPrice(pPrice);;
				p.setpDiscount(pDiscount);
				p.setpQuantity(pQuantity);
				p.setcId(c);
				
				list.add(p);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
		
	}
	
	public ArrayList <Product> getAllProductsById(int catId)
	{
		ArrayList<Product> list=new ArrayList<Product>();
		
		String sql="select * from product where cId=?";
		try {
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1,catId);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				int pId=rs.getInt(1);
				String pName=rs.getString(2);
				String pDescription=rs.getString(3);
				String pPhoto=rs.getString(4);
				int pPrice=rs.getInt(5);
				int pDiscount=rs.getInt(6);
				int pQuantity=rs.getInt(7);
				int cId=rs.getInt(8);
				Category c=new Category();
				c.setCategoryId(cId);
				
				Product p=new Product();
				p.setpId(pId);
				p.setpName(pName);
				p.setpDescription(pDescription);
				p.setpPhoto(pPhoto);;
				p.setpPrice(pPrice);;
				p.setpDiscount(pDiscount);
				p.setpQuantity(pQuantity);
				p.setcId(c);
				
				list.add(p);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
		
	}
}


