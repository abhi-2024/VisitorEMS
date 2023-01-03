<%@page import="com.entities.visitors"%>
<% 
  admin ad = (admin)session.getAttribute("currentUser");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Visitor Detail</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
</head>
<body>
	<%@include file="navbar.jsp"%>

	<%
	    visitors v1 = (visitors) session.getAttribute("currentVisitor");
	    if (v1 != null) {
	    	
	%>

	<div class="container mt-3">
		<div class="row">
			<div class="col-md-5 offset-3">
				<div class="card">

					<div class="card-header text-white text-center"
						style="background-color: #212529;">
						<h2 id="vheading">
							<i class="fa-solid fa-users-viewfinder"></i> Visitor's Detail
						</h2>
					</div>

					<div class="card-body">

						<div class="container" id="visitorDetails">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">Name</th>
										<td><%=v1.getVname()%></td>
									</tr>

									<tr>
										<th scope="row">Email</th>
										<td><%=v1.getVemail()%></td>
									</tr>

									<tr>
										<th scope="row">Gender</th>
										<td><%=v1.getGender()%></td>
									</tr>

									<tr>
										<th scope="row">Address</th>
										<td><%=v1.getAddress()%></td>
									</tr>

									<tr>
										<th scope="row">Occupation</th>
										<td><%=v1.getVocc()%></td>
									</tr>

									<tr>
										<th scope="row">Host Name</th>
										<td><%=v1.getHname()%></td>
									</tr>

									<tr>
										<th scope="row">Department</th>
										<td><%=v1.getHocc()%></td>
									</tr>

									<tr>
										<th scope="row">Reason to meet</th>
										<td><%=v1.getVreason()%></td>
									</tr>

									<tr>
										<th scope="row">Visit No</th>
										<td><%=v1.getVno()%></td>
									</tr>

									<tr>
										<th scope="row">Visitor Id</th>
										<td><%=v1.getVid()%></td>
									</tr>

									<tr>
										<th scope="row">Entry Time</th>
										<td><%=v1.geteDate()%></td>
									</tr>

									<tr>
										<th scope="row">Exit Time</th>
										<td><%=v1.getExDate()%></td>
									</tr>									
								</tbody>
							</table>
						</div>

						<div style="display: none;" id="visitorEdit">

							<form action="updateVServ" id="updateForm" method="post">
								<table class="table">

									<tbody>
										<tr>
											<th scope="row">Name</th>
											<td><input name="n" type="text" value="<%=v1.getVname()%>"></td>
										</tr>
										<tr>
											<th scope="row">Gender</th>
											<td>
											  <select name="g">
											    <option selected="selected" value="<%=v1.getGender()%>"></option>
											    <option value="Male">Male</option>
											    <option value="Female">Female</option>
											    <option value="Others">Others</option>
											  </select>
											</td>
										</tr>
										<tr>
											<th scope="row">Email</th>
											<td><input name="e" type="email" value="<%=v1.getVemail()%>"></td>
										</tr>


										<tr>
											<th scope="row">Address</th>
											<td><textarea name="a" rows="3"><%=v1.getAddress()%></textarea></td>
										</tr>

										<tr>
											<th scope="row">Occupation</th>
											<td><input name="o" type="text" value="<%=v1.getVocc()%>"></td>
										</tr>

										<tr>
											<th scope="row">Host Name</th>
											<td><input name="HN" type="text" value="<%=v1.getHname()%>"></td>
										</tr>

										<tr>
											<th scope="row">Department</th>
											<td><input name="d" value="<%=v1.getHocc()%>" type="text"></td>
										</tr>

										<tr>
											<th scope="row">Reason to meet</th>
											<td><input name="r" value="<%=v1.getVreason()%>" type="text"></td>
										</tr>
										
										<tr>
										  <th scope="row">Exit Time</th>
										  <td> <input name="ex" value="<%=v1.getExDate()%>" type="time"> </td>
										</tr>

										<tr>
											<th scope="row">Visit No</th>
											<td><input name="vn" value="<%=v1.getVno()%>" type="number">
											<input name="vid" style="display: none;" value="<%= v1.getVid()%>" type="number">
											<input name="vdate" style="display: none;" value="<%=v1.geteDate()%>" type="text">
											</td>
										</tr>
									</tbody>
								</table>
								<div class="text-center">
								  <button class="btn btn-primary">Save</button>
								</div>
							</form>

						</div>
					</div>

					<div class="card-footer">
						<div class="text-center">
							<a class="btn btn-primary" id="backToView" href="backServ">Back</a>
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
         <%@include file="Error_Page.jsp" %>
       </div>
	<%
	}
	/* 	session.removeAttribute("currentVisitor"); */
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
				url : "updateVServ",
				type : 'post',
				data : form,
				success : function(data, textStatus, jqXHR) {
					console.log(data);
					
					 if(data.trim()==='Done!'){
						 swal("Updated successfully !!")
						 .then((value) => {
							 swal("Reloading...!!!")
						   window.location = "singleVisitor.jsp"
						 });
					   }
					 if(data.trim()==='Error'){
						 swal("Check if new data and old data are not same !!")
						 .then((value) => {
							 swal("Redirecting to previous page....!!!")
						   window.location = "singleVisitor.jsp"
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