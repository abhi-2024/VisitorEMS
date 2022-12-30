<%@page import="com.entities.msg"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% 
 msg m = (msg)session.getAttribute("MSG");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<div class="d-flex align-items-center" style="height: 80vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-4">
					<div class="card">

						<div class="card-header text-white text-center"
							style="background-color: #4F29C8;">
							<span class="fa fa-sign-in fa-2x"></span>
							<h2>LOGIN</h2>
						</div>
						<%						 
						 if(m!=null){
						%>
						
						<div class="alert <%=m.getCssClass() %>" role="alert">
						 <%= m.getContent() %>
						</div>
						
						<%
						 session.removeAttribute("MSG");
						 } %>
						<div class="card-body">


							<form action="loginServ" method="post">

								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> <input type="email" name="loginEmail"
										class="form-control" id="exampleInputEmail1">
								</div>

								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input name="loginPassword" type="password"
										class="form-control" id="exampleInputPassword1">
								</div>
								<div class="text-center">
									<button type="submit" class="btn btn-primary">Login</button>
								</div>
							</form>

							<div class="text-center">
								<a href="signup.jsp" class="link-primary">Create an account</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
























<!-- scripts -->
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>
</html>