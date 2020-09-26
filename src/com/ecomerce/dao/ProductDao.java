package com.ecomerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
}


