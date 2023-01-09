<%@page import="com.entities.reasons"%>
<%@page import="com.dao.reasonDao"%>
<%@page import="com.helper.connectionProvider"%>
<%@page import="com.dao.employeeDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entities.employee"%>
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
<title>Add visitor</title>
</head>
<body style="background-image: url('img/bg-01.jpg'); background-repeat: no-repeat; background-size: cover;">
	<%@include file="navbar.jsp"%>


	<div class="container mt-5">

		<%
		admin adm = (admin) session.getAttribute("currentUser");

		if (adm != null) {

			employeeDao dao2 = new employeeDao(connectionProvider.getConnection());
			ArrayList<employee> list2 = dao2.fetchAllEmp();
		%>

		<div class="col-md-6 offset-md-3">

			<div class="card" style="background-color: #9999ff;">

				<h1 style="background-color: transparent;"
					class="card-header  text-center">
					<i class="fa-solid fa-users"></i> New Visitor Entry
				</h1>

				<%
				msg m3 = (msg) session.getAttribute("vMsg");

				if (m3 != null) {
				%>

				<div class="alert <%=m3.getCssClass()%>" role="alert">
					<%=m3.getContent()%>
				</div>

				<%
				}
				session.removeAttribute("vMsg");
				%>
				<div class="card-body" style="background-color: white;">
					<form id="visitor-form" action="newEntryServ" method="post">



						<div class="mb-3">
							<label for="name" class="form-label">Visitor's name</label> <input
								required type="text" class="form-control" id="name" name="vName">
						</div>

						<div class="mb-3">
							<label class="form-label">Select gender</label><br> <select
								required class="form-select" name="gender">
								<option selected="selected" disabled="disabled">--:
									Please Select :--</option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
								<option value="Others">Others</option>
							</select>
						</div>

						<div class="mb-3">
							<label for="email" class="form-label">Visitor's email</label> <input
								required name="vEmail" type="email" class="form-control"
								id="email">
						</div>

						<div class="mb-3">
							<label for="address" class="form-label">Visitor's address</label>
							<textarea required name="vAddress" id="address"
								class="form-control" rows="3"></textarea>

						</div>

						<div class="mb-3">
							<label for="occup" class="form-label">Visitor's
								occupation</label> <input required name="vOccupation" type="text"
								class="form-control" id="occup">
						</div>

						<div class="mb-3">
							<label for="hostID" class="form-label">Host</label>
							<!-- <input required name="hName" type="text" class="form-control" id="hostName"> -->
							<select required name="hID" class="form-select">
								<option selected="selected" disabled="disabled">--:
									Please Select :--</option>
								<%
								for (employee mcc : list2) {
								%>
								<option value="<%=mcc.getEid()%>"> <%= mcc.getEname() %> || <%= mcc.getEdept() %> </option>
								<%
								}
								%>
							</select>
						</div>

						<div class="mb-3">
							<label for="reason" class="form-label">Reason to visit</label> <select
								required name="vReason" class="form-select" id="reason">
								<option selected="selected" disabled="disabled">--:
									Please Select :--</option>
									<%
									reasonDao dao = new reasonDao(connectionProvider.getConnection());
						            ArrayList<reasons> list = dao.fetchAllReasons();
						            for(reasons rr : list){ %>
						            <option value="<%= rr.getrName() %>"><%= rr.getrName() %>
						            <% } %>
							</select>
						</div>

						<div class="mb-3">
							<label for="number" class="form-label">Visit number</label> <input
								name="vNumber" required type="number" class="form-control"
								id="number" value=0>
						</div>
						<div class="mb-3">
							<label for="EDate" class="form-label">Entry Time</label> <input
								name="eDate" required type="datetime-local" class="form-control"
								id="EDate">
						</div>
						<br>
						<div class="container text-center" id="loader"
							style="display: none;">
							<span class="fa fa-spinner fa-spin fa-4x"></span>
							<h4>Please Wait.....</h4>
						</div>
						
						<div class="text-center">
							<button id="submit-btn" type="submit"
								style="background-color: #4F29C8;" class="btn text-white">Submit</button>
						</div>


					</form>
				</div>
			</div>

		</div>
		<%
		} else {
		%>

		<h1 class="text-center">Kindly Login to access this feature</h1>
		<div class="text-center">
			<a href="login.jsp" style="background-color: #4F29C8;"
				class="btn text-white">LOGIN</a>
		</div>

		<%
		}
		%>
	</div>



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

	<script type="text/javascript">
	 $(document).ready(function(){
		 console.log("ready!");
		 
		 $('#visitor-form').on('submit',function(event){
			
			 event.preventDefault();
			 
			 let form = new FormData(this);
			 
			 $.ajax({
				 url: "newEntryServ",
				 type: "POST",
				 data: form,
				 success: function(data,textStatus, jqXHR){
					 console.log(data);
					 
					 $('#submit-btn').show();
					 $('#loader').hide();
					 
					 if(data.trim()==='Done!'){
					 swal("New Visitor Added Successfully!!")
					 .then((value) => {
					   window.location = "newVisitor.jsp"
					 });
				   }
					 else swal(data);
					 
				 },
				 error: function(jqXHR, textStatus, errorThrown){
					 console.log(jqXHR)
					 $('#submit-btn').show();
					 $('#loader').hide();
					 swal(jqXHR);
				 },
				 processData: false,
				 contentType: false
			 });
			 
		 });
		 
	 });
	</script>







</body>
</html>