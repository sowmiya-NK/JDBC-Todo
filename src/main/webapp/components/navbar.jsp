<%@ page import="org.todo.Model.User" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp"><i class="fa-solid fa-house"></i>Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="addTodo.jsp"><i class="fa-solid fa-square-plus"></i>Add Todo</a>
        </li>
        <li class="nav-item">
                  <a class="nav-link" href="viewTodo.jsp"><i class="fa-solid fa-eye"></i>View Todo</a>
                </li>
      </ul>
      <% User loggeduser= (User)session.getAttribute("user");
          if(loggeduser==null){
          %>
              <form class="d-flex" role="search">
               <a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-user"></i>Log In</a>
               <a href="register.jsp" class="btn btn-danger mx-2"><i class="fa-solid fa-user"></i>Register</a>
               </form>
           <%
          }
          else{
          %>
             <form class="d-flex" role="search">
               <button class="btn btn-info"><i class="fa-solid fa-user"></i><%=loggeduser.getName()%></button>
               </form>
               <form class="d-flex" role="search" action="logout">
                 <a data-bs-toggle="modal" data-bs-target="#exampleModal"  class="btn btn-danger mx-2"><i class="fa-solid fa-user"></i>Log Out</a>
                </form>
          <%
          }
      %>
    </div>
  </div>


  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Log Out Alert!!</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
        <h6>Do you want to Log out..</h6>
         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                   <a href="logout" class="btn btn-danger">Logout</a>
        </div>

      </div>
    </div>
  </div>
</nav>