<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="Bootstrap3CDN.jsp" %>
<link rel="stylesheet" href="./css/signup_style.css">
<script type="text/javascript" src="./js/CheckPassword.js"></script>
<title>Registration Form</title>
</head>
<body>
<div class="container">
    <h3 class="well"><strong>Registration Form</strong></h3>
	<div class="col-lg-12 well">
	<div class="row">
	      <form action="SignupHandler.jsp" method="post" name="signupform">
				<div class="form-group">
                                  <div class="row">
                                     <label  class="col-md-2 " style="padding-left:40px;">Name</label>
                                     <div class="col-md-4 ">
                                         <input type="text" class="form-control" name="name" required>
                                     </div>
                                     <label  class="col-md-2" >Mobile</label>
                                     <div class="col-md-3">
                                         <input type="text" class="form-control" name="mobile" required>
                                     </div>
                                  </div>
                             </div>
                               <div class="form-group">
                                  <div class="row">
                                     <label  class="col-md-2 control-label" style="padding-left:40px;">Email</label>
                                     <div class="col-md-9">
                                         <input type="email" class="form-control" name="email" required>
                                     </div>
                                  </div>
                             </div>
                             <div class="form-group">
                                  <div class="row">
                                     <label  class="col-md-2 control-label" style="padding-left:40px;">Address</label>
                                     <div class="col-md-9">
                                         <textarea class="form-control" rows="2" id="address" name="address" required></textarea>
                                     </div>
                                  </div>
                             </div>
                             
                              <div class="form-group">
                                  <div class="row">
                                     <label  class="col-md-2 control-label" style="padding-left:40px">City</label>
                                     <div class="col-md-4">
                                         <input type="text" class="form-control" name="city" required>
                                     </div>
                                     <label  class="col-md-2 control-label">Pincode</label>
                                     <div class="col-md-3">
                                         <input type="text" class="form-control" name="pincode" required>
                                     </div>
                                  </div>
                             </div>
                             
                              <div class="form-group">
                                  <div class="row">
                                     <label  class="col-md-2 control-label" style="padding-left:40px;">State</label>
                                     <div class="col-md-4">
                                         <input type="text" class="form-control" name="state" required>
                                     </div>
                                     <label  class="col-md-2 control-label">Country</label>
                                     <div class="col-md-3">
                                         <input type="text" class="form-control" name="country" required>
                                     </div>
                                  </div>
                             </div>
                             
                         <div class="box">
                              <div class="form-group">
                                  <div class="row ">
                                     <label  class="col-md-4  control-label">UserName</label>
                                     <div class="col-md-5">
                                         <input type="text" class="form-control" name="username" required>
                                     </div>
                                  </div>
                             </div>
                                    
                             <div class="form-group">
                                  <div class="row">
                                     <label  class="col-md-4 control-label">Password</label>
                                     <div class="col-md-5">
                                         <input type="text" class="form-control" name="password" required>
                                     </div>
                                  </div>
                             </div>
                             
                              <div class="form-group">
                                  <div class="row">
                                     <label  class="col-md-4 control-label">Confirm Password</label>
                                     <div class="col-md-5">
                                         <input type="text" onkeyup="checkPassword()" class="form-control" name="cpass" required>
                                         <span id="msg"></span>
                                     </div>
                                  </div>
                             </div>
                       </div>
                          
                             <div class="form-group">
                                 <!-- Button -->                                        
                                 <div class="col-md-4 text-center" >
                                       <input type="submit" class="btn btn-success btn-block" value="Sign Up">
                           
                                 </div>
                             </div>
					
				</form> 
				</div>
	</div>
</div>
</body>
</html>