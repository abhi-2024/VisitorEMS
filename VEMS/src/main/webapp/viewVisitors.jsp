<%@page import="com.entities.visitors"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.connectionProvider"%>
<%@page import="com.dao.visitorDao"%>
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
<title>Visitors</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
	admin ami = (admin) session.getAttribute("currentUser");
	if (ami != null) {
	%>
 <div class="d-flex align-items-center mt-5" style="height: 80vh;">
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">S.No</th>
					<th scope="col">Visitor's Name</th>
					<th scope="col">Visitor's Email</th>
					<th scope="col">Host</th>
					<th scope="col">Entry Date & Time</th>
					<th scope="col"></th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<%
				int count = 1;

				visitorDao d = new visitorDao(connectionProvider.getConnection());
				ArrayList<visitors> list1 = d.fetchAllVisitors();
				for (visitors vv : list1) {
				%>
				<tr>
					<td><%=count++%></td>
					<td><%=vv.getVname()%></td>
					<td><%=vv.getVemail()%></td>
					<td><%=vv.getHname()%></td>
					<td><%=vv.geteDate()%></td>
					<td>
						<form action="visitorDetailServ" method="post">
							<input type="text" style="display: none;" name="did"
								value="<%=vv.getVid()%>">
							<button title="view details"
								style="background-color: white; color: grey;"
								class="btn btn-secondary">
								<i class="fa-solid fa-eye"></i>
							</button>
						</form>
					</td>
					<td>
						<form method="post" action="delVisServ">
							<input style="display: none;" type="text" name="id"
								value="<%=vv.getVid()%>">
							<button title="delete the entity"
								style="background-color: white; color: red;" type="submit"
								class="btn btn-secondary">
								<i class="fa-solid fa-trash"></i>
							</button>
						</form>

					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<%
		} else {
		%>
		<h1 class="text-center">Kindly login to view all of the visitors</h1>
		<div class="text-center">
			<a href="login.jsp" style="background-color: #4F29C8;"
				class="btn text-white">LOGIN</a>
		</div>

	</div>
 </div>	
	<%
	}
	%>



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
</body>
</html>