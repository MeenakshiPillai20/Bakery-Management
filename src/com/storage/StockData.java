package com.storage;

import com.bean.StockBean;
import com.configure.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StockData {

	public static void setStockDetail(StockBean sb)
	{
		 try
		    {
			       Connection con = DBConnect.takeConnection();
			       String query ="insert into stock(s_name,s_type,price,detail,count) values(?,?,?,?,?)";
			  
			       PreparedStatement ps = con.prepareStatement(query);
				
				   ps.setString(1, sb.getS_name()); 
				   ps.setString(2, sb.getS_type());
				   ps.setInt(3, sb.getPrice());
			   	   ps.setString(4, sb.getDetail());
				   ps.setInt(5, sb.getCount());
				
				   ps.executeUpdate();
				   con.close();
				   
				   
		   }
		   catch(Exception e)
		   {
			 
		   }
	}
	
	 public static int getImageId()
	   { 
		   int id=0;
		   try
		   {
			   Connection con = DBConnect.takeConnection();
			   String query = "select s_id from stock";
			   PreparedStatement ps = con.prepareStatement(query);
			   ResultSet rs = ps.executeQuery();
			   if(rs.last())
			   {
				   id = rs.getInt(1);
			   }
			   con.close();
		   }
		   catch(Exception e)
		   {
			   e.printStackTrace();
		   }  
		   return id;
	   }
	 
	 
		 public static void setImage(String path, int id)
		   { 
			   try
			   {
				   Connection con = DBConnect.takeConnection();
				   String query = "update stock set s_img=? where s_id=?";
				   PreparedStatement ps = con.prepareStatement(query);
				   ps.setString(1, path);
				   ps.setInt(2, id);
				   ps.executeUpdate();
				   con.close();
			   }
			   catch(Exception e)
			   {
				   e.printStackTrace();
			   }  
		   }
 
		
		 
		 public static int getStockId(String name,String type)
		   {
			   int id=0;
			   Connection con = null;
			   try
			   {
				   con = DBConnect.takeConnection();
				   String query = "select s_id from stock where s_name=? and s_type=?";
				   PreparedStatement ps = con.prepareStatement(query);
				   ps.setString(1, name);
				   ps.setString(2, type);
				   System.out.println(name+type);
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
	
}
