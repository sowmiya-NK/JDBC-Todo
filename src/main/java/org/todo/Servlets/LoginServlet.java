package org.todo.Servlets;

import org.todo.Connection.DbConnect;
import org.todo.DAO.userDAO;
import org.todo.Model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String lname=req.getParameter("lname");
        String lpassword=req.getParameter("lpassword");
        userDAO dao=new userDAO(DbConnect.getConnection());
        User loggedInuser=dao.loginUser(lname,lpassword);
        HttpSession session=req.getSession();
        if (loggedInuser!=null){
            session.setAttribute("user",loggedInuser);
            resp.sendRedirect("index.jsp");
            // System.out.println("user is logged in" +loggedInuser);
        }
        else {
            session.setAttribute("invalidMsg","invalid Credentials!!");
            resp.sendRedirect("login.jsp");
            System.out.println("user is not logged in" +loggedInuser);
        }
    }
}