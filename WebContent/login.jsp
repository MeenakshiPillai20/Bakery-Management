<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="Bootstrap4CDN.jsp" %>
<link rel="stylesheet" href="./css/login_style.css">

<title>Login Page</title>
<script type="text/javascript" src="./js/CheckPassword.js"></script>
<%
//session check
   String username = (String)session.getAttribute("username");
   if (username != null)
   {
	   response.sendRedirect("Home.jsp");  
   }
 
%>
</head>
<body>

<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>&nbsp;&nbsp;Sign In</h3>
				
			</div>
			<div class="card-body">
				<form action="LoginHandler.jsp" method="post">
				 
				 
			     <div class="form-check">
			     &nbsp;&nbsp;
                     <label class="form-check-label">
                           <input type="radio" class="form-check-input" name="optradio" value="user" required>Customer
                     </label>
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  
                      <label class="form-check-label">
                           <input type="radio" class="form-check-input" name="optradio" value="admin" required>Admin
                       </label>
                   </div><br>
				
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" name="username" class="form-control" placeholder="Enter Username" required>
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" name="password" class="form-control" placeholder="Enter Password" required>
					</div>
					<div class="row align-items-center remember pl-4">
						<input type="checkbox" >&nbsp; Remember Me
					</div><br>
					<div class="form-group">
						<input type="submit" value="Login" class="btn float-right login_btn btn-info btn-block"><br>
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					Don't have an account?<a href="signup.jsp" >Sign Up</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="#">Forgot your password?</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>