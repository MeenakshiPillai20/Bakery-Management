package com.storage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bean.SignupBean;
import com.configure.DBConnect;

public class DBData {
	  public static int newUser(SignupBean sb)
	   {
		   int i=0;
		   
		   try
		   {
			   Connection con = DBConnect.takeConnection();
			   String query = "insert into user(name,mobile,email,address,pincode,city,state,country,username) values (?,?,?,?,?,?,?,?,?)";
			  
			   PreparedStatement ps = con.prepareStatement(query);
			   ps.setString(1, sb.getName());
			   ps.setInt(2, sb.getMobile());
			   ps.setString(3, sb.getEmail());
			   ps.setString(4, sb.getAddress());
			   ps.setInt(5, sb.getPincode());
			   ps.setString(6, sb.getCity());
			   ps.setString(7, sb.getState());
			   ps.setString(8, sb.getCountry());
			   ps.setString(9, sb.getUsername());
			   
			   i = ps.executeUpdate();
			   
			   String  query1 = "insert into login(login_role,username,password) values (?,?,?)";
			   PreparedStatement ps1 = con.prepareStatement(query1);
			   ps1.setString(1, "user");
			   ps1.setString(2, sb.getUsername());
			   ps1.setString(3, sb.getPassword());
			   ps1.executeUpdate();
			   
			   con.close();
		
		   }
		   catch(Exception e)
		   {
			   e.printStackTrace();
		   }
		   return i;
	   }
	  
	  
	  
	  public static int getUserId(String username)
	   {
		   int id=0;
		   Connection con = null;
		   try
		   {
			   con = DBConnect.takeConnection();
			   String query = "select user_id from login where username=?";
			   PreparedStatement ps = con.prepareStatement(query);
			   ps.setString(1, username);
			   ResultSet rs = ps.executeQuery();
			   if(rs.next())
			   {
				   id = rs.getInt(1);
			   } 
		   }
		   catch(Exception e)
		   {
			   e.printStackTrace();
		   }
		   finally
		   {
			   try 
			   {
				   con.close();
			   }
			   catch(SQLException e)
			   {
				   e.printStackTrace();
			   }
			   
		   }
		   return id;
	   }  
	   public static String getUserName(String username)
	   {
		   String name="";
		   Connection con = null;
		   try
		   {
			   con = DBConnect.takeConnection();
			   String query = "select name from user where username=?";
			   PreparedStatement ps = con.prepareStatement(query);
			   ps.setString(1, username);
			   ResultSet rs = ps.executeQuery();
			   if(rs.next())
			   {
				   name = rs.getString(1);
			   } 
		   }
		   catch(Exception e)
		   {
			   e.printStackTrace();
		   }
		   finally
		   {
			   try 
			   {
				   con.close();
			   }
			   catch(SQLException e)
			   {
				   e.printStackTrace();
			   }
			   
		   }
		   return name;
	   } 
}
