<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.configure.*,com.storage.*"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="Bootstrap4CDN.jsp" %>
<link rel="stylesheet" href="./css/bill_style.css">
<title>Bill Page</title>
<style type="text/css">

.box-mid{
height:230px;
width:935px;
overflow-y: scroll;
}
</style>
</head>
<body>
<%
    String username= (String)session.getAttribute("username");
     if(username != null)
     {
    	 int id = DBData.getUserId(username);
    	 String name = DBData.getUserName(username);
    	  Date d = new Date();
    	  SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd");
    	  String new_date = sdate.format(d);
    	 try 
    		{
    		     Connection con = DBConnect.takeConnection();
    		     
    		        String query = "select mobile,address,city,state,country from user where user_id="+id; //id
    	 			PreparedStatement ps = con.prepareStatement(query);
    	 			ResultSet rs = ps.executeQuery();

    	 			if (rs.next())
    	 			{
    	 				 int mobile = rs.getInt(1);
    	 		         String add = rs.getString(2);
    	 		         String city = rs.getString(3);
    	 		         String state = rs.getString(4);
    			         String country = rs.getString(5);
    	 

%>
<div class="page-content container">
    <div class="page-header text-blue-d2">
            <img src="img\logo.jpg" alt="Logo" style="width:80px; height:40px;"> 
        <div class="page-tools">
            <div class="text-center text-150">                   
                <h1 class="page-title text-secondary-d1">
                    Invoice
                   <small class="page-info">
                         <i class="fa fa-angle-double-right text-80"></i>
                         ID : <%= id %> 
                   </small>
                </h1>     
             </div>
       </div>
    </div>

    <div class="container px-0">
        <div class="row mt-4">
            <div class="col-12 col-lg-10 offset-lg-1">
                <!-- .row -->

                <div class="row">
                    <div class="col-sm-6">
                        <div>
                            <span class="text-sm text-grey-m2 align-middle">To:</span>
                           <span class="text-600 text-110 text-blue align-middle"><%=name %></span>
                        </div>
                        <div class="text-grey-m2">
                             <div class="my-1">
                                <i class="fa fa-map-marker" ></i>&nbsp;&nbsp;<%=add+" "+city %>
                             </div>
                             <div class="my-1">
                                <%=state+", "+country %>  
                             </div>
                             <div class="my-1"><i class="fa fa-phone fa-flip-horizontal text-secondary"></i> <b class="text-600"><%=mobile %></b></div>
                        </div>
                    </div>
                    <!-- /.col -->

                    <div class="text-95 col-sm-6 align-self-start d-sm-flex justify-content-end">
                        <hr class="d-sm-none" />
                        <div class="text-grey-m2">
                            <div class="mt-1 mb-2 text-secondary-m1 text-600 text-125">
                                Invoice
                            </div>

                            <div class="my-2"><i class="fa fa-circle text-blue-m2 text-xs mr-1"></i> <span class="text-600 text-90">ID :</span> <%=id %></div>

                            <div class="my-2"><i class="fa fa-circle text-blue-m2 text-xs mr-1"></i> <span class="text-600 text-90">Issue Date :</span><%="   "+new_date %></div>
                            
                            <div class="my-2"><i class="fa fa-circle text-blue-m2 text-xs mr-1"></i> <span class="text-600 text-90">Pay Mode :</span> Cash on Delivery</div>
 
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <div class="box1">
                <div class="mt-2 box ">
                    <div class="row text-200 text-white bgc-default-tp1 py-25 border">
                        <div class="d-none d-sm-block col-1">S.no</div>
                        <div class="col-sm-3">Item Name</div>
                        <div class="col-sm-4">Item Type</div>
                        <div class="d-none d-sm-block col-sm-2">Qty</div>
                        <div class="col-2">Amount</div>
                    </div>
                    <div class="text-95 text-secondary-d3 box-mid">
<%
    	 			}
                String query1 = "select o_id,o_name,o_type,price,s_id from my_cart where user_id="+id;            //id
                PreparedStatement ps1 = con.prepareStatement(query1);
                ResultSet rs1 = ps1.executeQuery();
                int amt = 0;  
                int i=1;
                
                String s__type="";
                while (rs1.next()) 
                {
	                  int o_id = rs1.getInt(1);
		              String sname = rs1.getString(2);
		              String stype = rs1.getString(3);
		              int price = rs1.getInt(4);
		              int st_id = rs1.getInt(5);
                      amt = amt + price ;
                     
                      s__type = s__type+ " " + stype + " " + sname + "    " ;
                      
                    
%>
                
                    
                        <div class="row mb-2 mb-sm-0 py-25">
                            <div class="d-none d-sm-block col-1"><%=i++ %></div>
                            <div class="col-sm-3"><%=sname %></div>
                             <div class="col-sm-4"><%=stype%></div>
                            <div class="d-none d-sm-block col-2">1</div>    
                            <div class="col-2 text-secondary-d2">₹<%=price %></div>
                        </div>
                    
<%
                }
                String query2="insert into order_detail(u_name,item,price,count,date,user_id) values('"+name+"','"+s__type+"',"+amt+","+1+",'"+new_date+"',"+id+")";
      			PreparedStatement ps2 = con.prepareStatement(query2);
      			ps2.execute();
%>
                    </div>
                    <div class="row border-b-2 brc-default-l2 box-b"></div>
                    <hr />
                    <div>
                        <span class="text-secondary-d1 text-105">Total Amount</span>
                        <span class="text-150 text-success-d3 opacity-2"><%="  ₹ "+amt %></span>
                        <a href="thank.jsp" class="btn btn-info btn-bold px-4 float-right mt-3 mt-lg-0">Confirm</a>
                    </div>
                </div>
                </div>
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