<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Page</title>
</head>
<body>
  <%@include file="navbar.jsp" %>
  <div class="container mt-4">
    <h3 class="text-center font-monospace"><u>VISITOR ENTRY MANAGEMENT</u></h3>
    <br>
     <div class="text-center">
    Visitor entry management refers to the process of controlling and tracking the entry and exit of visitors to a facility.
    This can be done using a variety of methods, such as signing in at a reception desk, using a badge or pass to access restricted areas, and recording visitor information in a log book. 
    The goal of visitor entry management is to ensure the safety and security of a facility, as well as to track who has been on the premises and when.
    It is often used in offices, schools, hospitals, and other types of businesses or organizations.<br>
    A visitor entry management system is a system that is used to track and manage the entry and exit of visitors to a facility or premises.
    It typically includes a registration process for visitors, a system for issuing badges or other identification, and a record of the dates and times of entry and exit for each visitor.
    The primary goal of a visitor entry management system is to provide security and control over who has access to a facility.<br>
    This can be important for a variety of reasons, including ensuring the safety of employees and other occupants of the facility, protecting sensitive information or assets, and complying with regulations or policies.
    There are many different types of visitor entry management systems available, ranging from simple sign-in sheets to more sophisticated electronic systems that use biometric data or other methods to identify and track visitors. 
    The specific features and capabilities of a visitor entry management system will depend on the needs of the facility and the level of security required.
     </div>
     <br>
     <% admin a1 = (admin) session.getAttribute("currentUser");
    		if(a1==null){%>
     <div class="text-center lead">Please <mark><u><a href="login.jsp">login</a></u></mark> to get access to all the features.</div>
     <% } %>
  </div>
  
</body>

<!-- scripts -->
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</html>