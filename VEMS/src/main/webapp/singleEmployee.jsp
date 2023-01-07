<%@page import="com.entities.employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Employee</title>
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

	<%
	employee e5 = (employee) session.getAttribute("currentEmp");
	if (e5 != null) {
	%>

	<div class="container mt-5">
		<div class="row">
			<div class="col-md-5 offset-3">
				<div class="card">

					<div class="card-header text-white text-center"
						style="background-color: #212529;">
						<h2 id="vheading">
							<i class="fa-solid fa-users-viewfinder"></i> Employee's Detail
						</h2>
					</div>

					<div class="card-body">

						<div class="container" id="visitorDetails">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">Employee ID</th>
										<td><%=e5.getEid()%></td>
									</tr>
									<tr>
										<th scope="row">Name</th>
										<td><%=e5.getEname()%></td>
									</tr>

									<tr>
										<th scope="row">Email</th>
										<td><%=e5.getEemail()%></td>
									</tr>

									<tr>
										<th scope="row">Department</th>
										<td><%=e5.getEdept()%></td>
									</tr>

									<tr>
										<th scope="row">Desk</th>
										<td><%=e5.getEdesk()%></td>
									</tr>

									<tr>
										<th scope="row">Attendance</th>
										<td><%=e5.getEatt()%></td>
									</tr>
								</tbody>
							</table>
						</div>

						<div style="display: none;" id="visitorEdit">

							<form action="updateEServ" id="updateForm" method="post">
								<table class="table">

									<tbody>
										<tr>
											<th scope="row">Name</th>
											<td><input name="n" type="text"
												value="<%=e5.getEname()%>"></td>
										</tr>

										<tr>
											<th scope="row">Email</th>
											<td><input name="e" type="email"
												value="<%=e5.getEemail()%>"></td>
										</tr>

										<tr>

											<th scope="row">Department</th>
											<td><select required name="dep" class="form-select"
												id="hostOccupation">
													<option selected="selected" value="<%=e5.getEdept() %>" style="display: none;"><%= e5.getEdept() %></option>
													<option value="Accounts">Accounts</option>
													<option value="Management">Management</option>
													<option value="Research & Development">Research &
														Development</option>
													<option value="Sales">Sales</option>
											</select></td>

										</tr>



										<tr>
											<th scope="row">Desk</th>
											<td><input name="des" value="<%=e5.getEdesk()%>"></td>
										</tr>

										<tr>
											<th scope="row">Attendance</th>
											<td><select name="att" class="form-select">
													<option selected="selected" style="display: none" value="<%=e5.getEatt()%>"><%=e5.getEatt() %></option>
													<option value="Present">Present</option>
													<option value="Absent">Absent</option>
											</select></td>
										</tr>

									</tbody>
								</table>
								<input type="number" style="display: none;" name="id" value="<%= e5.getEid() %>">
								<div class="text-center">
									<button class="btn btn-primary">Save</button>
								</div>
							</form>

						</div>
					</div>

					<div class="card-footer" style="background-color: #63e6be">
						<div class="text-center">
							<a class="btn btn-primary" id="backToView" href="backEServ">Back</a>
							<button class="btn btn-secondary" type="submit" id="editBtn">Edit</button>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>

	<%
	} else {
	%>
	<div class="container">
	  <h1>Something went wrong !!!</h1>
	  <h4>Kindly Relogin again!!</h4>
	  <a class="btn btn-primary" href="login.jsp">LOGIN</a>
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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>




<script>
	$(document).ready(function() {
		let stat = false;
		$('#editBtn').click(function() {
			
			if (stat == false) {
				$('#visitorDetails').hide();

				$('#visitorEdit').show();

				$('#backToView').hide();
				
				$('#vheading').text("Visitor's Profile Edit");

				stat = true;

				$(this).text("Back");
			} else {
				$('#visitorDetails').show();

				$('#visitorEdit').hide();
				
				$('#backToView').show();

				$('#vheading').text("Visitor's Detail");

				stat = false;

				$(this).text("Edit");
			}
		});

		$('#updateForm').on('submit', function(event) {

			event.preventDefault();

			let form = new FormData(this);
			$.ajax({
				url : "updateEServ",
				type : 'post',
				data : form,
				success : function(data, textStatus, jqXHR) {
					console.log(data);
					
					 if(data.trim()==='Done!'){
						 swal("Updated successfully !!")
						 .then((value) => {
							 swal("Reloading...!!!")
						   window.location = "singleEmployee.jsp"
						 });
					   }
					 if(data.trim()==='Error'){
						 swal("Check if new data and old data are not same !!")
						 .then((value) => {
							 swal("Redirecting to previous page....!!!")
						   window.location = "singleEmployee.jsp"
						 });
					   }
						 else swal(data);
				

				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(jqXHR)
					 
					 swal(jqXHR);
				},
				processData : false,
				contentType : false
			});
		});
	});
</script>
	
</body>

</html>