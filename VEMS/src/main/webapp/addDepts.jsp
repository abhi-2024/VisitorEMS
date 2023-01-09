<%@page import="com.entities.departments"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.connectionProvider"%>
<%@page import="com.dao.departmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Departments</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
</head>
<body style="background-image: url('img/bg-01.jpg'); background-repeat: no-repeat; background-size: cover;">
	<%@include file="navbar.jsp"%>

	<%
	admin am = (admin) session.getAttribute("currentUser");
	if(am != null){
	msg m2 = (msg) session.getAttribute("dMSG");
	%>
	<div class="d-flex mt-4" style="height: 80vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-4">
					<div class="card">

						<div class="card-header text-white text-center"
							style="background-color: #212529;">
							<h3>
								<i class="fa-solid fa-box-open"></i> Departments
							</h3>
						</div>
						<%
						if (m2 != null) {
						%>

						<div class="alert <%=m2.getCssClass()%>" role="alert">
							<%=m2.getContent()%>
						</div>

						<%
						session.removeAttribute("dMSG");
						}
						%>
						<div class="card-body">
							<h4 class="text-center">
								<u>List of Departments</u>
							</h4>
							<% 
							 departmentDao dao = new departmentDao(connectionProvider.getConnection());
							 ArrayList<departments> d = dao.fetchDepts();
							 for(departments dd : d){
							%>
							<ul class="list-group">
								<li class="list-group-item"><%= dd.getdName() %> | Floor: <%= dd.getdFloor() %>
								<br>
								<form method="post" action="delDeptServ">
								<input style="display: none;" name="i" value="<%= dd.getdId() %>">
								<button style="background-color: white;" class="btn btn-secondary"> <i style="color: red;" class="fa-solid fa-trash"></i> </button>
								</form>
								</li>
							</ul>
							<% } %>
							<br>
							<br>
							<h5 class="text-center">
								<u>Add New Department</u>
							</h5>
							<form action="deptServ" method="post">

								<div class="form-floating mb-3">
									<input type="text" name="dept" class="form-control" id="floatingInput"
										placeholder="Department Name"> <label
										for="floatingInput">Department</label>
								</div>

								<div class="form-floating">
									<select name="floor" class="form-select" id="floatingSelect"
										aria-label="Floating label select example">
									<option disabled="disabled" selected="selected">-: Please select an option :-</option>
									<option value="5">5</option>
									<option value="4">4</option>
									<option value="3">3</option>
									<option value="2">2</option>
									<option value="1">1</option>
									<option value="Ground">Ground</option>									
									</select> <label for="floatingSelect">Floor</label>
								</div>
								<br>
								<div class="text-center">
									<button class="btn btn-primary">Submit</button>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
 <% } else { %>
 <div class="container text-center">
   <h1>
    Kindly Login to view this page
   </h1>
   <a class="btn btn-primary" href="login.jsp">LOGIN</a>
  </div> 
 <% } %>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
</html>