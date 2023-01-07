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
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js">
	
</script>
<script type="text/javascript">
	(function() {
		emailjs.init("muaJHT6SDaiHcpwob");
	})();
</script>
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
				<thead style="background-color: #63e6be">
					<tr>
						<th scope="col">S.No</th>
						<th scope="col">Visitor's Name</th>
						<th scope="col">Visitor's Email</th>
						<th scope="col">Host</th>
						<th scope="col">Entry Date & Time</th>
						<th scope="col"></th>
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
								<button title="View Details"
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
								<button title="Delete Entry"
									style="background-color: white; color: red;" type="submit"
									class="btn btn-secondary">
									<i class="fa-solid fa-trash"></i>
								</button>
							</form>

						</td>

						<td>
							<form>
							 <input style="display: none;" type="text" id="visitorID" value="<%= vv.getVid() %>">
							 <input style="display: none;" type="text" id="hostName" value="<%= vv.getHname() %>">
							 <input style="display: none;" type="text" id="hostDesk" value="<%= vv.gethDesk()%>">
							 <input style="display: none;" type="text" id="toEmail" value="<%= vv.getVemail()%>">
							 <input style="display: none;" type="text" id="to_name" value="<%= vv.getHname() %>">
							 
							 <input style="display: none;" type="text" id="hostNamee" value="<%= vv.getHname() %>">
							 <input style="display: none;" type="text" id="visitorIDE" value="<%= vv.getVid() %>">
							 <input style="display: none;" type="text" id="visitorName" value="<%= vv.getVname() %>">
							 <input style="display: none;" type="text" id="visitReason" value="<%= vv.getVreason() %>">
							 <input style="display: none;" type="text" id="entryTime" value="<%= vv.geteDate() %>">
							 <input style="display: none;" type="text" id="to_emailE" value="<%= vv.gethEmail() %>">						
								<button type="submit" onclick="sendMail(event)" title="Generate Mail"
									style="background-color: white;" class="btn btn-secondary">
									<i style="color: #183153" class="fa-solid fa-envelope"></i>
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
		
	<script type="text/javascript">
	
	 function sendMail(event) {
		event.preventDefault();
		var params = {
				visitorID : document.getElementById("visitorID").value,
		        hostName : document.getElementById("hostName").value,
		        hostDesk : document.getElementById("hostDesk").value,
		        to_email : document.getElementById("toEmail").value,				
		};
		var params2 = {
				to_name : document.getElementById("hostNamee").value,
				VisitorID : document.getElementById("visitorIDE").value,
				visitorName : document.getElementById("visitorName").value,
				visitReason : document.getElementById("visitReason").value,
				entryTime : document.getElementById("entryTime").value,
				To_Email : document.getElementById("to_emailE").value,				
		};
		emailjs.send("service_3rilxgm","template_xa3t1ro",params).then(function(res){
			console.log("success",res.status);
			alert("Success!");	
		});
	    emailjs.send("service_3rilxgm","template_q837rmw",params2).then(function(res){
			console.log("success!!",res.status);
			alert("Success!");

		})
	}
	</script>
</body>
</html>