package com.ecomerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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

}
