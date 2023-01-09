<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Welcome Page</title>
</head>
<body>

	<%@include file="navbar.jsp"%>


	<div class="container mt-2" style="background-color: transparent;">

		
		<div>
		<img src="img/new.png" alt="Snow" class="rounded float-start">
			<h3 class="text-center font-monospace">
				<u>VISITOR ENTRY MANAGEMENT</u>
			</h3>

			<div >
			    Welcome to Visitor Entry Management Portal. This website is
				designed so that visitor details can easily be managed and accessed.
				It also helps to track the host's details to instantiate a meeting
				with the visitor. Following are the functionalities that this
	            the website provides to the user.
				<ol class="list-group list-group-flush list-group-numbered">
				<li class="list-group-item"><a href="newVisitor.jsp" class="link-success lead" style="text-decoration: none;">Entry of new visitor</a></li>
                <li class="list-group-item"><a href="viewVisitors.jsp" class="link-success lead" style="text-decoration: none;">View Visitors & Generate E-Card</a></li>
                <li class="list-group-item"><a href="addEmployee.jsp" class="link-success lead" style="text-decoration: none;">Entry of new employee</a></li>
                <li class="list-group-item"><a href="viewEmployees.jsp" class="link-success lead" style="text-decoration: none;">View Employees & send details</a></li>
                <li class="list-group-item"><a class="link-success lead" style="text-decoration: none;">Various Admin functionalities</a></li>
                </ol>
		     </div>
			
		<%
			admin a1 = (admin) session.getAttribute("currentUser");
			if (a1 == null) {
		%>
			<div class="text-center mt-5 lead">
				Admin needs to be logged in.
				<a class="btn btn-primary" href="login.jsp">Login</a> 
			</div>
			<%
			}
			%>
			<hr>
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