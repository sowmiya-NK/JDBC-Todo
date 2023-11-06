<%@ page import="org.todo.DAO.TodoDAO" %>
<%@ page import="org.todo.Connection.DbConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="org.todo.Model.Todo" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <%@include file="components/allcss.jsp"%>
    <style type="text/css">
     .c-ho:hover{
     background-color:#f7f7f7;
     }
    </style>
</head>
<body>
<%@include file="components/navbar.jsp"%>
<%
if(loggeduser==null){
response.sendRedirect("login.jsp");
}
%>
<div class="container">
<div class="row p-4">

<%
if(loggeduser!=null){
TodoDAO dao=new TodoDAO(DbConnect.getConnection());
List<Todo> Usertodos=dao.getAllTodos(loggeduser.getId());

for(Todo todo:Usertodos){
%>
<div class="col-md-3">
<div class="card c-ho">
<div class="card-body">
<p>Todo Item: <%=todo.getTodoItem()%></p>
<div class="text-center">
<a class="btn btn-info btn-sm text-white">Edit</a>
<a class="btn btn-danger btn-sm text-white">Delete</a>
</div>
</div>
</div>
</div>
<%
}
}
%>
</div>
</div>
</body>
</html>