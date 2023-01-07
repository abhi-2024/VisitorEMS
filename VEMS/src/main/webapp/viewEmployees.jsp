<%@page import="com.helper.connectionProvider"%>
<%@page import="com.dao.employeeDao"%>
<%@page import="com.entities.employee"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employees</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
</head>
<body>
	<%@include file="navbar.jsp"%>
	<h1 class="text-center mt-3">
		<u>Employees Details</u>
	</h1>
	<%
	admin ad = (admin) session.getAttribute("currentUser");
	if (ad != null) {
	%>
	<div class="d-flex align-items-center" style="height: 40vh;">
		<div class="container">

			<div class="row">
				<div>

					<table class="table table-sm">
						<%
						int count = 1;
						%>
						<thead style="background-color: #63e6be;">
							<tr>
								<th scope="col">SNo</th>
								<th scope="col">ID</th>
								<th scope="col">Name</th>
								<th scope="col">Email</th>
								<th scope="col">Department</th>
								<th scope="col">Desk Number</th>
								<th scope="col">Attendance</th>
								<th scope="col"></th>
								<th scope="col"></th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<%
								employeeDao dao = new employeeDao(connectionProvider.getConnection());
								ArrayList<employee> lst = dao.fetchAllEmp();
								for (employee ee : lst) {
								%>
								<th scope="row"><%=count++%></th>
								<td><%=ee.getEid()%></td>
								<td><%=ee.getEname()%></td>
								<td><%=ee.getEemail()%></td>
								<td><%=ee.getEdept()%></td>
								<td><%=ee.getEdesk()%></td>
								<td><%=ee.getEatt()%></td>

								<td>

									<form method="post" action="viewEmpServ">

										<input style="display: none;" name="ema" type="text"
											value="<%=ee.getEemail()%>">

										<button type="submit" class="btn btn-secondary"
											style="background-color: white;">
											<i style="color: blue;" class="fa-solid fa-info"></i>
										</button>

									</form>



								</td>

								<td>
									<form action="delEmpServ" method="post">
										<input style="display: none;" name="em" type="text"
											value="<%=ee.getEemail()%>">
										<button type="submit" style="background-color: white;"
											class="btn btn-secondary">
											<i style="color: red;" class="fa-sharp fa-solid fa-trash"></i>
										</button>
									</form>
								</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<%
	} else {
	%>
	<h3 class="text-center">Kindly login to view all of the Employees</h3>
	<div class="text-center">
		<a href="login.jsp" style="background-color: #4F29C8;"
			class="btn text-white">LOGIN</a>
	</div>

	<%
	}
	%>
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