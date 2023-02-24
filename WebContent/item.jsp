<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.configure.*,com.storage.DBData"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="Bootstrap4CDN.jsp" %>
<link rel="stylesheet" href="./css/home_style.css">
<script type="text/javascript" src="./js/toggle.js"></script>
<script type="text/javascript" src="./js/CheckPassword.js"></script>
<title>Menu Page</title>
</head>
<body>
<!-- NAVBARS -->


   <nav class="navbar navbar-expand-sm bg-dark  navbar-dark  text-white justify-content-end sticky-top">
  <!-- Brand -->
  <a class="navbar-brand mr-auto" href="#">
      <img src="img\logo.jpg" alt="Logo" style="width:80px; height:40px;">
 </a>
   
  <!-- Links -->
  <ul class="navbar-nav">
  
    <li class="nav-item active">
      <a class="nav-link" href="Home.jsp">HOME</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="item.jsp">PRICE LIST</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="my_cart.jsp">MY CART</a>
    </li>
    
    <%
    String username= (String)session.getAttribute("username");
     if(username != null)
     {
    	 int id = DBData.getUserId(username);
    	 String name = DBData.getUserName(username);
    	 
     
%>
    <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        <%=name%>
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="" data-toggle="modal" data-target="#Edit">Edit Profile</a>
        <a class="dropdown-item" href="" data-toggle="modal" data-target="#Reset">Reset Password</a>
        <a class="dropdown-item" href="" data-toggle="modal" data-target="#Order">Your Order</a>
        <a class="dropdown-item" href="LogoutHandler.jsp">Logout</a>
      </div>
<%
     }
%>  
  </ul>
   
    <form class="form-inline" action="login.jsp">
    <button class="btn btn-success" type="submit">LOGIN</button>
  </form>
</nav>






<div class="container-fluid bg-light text-dark text-center" style="padding:30px;">
   <table class="table table-bordered table-cente border border-dark" style="width:60%;margin-left:20%;​border-style: solid;">
    <thead class="bg-success text-white">
      <tr>
        <th>Item_no.</th>
        <th>Item Name</th>
        <th>Type</th>
        <th>Price</th>
      </tr>
    </thead>
    
<%
try 
{
	Connection con = DBConnect.takeConnection();
	String query = "select s_id,s_name,s_type,price from stock";
	PreparedStatement ps = con.prepareStatement(query);
	ResultSet rs = ps.executeQuery();
				
	while (rs.next()) 
	{
%>
	<tbody>
	   <tr>
		   <td><%=rs.getString(1)%></td>
		   <td><%=rs.getString(2)%></td>
		   <td><%=rs.getString(3)%></td>
		   <td><%="₹ "+rs.getString(4)%></td>
		 
	   </tr>
    </tbody>
<%
	}
    con.close();
} 
catch (Exception e) 
{
	e.printStackTrace();
}
%>
</table>
</div>
















<!-- Model - 1(Edit) -->

           <div class="modal fade" id="Edit">
               <div class="modal-dialog">
                  <div class="modal-content">
                    <!-- Modal Header -->
                      <div class="modal-header">
                           <h3 class="modal-title">Your Account</h3>
                           <button type="button" class="close" data-dismiss="modal">&times;</button>
                     </div>
                     
                     <!-- Modal body -->
                     <div class="modal-body">
                      
<%
      
      if(username != null)
      {
	       int id = DBData.getUserId(username);
	       try 
           {

			    Connection con = DBConnect.takeConnection();
			    String query = "select * from user where user_id="+id;
			    PreparedStatement ps = con.prepareStatement(query);
			    ResultSet rs = ps.executeQuery();
			    if (rs.next()) 
			    {
			  
%>	
                          <form action="update_profile.jsp" method="post">
                          
                             <div class="form-group">
                                  <div class="row">
                                     <label  class="col-md-2 control-label">Name</label>
                                     <div class="col-md-9">
                                         <input type="text" class="form-control" name="name" value=<%=rs.getString(2) %> >
                                     </div>
                                  </div>
                             </div>
                                    
                             <div class="form-group">
                                  <div class="row">
                                     <label  class="col-md-2 control-label">Mobile</label>
                                     <div class="col-md-9">
                                         <input type="text" class="form-control" name="mobile" value=<%=rs.getString(3) %> >
                                     </div>
                                  </div>
                             </div>
                             
                              <div class="form-group">
                                  <div class="row">
                                     <label  class="col-md-2 control-label">Email</label>
                                     <div class="col-md-9">
                                         <input type="text" class="form-control" name="email" value=<%=rs.getString(4) %> >
                                     </div>
                                  </div>
                             </div>
                             <div class="form-group">
                                  <div class="row">
                                     <label  class="col-md-2 control-label">Address</label>
                                     <div class="col-md-9">
                                         <textarea class="form-control" rows="2" name="address" ><%=rs.getString(5) %> </textarea>
                                     </div>
                                  </div>
                             </div><br>
                             
                              <div class="form-group">
                                  <div class="row">
                                     <label  class="col-md-2 control-label">City</label>
                                     <div class="col-md-4">
                                         <input type="text" class="form-control" name="city" value=<%=rs.getString(7) %> >
                                     </div>
                                     <label  class="col-md-2 control-label">Pincode</label>
                                     <div class="col-md-4">
                                         <input type="text" class="form-control" name="pin" value=<%=rs.getString(6) %> >
                                     </div>
                                  </div>
                             </div>
                             
                              <div class="form-group">
                                  <div class="row">
                                     <label  class="col-md-2 control-label">State</label>
                                     <div class="col-md-4">
                                         <input type="text" class="form-control" name="state" value=<%=rs.getString(8) %> >
                                     </div>
                                     <label  class="col-md-2 control-label">Country</label>
                                     <div class="col-md-4">
                                         <input type="text" class="form-control" name="country" value=<%=rs.getString(9) %> >
                                     </div>
                                  </div>
                             </div><br>
             
                          
                             <div class="form-group">
                                 <!-- Button -->                                        
                                 <div class="col-md-12 text-center">
                                       <input type="submit" id="btn-signup" class="btn btn-info"  value="Update">
                           
                                 </div>
                             </div>
                      </form>
<% 
                       }
			    con.close();

			}
			catch (Exception e)
			{
			     e.printStackTrace();
			}
}
%>
                  </div>
        
                  </div>
               </div>
           </div>
           
           
<!-- Model - 2(Reset) -->

           <div class="modal fade" id="Reset">
               <div class="modal-dialog">
                  <div class="modal-content">
                  
                    <!-- Modal Header -->
                      <div class="modal-header">
                           <h3 class="modal-title">Change your Account Password</h3>
                           <button type="button" class="close" data-dismiss="modal">&times;</button>
                     </div>
                     
                     
                     <!-- Modal body -->
                     <div class="modal-body">
                            <form action="reset_pass.jsp" method="post" name="signupform">
                          
                             <div class="form-group">
                                  <div class="row">
                                     <label  class="col-md-4 control-label">New Password</label>
                                     <div class="col-md-8">
                                         <input type="password" class="form-control" name="password" placeholder="Enter your new password" required>
                                     </div>
                                  </div>
                             </div>
                             
                              <div class="form-group">
                                  <div class="row">
                                     <label  class="col-md-4 control-label">Confirm Password</label>
                                     <div class="col-md-8">
                                         <input type="text"  onkeyup="checkPassword()" class="form-control" name="cpass" placeholder="Confirm your new password" required>
                                         <span id="msg"></span>
                                     </div>
                                  </div>
                             </div><br>
                             
                             <div class="form-group">
                                 <!-- Button -->                                        
                                 <div class="col-md-12 text-center">
                                       <input type="submit" id="btn-signup" class="btn btn-info"  value="Submit">
                           
                                 </div>
                             </div>
                          </form>
                    </div>
        
                  </div>
               </div>
           </div>
           
     
<!-- Model - 3(Order) -->

           <div class="modal fade" id="Order">
               <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                  
                     <!-- Modal Header -->
                      <div class="modal-header">
                           <h3 class="modal-title">Your Order History</h3>
                           <button type="button" class="close" data-dismiss="modal">&times;</button>
                     </div>
        
                     <!-- Modal body -->
                     <div class="modal-body">
<%
      
      if(username != null)
      {
	       int id = DBData.getUserId(username);
	       try 
           {

			    Connection con = DBConnect.takeConnection();
			    String query = "select id,item,price,count,date from order_detail where user_id="+id;
			    PreparedStatement ps = con.prepareStatement(query);
			    ResultSet rs = ps.executeQuery();
%>
                          
                          <table class="table table-striped table-bordered table-hover text-center">
                            <thead class="thead-light">
                               <tr>
                                  <th>ID</th>
                                  <th>Item</th> 
                                  <th>Price</th>
                                  <th>Quantity</th>
                                  <th>Date</th>
                              </tr>
                             </thead>
                              <% 
						          while (rs.next()) {
						       %>
						       <tbody>
							<tr>
								<td><%=rs.getString(1)%></td>
								<td><%=rs.getString(2)%></td>
								<td><%=rs.getString(3)%></td>
								<td><%=rs.getString(4)%></td>
								<td><%=rs.getString(5)%></td>
							</tr>
						</tbody>
						<%
						}
						
						%>
                        </table>  <br><br><br>                       
                    </div>
                    <div class="modal-footer">
					     <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				    </div>
                  </div>
               </div>
           </div>
<%
                    con.close();

					}
					catch (Exception e)
					{
					     e.printStackTrace();
					}
     }
%> 

           


</body>
</html>