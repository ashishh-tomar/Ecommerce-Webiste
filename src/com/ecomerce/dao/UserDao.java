package com.ecomerce.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
	
	public User getUserbyEmailAndPassword(String email,String password)
	{
		User user=null;
		try {
			String sql="select * from user where userEmail=? and userPassword=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,email);
			pst.setString(2,password);
			
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				user=new User();
				int userId=rs.getInt(1);
				String userName=rs.getString(2);
				String userEmail=rs.getString(3);
				String userPassword=rs.getString(4);
				String userPhone=rs.getString(5);
				String userPic=rs.getString(6);
				String userAddress=rs.getString(7);
				String userType=rs.getString(8);
				
				user.setUserId(userId);
				user.setUserAddress(userAddress);
				user.setUserName(userName);
				user.setUserEmail(userEmail);
				user.setUserPhone(userPhone);
				user.setUserPic(userPic);
				user.setUserType(userType);
				user.setUserPassword(userPassword);
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return user;
	}
	
	public int getCount()
	{
		int count=0;
		String sql="select count(*) from user";
		try {
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(sql);
			while(rs.next())
			{
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return count;
	}

}
