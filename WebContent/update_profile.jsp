<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.configure.*,com.storage.*"%>

<%
String username= (String)session.getAttribute("username");
if(username != null)
{
	 int id = DBData.getUserId(username);
     String name = request.getParameter("name");
     int mobile = Integer.valueOf(request.getParameter("mobile"));
     String email = request.getParameter("email");
     String add = request.getParameter("address");
     String city = request.getParameter("city");
     int pin = Integer.valueOf(request.getParameter("pin"));
     String state = request.getParameter("state");
     String country = request.getParameter("country");
     
     try 
     {
   	      Connection con = DBConnect.takeConnection();
   	      String query ="update user set name=?,mobile=?,email=?,address=?,pincode=?,city=?,state=?,country=? where user_id="+id;
   	      PreparedStatement ps = con.prepareStatement(query);
   	      ps.setString(1, name);
   	      ps.setInt(2, mobile);
	      ps.setString(3, email);
	      ps.setString(4, add);
	      ps.setInt(5, pin);
	      ps.setString(6, city);
	      ps.setString(7, state);
	      ps.setString(8, country);
	      
   	      ps.executeUpdate();
		  con.close();
		  response.sendRedirect("Home.jsp");
     }
     catch(Exception e)
     {
   	  e.printStackTrace();
     }
}
%>