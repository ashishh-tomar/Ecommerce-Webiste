package com.ecomerce.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;

import com.ecomerce.entities.User;



public class UserDao {
	
	private Connection con;
	
	public UserDao(Connection con)
	{
		this.con=con;
	}

	
	public boolean saveUser(User user)
	{
		boolean flag=false;
		try
		{
			
			String sql="insert into user(userName,userEmail,userPassword,userPhone,userPic,userAddress,userType) values(?,?,?,?,?,?,?)";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,user.getUserName());
			pst.setString(2,user.getUserEmail());
			pst.setString(3,user.getUserPassword());
			pst.setString(4,user.getUserPhone());
			pst.setString(5,user.getUserPic());
			pst.setString(6,user.getUserAddress());
			pst.setString(7,user.getUserType());
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
