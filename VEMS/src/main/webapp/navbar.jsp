<%@page import="com.entities.msg"%>
<%@page import="com.entities.admin"%>

<%
admin a = (admin) session.getAttribute("currentUser");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand font-monospace" href="index.jsp"> <i
			class="fa-solid fa-users"></i> Visitor Entry
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				
				<%
				if (a != null) {
				%>
				<li class="nav-item dropdown"><a
					class="nav-link active dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"><i class="fa fa-person-walking-luggage"></i> Visitors </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="newVisitor.jsp">New Visitor <i class="fa-solid fa-person-circle-exclamation"></i></a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="viewVisitors.jsp">View Visitors <i class="fa-solid fa-person-circle-check"></i></a></li>
					</ul></li>
                <li class="nav-item dropdown"><a
					class="nav-link active dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-sharp fa-solid fa-briefcase"></i> Employees </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="addEmployee.jsp">New Employee <i class="fa-solid fa-champagne-glasses"></i></a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="viewEmployees.jsp">View Employees <i class="fa-sharp fa-solid fa-circle-info"></i></a></li>
					</ul></li>
					
				<li class="nav-item"><a data-bs-toggle="modal" href="#"
					data-bs-target="#profileModal" class="nav-link active"
					aria-current="page"><i class="fa-solid fa-circle-user"></i> <%=a.getName()%>
				</a> 
				
				
				<!-- Modal Start --> 
				
				
				<!-- Modal -->
					<div class="modal fade" id="profileModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content" style="background-color: #212529; color: white;">
								<div class="modal-header container text-center bg-dark text-white">
									<h1 class="modal-title fs-4" id="exampleModalLabel">
										Profile View</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="container text-center">
										<h5><%=a.getName()%>
											(Admin)
										</h5>
										<br>

										<div id="profileDetails">
											<table class="table table-hover table-dark">

												<tbody>
													<tr>
														<th scope="row">ID</th>
														<td><%=a.getId()%></td>


													</tr>
													<tr>
														<th scope="row">Email</th>
														<td><%=a.getEmail()%></td>


													</tr>
													<tr>
														<th scope="row">Registered On</th>
														<td><%=a.getrDate()%></td>

													</tr>
													<tr>


													</tr>
												</tbody>
											</table>

										</div>

										<div style="display: none;" id="profileEdit">

											<form action="updateServlet" id="updateForm" method="post">
											 <div>
												<table class="table">

													<tbody>
														<tr>
															<th scope="row" style="color: white;">Name</th>
															<td><input name="newName" type="text"
																class="form-control" value="<%=a.getName()%>"></td>
														</tr>

														<tr>
															<th scope="row" style="color: white;">Email</th>
															<td><input name="newEmail" type="email"
																class="form-control" value="<%=a.getEmail()%>"></td>
														</tr>
														<tr>
															<th scope="row" style="color: white;">Password</th>
															<td><input name="newPassword" type="text"
																class="form-control" value="<%=a.getPassword()%>"></td>
														</tr>
													</tbody>
												</table>
												<div class="container text-center">
													<button type="submit" class="btn btn-primary">Save</button>
												</div>
											  </div>
											</form>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>
									<button type="button" id="edit" class="btn btn-secondary"><i class="fa-solid fa-user-pen"></i> Edit</button>
									
											<div class="text-center">
												<a class="btn btn-primary" id="signOut" aria-current="page"
													href="signoutServ"><i class="fa fa-door-open"></i> Sign
													Out </a>
											</div>
								</div>
							</div>
						</div>
					</div> <!-- Modal end --></li>


				<%
				}

				else {
				%>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="login.jsp"><i
						class="fa-solid fa-shield"></i> Login </a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="signup.jsp"><i
						class="fa fa-user-plus"></i> Sign Up </a></li>
				<%
				}
				%>
			</ul>
		</div>
	</div>
</nav>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script>
	$(document).ready(function() {
		let stat = false;
		$('#edit').click(function() {
			if (stat == false) {
				$('#profileDetails').hide();

				$('#profileEdit').show();

				$('#signOut').hide();
				
				$('#exampleModalLabel').text("Profile Edit");

				stat = true;

				$(this).text("Back");
			} else {
				$('#profileDetails').show();

				$('#profileEdit').hide();
				
				$('#signOut').show();

				$('#exampleModalLabel').text("Profile View");

				stat = false;

				$(this).text("Edit");
			}
		});

		$('#updateForm').on('submit', function(event) {

			event.preventDefault();

			let form = new FormData(this);
			$.ajax({
				url : "updateServlet",
				type : 'post',
				data : form,
				success : function(data, textStatus, jqXHR) {
					console.log(data);
					
					 if(data.trim()==='Done!'){
						 swal("Updated successfully !! Kindly Relogin")
						 .then((value) => {
						   swal("Loging out.....!!")
						   window.location = "signoutServ"
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
