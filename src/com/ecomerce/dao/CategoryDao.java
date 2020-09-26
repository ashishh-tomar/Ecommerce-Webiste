package com.ecomerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ecomerce.entities.Category;


public class CategoryDao {
private Connection con;
	
	public CategoryDao(Connection con)
	{
		this.con=con;
	}
	
	public boolean saveCategory(Category c)
	{
		boolean flag=false;
		try {
			String sql="insert into category(categoryTitle,categoryDescription) values(?,?)";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,c.getCategoryTitle());
			pst.setString(2,c.getCategoryDescription());
			
			pst.executeUpdate();
			flag=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return flag;
		
	}

	public ArrayList<Category> getCategories()
	{
		ArrayList<Category> list=new ArrayList<Category> ();
		String sql="select * from category";
		try {
		PreparedStatement pst=con.prepareStatement(sql);
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			int cId=rs.getInt(1);
			String categoryTitle=rs.getString(2);
			String categoryDescription=rs.getString(3);
			
			Category c=new Category(cId,categoryTitle,categoryDescription);
			list.add(c);
			
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
		
	}

	public Category getCategoryByid(int cId)
	{
		Category cat=null;
		try {
			String sql="select * from category where categoryId=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1, cId);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				cat=new Category();
				cat.setCategoryId(rs.getInt(1));
				cat.setCategoryTitle(rs.getString(2));
				cat.setCategoryDescription(rs.getString(3));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return cat;
	}

}
