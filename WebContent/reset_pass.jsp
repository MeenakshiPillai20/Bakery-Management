<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.configure.*,com.storage.*"%>

<%
String username= (String)session.getAttribute("username");
if(username != null)
{
	 int id = DBData.getUserId(username);
     String pass = request.getParameter("password");
     String cpass = request.getParameter("cpass");
     try 
     {
   	      Connection con = DBConnect.takeConnection();
   	      String query ="update login set password='"+pass+"' where user_id="+id;
   	      PreparedStatement ps = con.prepareStatement(query);
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