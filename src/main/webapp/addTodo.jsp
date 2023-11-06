<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="components/allcss.jsp"%>
</head>
<body>
<body style="background-color:#f7faf8">
<%@include file="components/navbar.jsp"%>
<%
if(loggeduser==null){
response.sendRedirect("login.jsp");
}
%>
<div class="container-fluid">
<div class="row p-3">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center text-success"> Todos Page </h4>
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

<form method="post" action="add">
  <div class="mb-3">
  <% if (loggeduser != null)
  {
   %>
   <input type="hidden" value="<%= loggeduser.getId() %>" name="userid"/>
   <%
   }
   %>
    <label for="exampleInputEmail1" class="form-label">Add TodoItem</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="addtodo">
  </div>
  <div class="text-center mt-2">
  <button type="submit" class="btn btn-success">Save Todo</button>
  </div>
</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>