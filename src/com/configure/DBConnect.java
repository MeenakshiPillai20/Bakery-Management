package com.configure;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	public static Connection takeConnection()
	{
		Connection con = null;
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bakery","root","Meenu");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}

}
