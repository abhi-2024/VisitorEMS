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
<body>
<%@include file="navbar.jsp" %>


 <div class="container mt-5">

		<%
		admin adm = (admin) session.getAttribute("currentUser");
        
		if (adm != null) {
		%>

		<div class="col-md-6 offset-md-3">

			<div class="card">

				<h1 style="background-color: #212529;"
					class="card-header text-white text-center">
					<i class="fa-solid fa-users"></i> New Visitor Entry
				</h1>

                <% 
                 
                  msg m3 = (msg)session.getAttribute("vMsg");
                
                  if(m3!=null){
                	
                	%>
           
                <div class="alert <%= m3.getCssClass() %>" role="alert">
                  <%= m3.getContent() %>
                </div>
                 
                 <% 
                  
                  }
                  session.removeAttribute("vMsg");
                  %>
				<div class="card-body">
					<form id="visitor-form" action="newEntryServ" method="post">

						
			
						<div class="mb-3">
							<label for="name" class="form-label">Visitor's name</label> <input
								type="text" class="form-control" id="name" name="vName">
						</div>
						
						<div class="mb-3">
						  <label class="form-label">Select gender</label><br>
						  
						    <input type="radio" id="male" name="gender" value="Male">
                            <label for="male">Male</label><br>
                            
                            <input type="radio" id="female" name="gender" value="Female">
                            <label for="female">Female</label><br>
                            
                            <input type="radio" id="none" name="gender" value="Not mentioned">
                            <label for="none">Prefer not to say</label>                            
                        </div>
                        
						<div class="mb-3">
							<label for="email" class="form-label">Visitor's  email</label>
							<input name="vEmail" type="email" class="form-control"
								id="email">
						</div>

						<div class="mb-3">
                          <label for="address" class="form-label">Visitor's  address</label>
							<textarea name="vAddress" id="address" class="form-control" rows="3"></textarea>

						</div>

                         <div class="mb-3">
							<label for="occup" class="form-label">Visitor's  occupation</label>
							<input name="vOccupation" type="text" class="form-control" id="occup">
						</div>

                          
                         <div class="mb-3">
							<label for="hostName" class="form-label">Host's name</label>
							<input name="hName" type="text" class="form-control" id="hostName">
						</div> 
						
                         <div class="mb-3">
							<label for="hostOccupation" class="form-label">Host's occupation</label>
							<input name="hOccupation" type="text" class="form-control" id="hostOccupation">
						</div>
						
                         <div class="mb-3">
							<label for="reason" class="form-label">Reason to visit</label>
							<input name="vReason" type="text" class="form-control" id="reason">
						</div>
												                         
                         <div class="mb-3">
							<label for="number" class="form-label">Visit number</label>
							<input name="vNumber" type="number" class="form-control" id="number" value=0>
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



				<div class="card-footer"></div>



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