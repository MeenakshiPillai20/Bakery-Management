<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.configure.*,com.storage.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="Bootstrap4CDN.jsp" %>
<link rel="stylesheet" href="./css/home_style.css">
<script type="text/javascript" src="./js/toggle.js"></script>
<script type="text/javascript" src="./js/CheckPassword.js"></script>
<script type="text/javascript">
   $("a").click(function () {
	   event.preventDefault();
	});
</script>
<title>Home Page</title>

</head>
<body>

<!-- NAVBARS -->


   <nav class="navbar navbar-expand-sm bg-dark  navbar-dark  text-white justify-content-end sticky-top">
  <!-- Brand -->
  <a class="navbar-brand mr-auto" href="#">
      <img src="img\logo.jpg" alt="Logo" style="width:80px; height:40px;">
 </a>
   <form class="form-inline mr-5" action="">
    <input class="form-control mr-sm-2" type="text" placeholder="Search">
    <button class="btn btn-success" type="submit" name="search">Search</button>
  </form>
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


  <!-- ITEMS -->
  
  
<div class="container-fluid border bg-light text-dark border">
   <div class="row border">
       <div class="col-sm-2 text-center">
           <img src="img\offer2.jpg" class="rounded">
           <p class="font-weight-bold">OFFERS</p>
      </div>
       <div class="col-sm-2 d-flex justify-content-center text-center">
          <a href="#cake" onclick="toggle_visibility('cake');" class="font-weight-bold text-center">
             <img src="img\cake2.jpg" class="rounded" >
          CAKES
          </a>
      </div>
       <div class="col-sm-2 d-flex justify-content-center text-center">
         <a href="#pastry" onclick="toggle_visibility('pas');" class="font-weight-bold text-center">
           <img src="img\pastry1.jpg" class="rounded" >
          PASTRY
         </a>
      </div>
       <div class="col-sm-2 d-flex justify-content-center text-center">
         <a href="#roll" onclick="toggle_visibility('roll');" class="font-weight-bold text-center">
           <img src="img\cream1.jpg" class="rounded" >
          CREAM ROLL
        </a>
      </div>
       <div class="col-sm-2 d-flex justify-content-center text-center">
         <a href="#paties" onclick="toggle_visibility('pat');" class="font-weight-bold text-center">
           <img src="img\paties1.jpg" class="rounded" >
         PATIES
         </a>
      </div>
       <div class="col-sm-2 d-flex justify-content-center text-center">
         <a href="#cook" onclick="toggle_visibility('cook');" class="font-weight-bold text-center">
           <img src="img\cookies1.jpg" class="rounded" >
         COOKIES
        </a>
      </div>
      
   </div>
</div>

  <!-- SLIDESHOW -->
  

<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="image\back 2.jpg" alt="Los Angeles" height="310px" width="100%">
    </div>
    <div class="carousel-item">
      <img src="image\back 3.jpg" alt="Chicago" height="310px" width="100%">
    </div>	
    <div class="carousel-item">
      <img src="image\back1.jpg" alt="New York" height="310px" width="100%">
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>












<!--  CAKE Section -->

<div id="cake" class="container-fluid bg-light text-dark font-weight-bold  cake">
    <h3 style="font-family: Comic Sans MS;">
       <strong><a id="cake">CAKE SECTION... </a></strong>
     </h3>
    <div class="row">
        <div class="col-sm-1 "></div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
            <a href="items_detail.jsp?id=1" class="font-weight-bold">
               <img src="image\1.jpg" class="rounded" width="200px" height="100px" >  
    Marble Cake
            </a>
        </div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
           <a href="items_detail.jsp?id=2" class="font-weight-bold text-center ">
             <img src="image\2.jpg" class="rounded" width="200px" height="100px" >
    Strawberry Cake
           </a>
        </div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
            <a href="items_detail.jsp?id=3" class="font-weight-bold text-center ">
             <img src="image\3.jpg" class="rounded" width="200px" height="100px">
    Chocolate Cake
           </a>
        </div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
           <a href="items_detail.jsp?id=4" class="font-weight-bold text-center ">
             <img src="image\4.jpg" class="rounded" width="200px" height="100px">
    Vanilla Cake
           </a>
        </div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
           <a href="items_detail.jsp?id=5" class="font-weight-bold text-center ">
             <img src="image\5.jpg" class="rounded" width="200px" height="100px">
    Oreo Cake
           </a>
        </div>
        <div class="col-sm-1 "> </div>
   </div>
</div>

<!--  PASTRY Section -->

<div id="pas" class="pas container-fluid bg-light text-dark font-weight-bold"  style="display: none;">
    <h3 style="font-family: Comic Sans MS;"> 
          <strong><a id="pastry"> PASTRY SECTION...</a> </strong>
    </h3>
    <div class="row">
         <div class="col-sm-1 "></div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
            <a href="items_detail.jsp?id=6" class="link font-weight-bold text-center ">
               <img src="image\6.jpg" class="rounded" width="200px" height="100px">  
    Vanilla Pastry
            </a>
        </div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
           <a href="items_detail.jsp?id=7" class="font-weight-bold text-center ">
             <img src="image\7.jpg" class="rounded" width="200px" height="100px">
    Red VelvetPastry
           </a>
        </div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
            <a href="items_detail.jsp?id=8" class="font-weight-bold text-center ">
             <img src="image\8.jpg" class="rounded" width="200px" height="100px">
    Pineapple Pastry
           </a>
        </div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
           <a href="items_detail.jsp?id=9" class="font-weight-bold text-center ">
             <img src="image\9.jpg" class="rounded" width="200px" height="100px" >
    Mango Pastry
           </a>
        </div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
           <a href="items_detail.jsp?id=10" class="font-weight-bold text-center ">
             <img src="image\10.jpg" class="rounded" width="200px" height="100px" >
    Tempting Truffle Pastry
           </a>
        </div>
        <div class="col-sm-1 "></div>
   </div>
</div>


<!--  CREAM ROLL Section -->

<div id="roll" class="roll  container-fluid bg-light text-dark font-weight-bold" style="display: none;">
    <h3 style="font-family: Comic Sans MS;">
         <strong> <a id="roll"> CREAM ROLL SECTION... </a></strong>
   </h3>
    <div class="row">
         <div class="col-sm-1 "></div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
            <a href="items_detail.jsp?id=11" class="font-weight-bold text-center ">
               <img src="image\11.jpg" class="rounded" width="200px" height="100px">  
    Pineapple Cream Roll
            </a>
        </div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
           <a href="items_detail.jsp?id=12" class="font-weight-bold text-center ">
             <img src="image\12.jpg" class="rounded" width="200px" height="100px">
    Kulfi Cream Roll
           </a>
        </div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
            <a href="items_detail.jsp?id=33" class="font-weight-bold text-center ">
             <img src="image\13.jpg" class="rounded" width="200px" height="100px" >
    Chocolate Cream Roll
           </a>
        </div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
           <a href="items_detail.jsp?id=14" class="font-weight-bold text-center ">
             <img src="image\14.jpg" class="rounded" width="200px" height="100px" >
    Vanilla Cream Roll
           </a>
        </div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
           <a href="items_detail.jsp?id=15" class="font-weight-bold text-center ">
             <img src="image\15.jpg" class="rounded" width="200px" height="100px">
    Orange Cream Roll
           </a>
        </div>
        <div class="col-sm-1 "></div>
   </div>
</div>


<!--  PATIES Section -->

<div id="pat" class="pat container-fluid bg-light text-dark font-weight-bold"  style="display: none;">
    <h3 style="font-family: Comic Sans MS;"> 
        <strong> <a id="paties"> PATIES SECTION... </a></strong>
    </h3>
    <div class="row">
         <div class="col-sm-1 "></div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
            <a href="items_detail.jsp?id=16" onclick="return false" class="font-weight-bold text-center ">
               <img src="image\16.jpg" class="rounded" width="200px" height="100px">  
    Potato Patties
            </a>
        </div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
           <a href="items_detail.jsp?id=17" class="font-weight-bold text-center ">
             <img src="image\17.jpg" class="rounded" width="200px" height="100px" >
    Pizza Patties
           </a>
        </div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
            <a href="items_detail.jsp?id=18" class="font-weight-bold text-center ">
             <img src="image\18.jpg" class="rounded" width="200px" height="100px">
    Paneer Patties
           </a>
        </div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
           <a href="items_detail.jsp?id=19" class="font-weight-bold text-center ">
             <img src="image\19.jpg" class="rounded" width="200px" height="100px" >
    Cheesy Chicken Patties
           </a>
        </div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
           <a href="items_detail.jsp?id=20" class="font-weight-bold text-center ">
             <img src="image\20.jpg" class="rounded" width="200px" height="100px" >
    Cheesy Paneer Patties
           </a>
        </div>
        <div class="col-sm-1 "></div>
   </div>
</div>


<!--  COOKIES Section -->

<div id="cook" class=" cook  container-fluid bg-light text-dark font-weight-bold" style="display: none;">
    <h3 style="font-family: Comic Sans MS;">
         <strong> <a id="cook"> COOKIES SECTION... </a></strong>
    </h3>
    <div class="row">
         <div class="col-sm-1 "></div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
            <a href="items_detail.jsp?id=21" class="font-weight-bold text-center ">
               <img src="image\21.jpg" class="rounded" width="200px" height="100px" >  
    Cut out sugar Cookies
            </a>
        </div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
           <a href="items_detail.jsp?id=22" class="font-weight-bold text-center ">
             <img src="image\22.jpg" class="rounded" width="200px" height="100px">
    Easy Sugar Cookies
           </a>
        </div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
            <a href="items_detail.jsp?id=23" class="font-weight-bold text-center ">
             <img src="image\23.jpg" class="rounded" width="200px" height="100px" >
    Soft Cut sugar Cookies
           </a>
        </div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
           <a href="items_detail.jsp?id=24" class="font-weight-bold text-center ">
             <img src="image\24.jpg" class="rounded" width="200px" height="100px">
    Brownie Cookies
           </a>
        </div>
        <div class="col-sm-2 d-flex justify-content-center text-center">
           <a href="items_detail.jsp?id=25" class="font-weight-bold text-center ">
             <img src="image\25.jpg" class="rounded" width="200px" height="100px" >
    Soft and Chewy Cookies
           </a>
        </div>
        <div class="col-sm-1 "></div>
   </div>
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