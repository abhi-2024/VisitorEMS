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
<title>Sign Up</title>
</head>

<body style="background-image: url('img/bg-01.jpg'); background-repeat: no-repeat; background-size: cover;">
	<%@include file="navbar.jsp"%>
	<div class="d-flex align-items-center" style="height: 80vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-4">
					<div class="card">

						<div class="card-header text-center" style="background:linear-gradient(to bottom left, #ff3399 0%, #33ccff 100%);">
							
							<h2><span class="fa fa-sign-in"></span> Sign Up</h2>
						</div>
						<div class="card-body">



							<form action="registerServ" id="reg-form" method="POST">
								<div class="mb-3">

									<label for="inputName" class="form-label">Name</label> <input
										type="text" name="adminName" required class="form-control"
										id="inputName">
								</div>

								<div class="mb-3">
									<label for="Email" class="form-label">Email address</label> <input
										required type="email" name="adminEmail" class="form-control"
										id="Email" aria-describedby="emailHelp">
									<div id="emailHelp" class="form-text">We'll never share
										your email with anyone else.</div>
								</div>

								<div class="mb-3">
									<label for="Password" class="form-label">Password</label> <input
										type="password" required name="adminPassword"
										class="form-control" id="Password">
								</div>

								<div class="mb-3 form-check">
									<input type="checkbox" required name="adminCheck"
										class="form-check-input" id="exampleCheck1"> <label
										class="form-check-label" for="exampleCheck1"><a
										target="_blank" href="Terms.html" class="link-dark">Agree
											to terms & conditions</a></label>
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
		 
		 $('#reg-form').on('submit',function(event){
			
			 event.preventDefault();
			 
			 let form = new FormData(this);
			 
			 $.ajax({
				 url: "registerServ",
				 type: "POST",
				 data: form,
				 success: function(data,textStatus, jqXHR){
					 console.log(data);
					 
					 $('#submit-btn').show();
					 $('#loader').hide();
					 
					 if(data.trim()==='Done!'){
					 swal("Sign-up success !!")
					 .then((value) => {
					   swal("Redirecting to login page...")
					   window.location = "login.jsp"
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