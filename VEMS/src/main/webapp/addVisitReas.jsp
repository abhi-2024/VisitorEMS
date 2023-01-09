<%@page import="com.helper.connectionProvider"%>
<%@page import="com.dao.reasonDao"%>
<%@page import="com.entities.reasons"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Visiting Reasons</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
</head>
<body style="background-image: url('img/bg-01.jpg'); background-repeat: no-repeat; background-size: cover;">

 <%@include file="navbar.jsp" %>

<% 
  msg m2 = (msg)session.getAttribute("vMSG");
%>

 <div class="d-flex align-items-center" style="height: 80vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-4">
					<div class="card">

						<div class="card-header text-white text-center"
							style="background-color: #212529;">
							<h2><i class="fa-solid fa-circle-plus"></i> Visiting Reasons</h2>
						</div>
						<%						 
						 if(m2!=null){
						%>
						
						<div class="alert <%=m2.getCssClass() %>" role="alert">
						 <%= m2.getContent() %>
						</div>
						
						<%
						 session.removeAttribute("vMSG");
						 } %>
						<div class="card-body">
						   <h4 class="text-center">List of Reasons</h4>
				           <% 
				           reasonDao dao = new reasonDao(connectionProvider.getConnection());
				            ArrayList<reasons> list = dao.fetchAllReasons();
				            for(reasons rr : list){
				           %>
						   <ul class="list-group">
                              <li class="list-group-item">
                              ID_<%= rr.getrId() %> <%= rr.getrName() %>
                              <form action="delReasServ" method="post">
                                <input name="rid" style="display: none;" value="<%= rr.getrId() %>">
                                <button class="btn btn-secondary" style="background-color: white;"><i style="color: red;" class="fa-solid fa-trash"></i></button>
                              </form>
                              </li>
                           </ul>
                           <% } %>
                           <br>
                           <h6 class="text-center"><u>New Reason</u></h6>
                           
							<form action="reasServ" method="post">
							
							 	<div class="form-floating mb-3">
									<input type="text" name="r" class="form-control" id="floatingInput"
										placeholder="Reason title"> <label
										for="floatingInput">Reason</label>
								</div>
								<div class="text-center"><button class="btn btn-primary">Submit</button></div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
 


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