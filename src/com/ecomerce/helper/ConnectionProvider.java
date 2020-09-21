package com.ecomerce.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	
	private static Connection con;
	
	public static Connection getConnection()
	{
		String url="jdbc:mysql://localhost:3307/ecommerce";
		String user="root";
		String pass="05111998";
		try {
			
			if(con==null) 
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
			
				con=DriverManager.getConnection(url,user,pass);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}

}
