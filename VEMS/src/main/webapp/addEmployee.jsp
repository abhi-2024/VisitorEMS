<%@page import="com.helper.connectionProvider"%>
<%@page import="com.dao.departmentDao"%>
<%@page import="com.entities.departments"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entities.msg"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
msg m1 = (msg) session.getAttribute("EMSG");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<title>New Employee</title>
</head>
<body style="background-image: url('img/bg-01.jpg'); background-repeat: no-repeat; background-size: cover;">

	<%@include file="navbar.jsp"%>
   <% 
    admin m = (admin) session.getAttribute("currentUser");
    if(m!=null){
   %>
	<div class="d-flex align-items-center mt-5" style="height: 80vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-4">
					<div class="card">

						<div class="card-header  text-center"
							style="background-color: #9999ff;">
							<h2>
								<i class="fa-sharp fa-solid fa-briefcase"></i> New Employee
							</h2>
						</div>
						<%
						if (m1 != null) {
						%>

						<div class="alert <%=m1.getCssClass()%>" role="alert">
							<%=m1.getContent()%>
						</div>

						<%
						session.removeAttribute("EMSG");
						}
						%>
						<div class="card-body">



							<form action="newEmpServ" id="emp-form" method="POST">
								<div class="mb-3">

									<label for="inputName" class="form-label">Name</label> <input
										type="text" name="empName" required class="form-control"
										id="inputName">
								</div>

								<div class="mb-3">
									<label for="Email" class="form-label">Email address</label> <input
										required type="email" name="empEmail" class="form-control"
										id="Email" aria-describedby="emailHelp">
									<div id="emailHelp" class="form-text">We'll never share
										your email with anyone else.</div>
								</div>

								<div class="mb-3">
									<label for="hostOccupation" class="form-label">Department</label>
									<select required name="empDept" class="form-select"
										id="hostOccupation">
										<option selected="selected" disabled>--: Please
											Select :--</option>
										<%
										departmentDao d2 = new departmentDao(connectionProvider.getConnection());
										ArrayList<departments> list1 = d2.fetchDepts();
										for(departments dd : list1){
										%>
										<option value="<%= dd.getdName() %>"><%= dd.getdName() %></option>
										<% } %>
									</select>
								</div>

								<div class="mb-3">

									<label for="inputName" class="form-label">Desk</label> <input
										type="text" name="empDesk" placeholder="D(Desk)"
										required class="form-control" id="inputName">
								</div>

								<div class="mb-3">

									<label for="inputName" class="form-label">Attendance</label> <select
										name="empAtt" class="form-select">
										<option selected="selected" disabled>--: Please
											Select :--</option>
										<option value="Present">Present</option>
										<option value="Absent">Absent</option>
									</select>
								</div>
								<br>
								<div class="container text-center" id="loader"
									style="display: none;">
									<span class="fa fa-spinner fa-spin fa-4x"></span>
									<h4>Please Wait.....</h4>
								</div>
								<div class="container text-center" id="spinner"
									style="display: none;">
									<i class="fa-solid fa-spinner fa-4x fa-spin"></i>
								</div>
								<div class="text-center">
									<button type="submit" id="submit-btn" class="btn btn-primary">Submit</button>
								</div>
							</form>



						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

   <% }else{ %>
 
   <h1 class="text-center">Kindly Login to access this feature</h1>
		<div class="text-center">
			<a href="login.jsp" style="background-color: #4F29C8;"
				class="btn text-white">LOGIN</a>
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
