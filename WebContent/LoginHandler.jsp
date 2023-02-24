<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<%@ page import="java.sql.*, com.configure.DBConnect" %>
<jsp:useBean id="obj" class="com.bean.SignupBean" scope="session" />
<jsp:setProperty property="*" name="obj"/>


<%

String user = request.getParameter("username");
String pass = request.getParameter("password");
String role = request.getParameter("optradio");
String status="";
try
{
	      Connection con = DBConnect.takeConnection();
	      
	      if (role.equals("user"))
	      {
	      	    String query = "select * from login where login_role='"+role+"' and username='"+user+"' and password='"+pass+"'";
                PreparedStatement ps = con.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
    
                if(rs.next())
                {
      	             status="user";
                }
                else
                {
                	 status="false";
                }
	      }
	      else
	      if (role.equals("admin"))
	      {
	      	    String query = "select * from login where login_role='"+role+"' and username='"+user+"' and password='"+pass+"'";
                PreparedStatement ps = con.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
      
                if(rs.next())
                {
                	status="admin";
                }
                else
                {
                	status="false";
                }
	      }
}
catch(Exception e)
{
      e.printStackTrace();
}

    if(status.equals("user"))
    {
	    session.setAttribute("username", obj.getUsername());
	    response.sendRedirect("Home.jsp");  
    }
    if(status.equals("admin"))
    {
    	session.setAttribute("username", obj.getUsername());
	    response.sendRedirect("admin_home.jsp");  
    }
    if(status.equals("false"))
    {
	    response.sendRedirect("login.jsp?status=false"); 
    }
%>
