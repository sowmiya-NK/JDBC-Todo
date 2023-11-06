<html>
<head>
<%@include file="components/allcss.jsp"%>
</head>
<body style="background-color:#f7faf8">
<%@include file="components/navbar.jsp"%>
<div class="container-fluid">
<div class="row p-3">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center text-success"> Login page </h4>
<% String msg=(String)session.getAttribute("invalidMsg");
    if(msg!=null){
    %>
      <p class="text-center text-danger"><%=msg %></p>
    <%
    session.removeAttribute("invalidMsg");
    }
 %>
 <% String logoutmsg1=(String)session.getAttribute("logoutmsg");
     if(logoutmsg1!=null){
     %>
       <p class="text-center text-success"><%=logoutmsg1 %></p>
     <%
     session.removeAttribute("logoutmsg");
     }
  %>
<form action="login" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="lname">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="lpassword">
  </div>
  <div class="text-center mt-2">
  <button type="submit" class="btn btn-primary">Login</button>
  </div>
</form>
</div>
</div>
</div>
</div>
</div>
<div style="margin-top:250px">
<%@include file="components/footer.jsp"%>
</div>
</body>
</html>
