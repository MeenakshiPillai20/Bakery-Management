<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.configure.*,com.storage.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="Bootstrap4CDN.jsp" %>
<link rel="stylesheet" href="./css/thank.css">
<title>Thank You Page</title>
<%
String username= (String)session.getAttribute("username");
if(username != null)
{
	 int id = DBData.getUserId(username);
	 try 
     {
   	  Connection con = DBConnect.takeConnection();
   	  String query ="delete from my_cart where user_id="+id;
   	  PreparedStatement ps = con.prepareStatement(query);
   	  ps.executeUpdate();
		  con.close();
		 
     }
     catch(Exception e)
     {
   	  e.printStackTrace();
     }
}
%>
</head>
<body>
<div class="thankyou-page">
    <div class="_header">
        <div class="logo">
            <img src="https://codexcourier.com/images/banner-logo.png" alt="">
        </div>
        <h1>Thank You!</h1>
    </div>
    <div class="_body">
        <div class="_box">
            <h2>
                <strong>Please check your email</strong> for your order details and bill receipt.
            </h2>
            <p>
                Thank you so much for visiting Mom's Bakery. It means a lot.Please visit again.
            </p>
        </div>
    </div>
    <div class="_footer">
        <p>Having trouble? <a href="">Contact us</a> </p>
        <a class="btn" href="Home.jsp">Back to Homepage</a>
    </div>
</div>
</body>
</html>