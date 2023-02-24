<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.configure.*,com.storage.StockData"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="Bootstrap4CDN.jsp"%>
<link rel="stylesheet" href="./css/home_style.css">
<style type="text/css">
*
   {
        font-family: Comic Sans MS;
   }
   .navbar-nav > li
   {
        margin-right:40px;
   }
   #search
   {
        margin-right:40px;
   }
   .fakeimg {
    height: 200px;
   
    padding:20px;
    background: rgb(209, 209, 209);
  }
</style>
<title>Admin Page</title>
</head>
<body>


	<!-- NAVBARS -->


	<nav
		class="navbar navbar-expand-sm bg-dark  navbar-dark  text-white justify-content-end sticky-top">
		<!-- Brand -->
		<a class="navbar-brand mr-auto" href="#"> <img src="img\logo.jpg"
			alt="Logo" style="width: 80px; height: 40px;">
		</a>

		<!-- Links -->
		<ul class="navbar-nav">

			<li class="nav-item active"><a class="nav-link"
				href="admin_home.jsp">HOME</a></li>
			<li class="nav-item"><a class="nav-link" href=""
				data-toggle="modal" data-target="#Stock">STOCK</a></li>

			<li class="nav-item"><a class="nav-link" href=""
				data-toggle="modal" data-target="#Detail">ORDER DETAIL</a></li>
			<li class="nav-item"><a class="nav-link" href=""
				data-toggle="modal" data-target="#Add">ADD NEW ITEM</a></li>
			<li class="nav-item"><a class="nav-link"
				href="LogoutHandler.jsp">LOGOUT</a></li>
		</ul>


	</nav>



	<!-- SLIDESHOW -->


	<div id="demo" class="carousel slide" data-ride="carousel">

		<!-- Indicators -->
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
			<li data-target="#demo" data-slide-to="3"></li>
		</ul>

		<!-- The slideshow -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img\img4.png" alt="Los Angeles" height="250px"
					width="100%">
			</div>
			<div class="carousel-item">
				<img src="img\img1.jpg" alt="Chicago" height="250px" width="100%">
			</div>
			<div class="carousel-item">
				<img src="img\img2.jpg" alt="New York" height="250px" width="100%">
			</div>
			<div class="carousel-item">
				<img src="img\img3.jpg" alt="New York" height="250px" width="100%">
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
			class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>





	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-4">
				<h2>About</h2>
				<br>
				<div>An effective bakery management system tackles your
					company challenges in one integrated system, meeting your
					inventory, processing, distribution, and accounting needs. In a
					fast paced industry, solutions that improve efficiency and everyday
					operations are the gold standard for bakery success.</div>
			</div>
			<div class="col-sm-8">
				<h2>Our Mision.....</h2>

				<div class="fakeimg">“We love to bake. Through baking, we
					connect with our community by creating great cake, bread and
					pastry, feeding our family, friends and neighbors, teaching and
					sharing our craft and practicing responsibility to the environment.
					We also want to become the favourite bakery shop in every district
					in which we operates. This will be accomplished by serving a
					variety of delicious and generously portioned our product at
					moderate prices. Our customer will be served by friendly,
					knowledgeable people that are dedicated to providing excellent
					customer service.”</div>


			</div>
		</div>
	</div>




	<!-- Model1 -->

	<div class="modal fade" id="Add">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h3 class="modal-title">Add New Item</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">

					<br>
					<form action="upload.jsp" method="post">

						<div class="form-group">
							<div class="row">
								<label class="col-md-2 control-label">Name</label>
								<div class="col-md-9">
									<input type="text" class="form-control" name="s_name">
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="row">
								<label class="col-md-2 control-label">Type</label>
								<div class="col-md-9">
									<input type="text" class="form-control" name="s_type">
								</div>
							</div>
						</div>


						<div class="form-group">
							<div class="row">
								<label class="col-md-2 control-label">Price</label>
								<div class="col-md-4">
									<input type="text" class="form-control" name="price">
								</div>
								<label class="col-md-2 control-label">Quantity</label>
								<div class="col-md-4">
									<input type="text" class="form-control" name="count">
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="row">
								<label class="col-md-2 control-label">Detail</label>
								<div class="col-md-9">
									<textarea class="form-control" rows="3" id="detail"
										name="detail"></textarea>
								</div>
							</div>
						</div>
						<br>

						<div class="form-group">
							<!-- Button -->
							<div class="col-md-12 text-center">
								<input type="submit" id="btn-signup"
									class="btn btn-success btn-lg" value="Next"><br/><br/>
								


							</div>
						</div>
					</form>
				</div>
               
			</div>
		</div>
	</div>


	<!-- Model1 -->

	<div class="modal fade" id="Stock">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h3 class="modal-title">Stock Details</h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">




					<%
					try {

						Connection con = DBConnect.takeConnection();
						String query = "select s_id,s_name,s_type,price,count from stock";
						PreparedStatement ps = con.prepareStatement(query);
						ResultSet rs = ps.executeQuery();
					%>
					<table
						class="table table-striped table-bordered table-hover text-center ">
						<thead class="table-success">
							<tr>
								<th>ID</th>
								<th>Item Name</th>
								<th>Type</th>
								<th>Price/item</th>
								<th>Quantity</th>

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
					</table>
					<br>
					<br>
					<br>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<!-- Model1 -->

	<div class="modal fade w-5" id="Detail">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h3 class="modal-title">Order Details</h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">

<% 
                 String query1 = "select id,u_name,item,price,count,date from order_detail";
                 PreparedStatement ps1 = con.prepareStatement(query1);
                 ResultSet rs1 = ps1.executeQuery();
%>
					<table class="table table-striped table-bordered table-hover">
						<thead class="thead-light">
							<tr>
								<th>O_Id</th>
								<th>Cust_Name</th>
								<th>Item Name</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Date</th>

							</tr>
						</thead>
						<% 
						while (rs1.next()) {
						%>
						<tbody>
							<tr>
								<td><%=rs1.getString(1)%></td>
								<td><%=rs1.getString(2)%></td>
								<td><%=rs1.getString(3)%></td>
								<td><%=rs1.getString(4)%></td>
								<td><%=rs1.getString(5)%></td>
								<td><%=rs1.getString(6)%></td>
							</tr>
						</tbody>
						<%
						}
						
						%>
					</table>
					<br>
					<br>
					<br>
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
	%>
</body>
</html>