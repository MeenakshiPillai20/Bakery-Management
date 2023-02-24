<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.configure.*,com.storage.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="Bootstrap4CDN.jsp" %>
<link rel="stylesheet" href="./css/carts.css">
<title>My Cart</title>
<style type="text/css">


.quantity {
    float: left;
    margin-right: 15px;
    background-color: #eee;
    position: relative;
    width: 80px;
    overflow: hidden
}

.quantity input {
    margin: 0;
    text-align: center;
    width: 15px;
    height: 15px;
    padding: 0;
    float: right;
    color: #000;
    font-size: 20px;
    border: 0;
    outline: 0;
    background-color: #F6F6F6
}

.quantity input.qty {
    position: relative;
    border: 0;
    width: 100%;
    height: 40px;
    padding: 10px 25px 10px 10px;
    text-align: center;
    font-weight: 400;
    font-size: 15px;
    border-radius: 0;
    background-clip: padding-box
}

.quantity .minus, .quantity .plus {
    line-height: 0;
    background-clip: padding-box;
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    border-radius: 0;
    -webkit-background-size: 6px 30px;
    -moz-background-size: 6px 30px;
    color: #bbb;
    font-size: 20px;
    position: absolute;
    height: 50%;
    border: 0;
    right: 0;
    padding: 0;
    width: 25px;
    z-index: 3
}

.quantity .minus:hover, .quantity .plus:hover {
    background-color: #dad8da
}

.quantity .minus {
    bottom: 0
}
.shopping-cart {
    margin-top: 10px;
}
.shopping-cart{
height:600px;

}
.card-body
{

overflow-y: scroll;
}

</style>
</head>
<body>

<div class="container-fluid">
       <div class="card shopping-cart">
                <div class="card-header bg-dark text-light">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                    Shopping Cart
                    <a href="Home.jsp" class="btn btn-outline-info btn-sm pull-right">Continue shopping</a>
                    <div class="clearfix"></div>
                </div>
                <div class="card-body">
                
<%
    String username= (String)session.getAttribute("username");
     if(username != null)
     {
    	 int id = DBData.getUserId(username);
    	 String name = DBData.getUserName(username);
    	 
    	 try 
    		{
    		     Connection con = DBConnect.takeConnection();
    			 String query = "select * from my_cart where user_id="+id;            //id
    			 PreparedStatement ps = con.prepareStatement(query);
    			 ResultSet rs = ps.executeQuery();
                 int amt = 0;  
    			 
    			 while (rs.next()) 
    			 {
    				  
    				    int o_id = rs.getInt(1);
    					String sname = rs.getString(3);
    					String stype = rs.getString(4);
    					int price = rs.getInt(5);
    					int st_id = rs.getInt(8);
    	                amt = amt + price ;
     
%>
                        <!-- PRODUCT -->
                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-2 text-center">
                                    <img class="img-responsive" src="image\<%=st_id %>.jpg" alt="prewiew" width="120" height="80">
                            </div>
                            <div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
                                <h4 class="product-name"><strong><%=stype+"  "+sname %></strong></h4>
                               
                            </div>
                            <div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
                                <div class="col-3 col-sm-3 col-md-6 text-md-right" style="padding-top: 5px">
                                    <h6><strong><%=price %> <span class="text-muted">₹</span></strong></h6>
                                </div>
                                <div class="col-4 col-sm-4 col-md-4">
                                    <div class="quantity">
                                    
                                        <input type="button" value="+" class="plus">
                                        <input type="number" step="1" max="99" min="1" value="1" title="Qty" class="qty" size="4" name="count">
                                        <input type="button" value="-" class="minus">
                                 
                                    </div>
                                </div>
                                <div class="col-2 col-sm-2 col-md-2 text-right">
                                  <a href="delete_cart.jsp?s_id=<%=o_id%>"> 
                                    <button type="button" class="btn btn-outline-danger btn-xs">
                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                    </button>
                                  </a> 
                                </div>
                            </div>
                        </div>
                        <hr>
                        <!-- END PRODUCT -->
<%

	     }
%>

                </div>
               

               <div class="card-footer">
              
                    <div class="pull-right" style="margin: 10px">
                        <a href="bill.jsp" class="btn btn-success pull-right">Checkout</a>
                        <div class="pull-right" style="margin: 5px">
                            Total price: <b><%=amt %>₹</b>
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
     else
     {
    	 %>
    	     <center> <h1><b> Your cart is Empty</b></h1></center>
    	 <% 
     }
%>
                
            </div>
    </div>

</body>
</html>