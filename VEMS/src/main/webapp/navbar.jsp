<%@page import="com.entities.admin"%>

<%
 admin a = (admin)session.getAttribute("currentUser");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">
    <i class="fa-solid fa-users"></i> 
    Visitor Entry
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="dashboard.jsp">Dashboard</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link active dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Visitors
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">New Visitor</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">View Visitors</a></li>
          </ul>
        </li>
        <% if(a!=null){ %>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="login.jsp"><i class="fa-solid fa-shield"></i> Profile </a>
        </li>
        <% 
        }
        else{
        %>
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="login.jsp"><i class="fa-solid fa-shield"></i> Login </a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="signup.jsp"><i class="fa fa-user-plus"></i> Sign Up </a>
        </li>
        <% } %>
      </ul>
    </div>
  </div>
</nav>