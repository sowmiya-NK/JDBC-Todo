<html>
<head>
<%@include file="components/allcss.jsp"%>
</head>
<body style="background-color:#f7faf8">
<%@include file="components/navbar.jsp"%>
<div class="container-fluid">
<div class="row p-3">
<div class="col-md-6 offset-md-3">
<div class="card">
<div class="card-body">
<h4 class="text-center text-success"> Registration page </h4>
<% String msg=(String)session.getAttribute("successMsg");
   String Errormsg=(String)session.getAttribute("ErrorMsg");
    if(msg!=null){
    %>
      <p class="text-center text-success"><%=msg %></p>
    <%
    session.removeAttribute("successMsg");
    }

    if(Errormsg!=null){
       %>
         <p class="text-center text-success"><%=msg %></p>
        <%
        session.removeAttribute("ErrorMsg");
    }
 %>
<form action="register" method="post">
  <div class="mb-3">
   <div class="mb-3">
      <label for="exampleInputEmail1" class="form-label">Enter Name</label>
      <input type="text" class="form-control" id="exampleInputEmail1" name="name" aria-describedby="emailHelp">
    </div>
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" name="password" id="exampleInputPassword1">
  </div>
  <div class="text-center mt-2">
  <button type="submit" class="btn btn-primary">Register</button>
  </div>
</form>
</div>
</div>
</div>
</div>
</div>
<div style="margin-top:173px">
<%@ include file="components/footer.jsp"%>
</div>
</body>
</html>
