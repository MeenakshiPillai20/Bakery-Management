<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.configure.*,com.storage.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	String username = (String) session.getAttribute("username");
	if (username != null) 
	{
		try 
		{
			int u_id = DBData.getUserId(username);
			String name = DBData.getUserName(username);
			int s_id = Integer.valueOf(request.getParameter("s__id"));
			
			Connection con = DBConnect.takeConnection();
			
			String query = "select s_name,s_type,price from stock where s_id="+s_id; //id
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			rs.next();
			
		         String sname = rs.getString(1);
		         String stype = rs.getString(2);
		         int price = rs.getInt(3); 
			
			
			String query1="insert into my_cart(username,o_name,o_type,price,user_id,s_id) values('"+name+"','"+sname+"','"+stype+"',"+price+","+u_id+","+s_id+")";
			
			
			
			
			
			
			
	
			PreparedStatement ps1 = con.prepareStatement(query1);
			ps1.execute();
			
			con.close();
			response.sendRedirect("my_cart.jsp");
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}

	}
	else
	{
		response.sendRedirect("login.jsp");
	}
	%>
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>





