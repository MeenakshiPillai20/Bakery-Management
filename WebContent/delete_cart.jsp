<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.configure.*,com.storage.*"%>

<%  
      int id = Integer.valueOf(request.getParameter("s_id"));

      try 
      {
    	  Connection con = DBConnect.takeConnection();
    	  String query ="delete from my_cart where o_id="+id;
    	  PreparedStatement ps = con.prepareStatement(query);
    	  ps.executeUpdate();
		  con.close();
		  response.sendRedirect("my_cart.jsp");
      }
      catch(Exception e)
      {
    	  e.printStackTrace();
      }
   %>
