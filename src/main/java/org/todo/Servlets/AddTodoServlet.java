package org.todo.Servlets;

import org.todo.Connection.DbConnect;
import org.todo.DAO.TodoDAO;
import org.todo.Model.Todo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AddTodoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int userId=Integer.parseInt(req.getParameter("userid"));
        String addedTodoItem=req.getParameter("addtodo");
        System.out.println(addedTodoItem);
        System.out.println("userId of particular loggedIn user:" +userId +" "+"Item added:" +addedTodoItem);

        Todo todo=new Todo(addedTodoItem,userId);
        TodoDAO dao=new TodoDAO(DbConnect.getConnection());
        HttpSession session= req.getSession();
        boolean todovalue= dao.addTodo(todo);
        if (todovalue){
            session.setAttribute("successMsg" ,"Your Todo is saved");
            resp.sendRedirect("addTodo.jsp");
        }
        else {
            session.setAttribute("ErrorMsg" ,"Server exception");
            resp.sendRedirect("addTodo.jsp");
        }
    }
}